from celery.result import AsyncResult
from rest_framework.authentication import TokenAuthentication, SessionAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from oc_api.pyexec.tasks import execute_code
from oc_api.pyexec.models import CeleryExecutionResult, ExecutionResult, TestResult
from . import serializers
from oc_server import models

from enum import IntEnum

class ExecutionState(IntEnum):
    none = -1,
    running = 2,
    success = 0,
    failed = 1,
    metafail = 3

class ExecuteView(APIView):
    authentication_classes = (SessionAuthentication,)
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        """Get status of code execution"""
        def get_response():
            failure_reason = 'An error has occurred.'

            serializer = serializers.ExecutionStateSerializer(data=request.query_params)
            if serializer.is_valid(raise_exception=True):
                result = AsyncResult(request.user.username)
                if result is not None:
                    if result.children is None:
                        failure_reason = 'Could not connect to the execution backend.'
                    elif result.ready():
                        exec_result = CeleryExecutionResult(*result.result)
                        result.forget()  # Don't cache the result if we send it out
                        if not exec_result.mainExecError:
                            reqs = [TestResult(*res) for res in exec_result.results]
                            reqsComplete = 0
                            for req in reqs:
                                if req.success:
                                    reqsComplete += 1

                            if len(reqs) == reqsComplete:
                                profile = models.BaseProfile.objects.get(user=request.user)
                                profile.completed_sections.add(profile.current_section)
                                
                            return ExecutionResult(status=ExecutionState.success,
                                                   result=exec_result.mainExecOutput,
                                                   results=reqs)
                        else:
                            return ExecutionResult(status=ExecutionState.failed,
                                                   result=exec_result.mainExecOutput,
                                                   error=exec_result.mainExecError)
                    else:
                        if result.failed():
                            failure_reason = 'The code attempted to run, but an error occurred.'
                        else:
                            return ExecutionResult(status=ExecutionState.running)
                else:
                    failure_reason = 'The provided token is invalid.'

            return ExecutionResult(status=ExecutionState.metafail, reason=failure_reason)

        return Response(serializers.ExecutionResultSerializer(get_response()).data)

    def post(self, request):
        """Accept some code for execution"""
        serializer = serializers.ExecutionRequestSerializer(data=request.data)
        token = request.user.username

        if serializer.is_valid(raise_exception=True):
            tests = []
            try:
                section_id = serializer.validated_data['section_id']
                section = models.Section.objects.get(id=section_id)
                for req in section.requirements.all():
                    tests.append(req.unitTests)
                profile = models.BaseProfile.objects.get(user=request.user)
                profile.current_section = section
                profile.save()
            except KeyError:  # tests are optional
                pass

            task = execute_code.apply_async(args=(serializer.validated_data['code'],
                                                  tests),
                                            task_id=token)
            return Response({'success': True})

        return Response({'success': False})

    def delete(self, request):
        #TODO: add ability to cancel execution request
        pass

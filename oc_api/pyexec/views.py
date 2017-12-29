from celery.result import AsyncResult
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from oc_api.pyexec.tasks import execute_code, ExecutionResult
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
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        """Get status of code execution"""
        failure_reason = 'An error has occurred.'

        serializer = serializers.ExecutionStateSerializer(data=request.query_params)
        if serializer.is_valid(raise_exception=True):
            result = AsyncResult(request.auth.key)
            if result is not None:
                if result.children is None:
                    failure_reason = 'Could not connect to the execution backend.'
                elif result.ready():
                    exec_result = result.result
                    result.forget()  # Don't cache the result if we send it out
                    if not exec_result['error_output']:
                        return Response({'status': ExecutionState.success, 'result': exec_result['result']})
                    else:
                        return Response({'status': ExecutionState.failed,
                                         'result': exec_result['result'],
                                         'error': exec_result['error_output']})
                else:
                    if result.failed():
                        failure_reason = 'The code attempted to run, but an error occurred.'
                    else:
                        return Response({'status': ExecutionState.running})
            else:
                failure_reason = 'The provided token is invalid.'
        return Response({'status': ExecutionState.metafail, 'reason': failure_reason})

    def post(self, request):
        """Accept some code for execution"""
        serializer = serializers.ExecutionRequestSerializer(data=request.data)
        token = request.auth.key

        if serializer.is_valid(raise_exception=True):
            tests = []
            try:
                section_id = serializer.validated_data['section_id']
                section = models.Section.objects.get(id=section_id)
                for req in section.requirements.all():
                    tests.append(req.unitTests)
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

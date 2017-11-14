from celery.result import AsyncResult
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from oc_api.pyexec.tasks import execute_code
from . import serializers


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
                return Response({'success': True, 'result': result.get()})
            else:
                failure_reason = 'The provided token is invalid.'
        return Response({'success': False, 'reason': failure_reason})

    def post(self, request):
        """Accept some code for execution"""
        serializer = serializers.ExecutionRequestSerializer(data=request.data)
        token = request.auth.key
        if serializer.is_valid(raise_exception=True):
            task = execute_code.apply_async(args=(serializer.validated_data['code'],), task_id=token)
            return Response({'success': True})

        return Response({'success': False})

    def delete(self, request):
        #TODO: add ability to cancel execution request
        pass

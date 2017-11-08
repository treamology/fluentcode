from rest_framework.views import APIView
from rest_framework.response import Response

from celery.result import AsyncResult

from ..tasks import execute_code
from . import serializers

from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

class ExecuteView(APIView):
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)
    
    def get(self, request):
        """Get status of code execution"""
        failure_reason = 'An error has occurred.'

        serializer = serializers.ExecutionStateSerializer(data=request.query_params)
        if serializer.is_valid(raise_exception=True):
            result = AsyncResult(serializer.validated_data['token'])
            if result is not None:
                return Response({'success': True, 'result': result.get()})
            else:
                failure_reason = 'The provided token is invalid.'
        return Response({'success': False, 'reason': failure_reason})

    def post(self, request):
        """Accept some code for execution"""
        serializer = serializers.ExecutionRequestSerializer(data=request.data)
        if serializer.is_valid(raise_exception=True):
            task = execute_code.delay(serializer.validated_data['code'])
            return Response({'success': True, 'token': task.id})

        return Response({'success': False})

    def delete(self, request):
        #TODO: add ability to cancel execution request
        pass

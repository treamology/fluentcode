from rest_framework.response import Response
from rest_framework.views import APIView

from oc_api.pyexec.tasks import add


class TestView(APIView):
    def get(self, request, format=None):
        add.delay(2, 2)
        return Response("{ 'hello': 'hey there' }")

# Create your views here.

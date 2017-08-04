from django.shortcuts import render

from rest_framework.views import APIView
from rest_framework.response import Response

from .tasks import add


class TestView(APIView):
    def get(self, request, format=None):
        add.delay(2, 2)
        return Response("{ 'hello': 'hey there' }")

# Create your views here.

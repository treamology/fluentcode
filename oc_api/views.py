from rest_framework.response import Response
from rest_framework.views import APIView

from oc_api.pyexec.tasks import add
from oc_server import models
from oc_api import serializers

class ListCourses(APIView):
    def get(self):
        courses = models.Course.objects.all()
        names = [{"id": course.id, "name": course.name} for course in courses]
        return Response(names)

class CourseDetail(APIView):
    def get(self, request):
        course_id = request.query_params["id"]
        course = models.Course.objects.get(pk=course_id)
        serializer = serializers.CourseSerializer(course)

        return Response(serializer.data)


class ListLessons(APIView):
    def get(self, request):
        pass

class LessonDetail(APIView):
    def get(self, request):
        pass

class ListSections(APIView):
    def get(self, request):
        pass

class TestView(APIView):
    def get(self, request, format=None):
        add.delay(2, 2)
        return Response("{ 'hello': 'hey there' }")

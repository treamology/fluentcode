from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

from oc_server import models
from oc_api import serializers


class AuthAPIView(APIView):
    authentication_classes = (TokenAuthentication,)
    permission_classes = (IsAuthenticated,)

class ListCourses(AuthAPIView):
    def get(self):
        courses = models.Course.objects.all()
        names = [{"id": course.id, "name": course.name} for course in courses]
        return Response(names)

class CourseDetail(AuthAPIView):
    def get(self, request):
        course_id = request.query_params["id"]
        course = models.Course.objects.get(pk=course_id)
        serializer = serializers.CourseSerializer(course)

        return Response(serializer.data)

class LessonDetail(AuthAPIView):
    def get(self, request):
        lesson_id = request.query_params["id"]
        lesson = models.Lesson.objects.get(pk=lesson_id)
        serializer = serializers.LessonSerializer(lesson)

        return Response(serializer.data)

class SectionDetail(AuthAPIView):
    def get(self, request):
        section_id = request.query_params["id"]
        section = models.Section.objects.get(pk=section_id)
        serializer = serializers.SectionSerializer(section)

        return Response(serializer.data)

class Heartbeat(AuthAPIView):
    def get(self, request):
        return Response()


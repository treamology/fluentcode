from rest_framework.response import Response
from rest_framework.views import APIView

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

class LessonDetail(APIView):
    def get(self, request):
        lesson_id = request.query_params["id"]
        lesson = models.Lesson.objects.get(pk=lesson_id)
        serializer = serializers.LessonSerializer(lesson)

        return Response(serializer.data)

class SectionDetail(APIView):
    def get(self, request):
        section_id = request.query_params["id"]
        section = models.Section.objects.get(pk=section_id)
        serializer = serializers.SectionSerializer(section)

        return Response(serializer.data)

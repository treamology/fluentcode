from rest_framework import serializers

from oc_server import models


class CourseSerializer(serializers.ModelSerializer):
    lessons = serializers.PrimaryKeyRelatedField(many=True, queryset=models.Lesson.objects.all())

    class Meta:
        model = models.Course
        fields = ('id', 'name', 'author', 'lessons')

class LessonSerializer(serializers.ModelSerializer):
    sections = serializers.PrimaryKeyRelatedField(many=True, queryset=models.Section.objects.all())

    class Meta:
        model = models.Lesson
        fields = ('id', 'name', 'number', 'sections')

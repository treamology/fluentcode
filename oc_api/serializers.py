from rest_framework import serializers

from oc_server import models


class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Section
        fields = ('id', 'name', 'number', 'text')


class LessonSerializer(serializers.ModelSerializer):
    #sections = serializers.PrimaryKeyRelatedField(many=True, queryset=models.Section.objects.all())
    sections = SectionSerializer(many=True, read_only=True)

    class Meta:
        model = models.Lesson
        fields = ('id', 'name', 'number', 'sections')


class CourseSerializer(serializers.ModelSerializer):
    # lessons = serializers.PrimaryKeyRelatedField(many=True, queryset=models.Lesson.objects.all())
    lessons = LessonSerializer(many=True, read_only=True)

    class Meta:
        model = models.Course
        fields = ('id', 'name', 'author', 'lessons')

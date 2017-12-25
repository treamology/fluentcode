from rest_framework import serializers

from oc_server import models


class DraggableSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Draggable
        fields = ('id', 'codeName', 'descName', 'descText', 'code')


class SectionSerializer(serializers.ModelSerializer):
    draggables = DraggableSerializer(many=True, read_only=True)
    class Meta:
        model = models.Section
        fields = ('id', 'name', 'number', 'text', 'draggables')


class LessonSerializer(serializers.ModelSerializer):
    sections = SectionSerializer(many=True, read_only=True)

    class Meta:
        model = models.Lesson
        fields = ('id', 'name', 'number', 'sections')


class CourseRequirementSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.SectionRequirement
        fields = ('id', 'description',)


class CourseSerializer(serializers.ModelSerializer):
    lessons = LessonSerializer(many=True, read_only=True)
    draggables = DraggableSerializer(many=True, read_only=True)
    requirements = CourseRequirementSerializer(many=True, read_only=True)

    class Meta:
        model = models.Course
        fields = ('id', 'name', 'author', 'lessons', 'draggables', 'requirements')


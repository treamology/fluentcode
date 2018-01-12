from rest_framework import serializers, viewsets

from oc_server import models


class DraggableTextFieldSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.DraggableTextField
        fields = ('id', 'startChar', 'endChar', 'placeholderText')

class DraggableSerializer(serializers.ModelSerializer):
    textFields = DraggableTextFieldSerializer(many=True)

    class Meta:
        model = models.Draggable
        fields = ('id', 'codeName', 'descName', 'descText', 'code', 'textFields')


class SectionRequirementSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.SectionRequirement
        fields = ('id', 'description')


class SectionSerializer(serializers.ModelSerializer):
    draggables = DraggableSerializer(many=True, read_only=True)
    requirements = SectionRequirementSerializer(many=True, read_only=True)
    lessonNumber = serializers.IntegerField(source='lesson.number', label='lessonNumber')

    class Meta:
        model = models.Section
        fields = ('id', 'name', 'number', 'text', 'draggables', 'requirements', 'lessonNumber')


class LessonSerializer(serializers.ModelSerializer):
    # sections = SectionSerializer(many=True, read_only=True)
    sections = serializers.SerializerMethodField()

    class Meta:
        model = models.Lesson
        fields = ('id', 'name', 'number', 'sections')

    def get_sections(self, obj):
        ordered_queryset = models.Section.objects.filter(lesson__course=obj.course, lesson=obj).order_by('number')
        return SectionSerializer(ordered_queryset, many=True, read_only=True).data


class CourseSerializer(serializers.ModelSerializer):
    #lessons = LessonSerializer(many=True, read_only=True)
    lessons = serializers.SerializerMethodField()
    draggables = DraggableSerializer(many=True, read_only=True)

    class Meta:
        model = models.Course
        fields = ('id', 'name', 'author', 'lessons', 'draggables')

    def get_lessons(self, obj):
        ordered_queryset = models.Lesson.objects.filter(course=obj).order_by('number')
        return LessonSerializer(ordered_queryset, many=True, read_only=True).data

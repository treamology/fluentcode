from rest_framework import serializers, viewsets

from oc_server import models


class DraggableTextFieldSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.DraggableTextField
        fields = ('id', 'startChar', 'endChar', 'lineNumber', 'placeholderText')

class DraggableSerializer(serializers.ModelSerializer):
    textFields = DraggableTextFieldSerializer(many=True)

    class Meta:
        model = models.Draggable
        fields = ('id', 'codeName', 'descName', 'descText', 'code', 'textFields')


class SectionRequirementSerializer(serializers.ModelSerializer):
    completed = serializers.SerializerMethodField(method_name='requirement_completed')

    def requirement_completed(self, obj):
        user = self.context['user']
        base_profile = models.BaseProfile.objects.get(user=user)
        return bool(obj.done_users.filter(id=base_profile.id).exists())

    class Meta:
        model = models.SectionRequirement
        fields = ('id', 'description', 'completed')


class SectionSerializer(serializers.ModelSerializer):
    # draggables = DraggableSerializer(many=True, read_only=True)
    draggables = serializers.SerializerMethodField(method_name='draggable_ids')
    # draggables = serializers.IntegerField(many=True, source='draggables.id')
    requirements = SectionRequirementSerializer(many=True, read_only=True)
    lessonNumber = serializers.IntegerField(source='lesson.number', label='lessonNumber')
    completed = serializers.SerializerMethodField(method_name='section_completed')

    def section_completed(self, obj):
        user = self.context['user']
        base_profile = models.BaseProfile.objects.get(user=user)
        return bool(obj.done_users.filter(id=base_profile.id).exists())

    def draggable_ids(self, obj):
        draggables = obj.draggables.all();
        id_list = [draggable.id for draggable in draggables]
        return id_list

    class Meta:
        model = models.Section
        fields = ('id', 'name', 'number', 'text', 'draggables', 'requirements', 'lessonNumber', 'completed')


class LessonSerializer(serializers.ModelSerializer):
    # sections = SectionSerializer(many=True, read_only=True)
    sections = serializers.SerializerMethodField()

    class Meta:
        model = models.Lesson
        fields = ('id', 'name', 'number', 'sections')

    def get_sections(self, obj):
        ordered_queryset = models.Section.objects.filter(lesson__course=obj.course, lesson=obj).order_by('number')
        return SectionSerializer(ordered_queryset, many=True, read_only=True, context=self.context).data


class CourseSerializer(serializers.ModelSerializer):
    #lessons = LessonSerializer(many=True, read_only=True)
    lessons = serializers.SerializerMethodField()
    draggables = DraggableSerializer(many=True, read_only=True)

    class Meta:
        model = models.Course
        fields = ('id', 'name', 'author', 'lessons', 'draggables')

    def get_lessons(self, obj):
        ordered_queryset = models.Lesson.objects.filter(course=obj).order_by('number')
        return LessonSerializer(ordered_queryset, many=True, read_only=True, context=self.context).data

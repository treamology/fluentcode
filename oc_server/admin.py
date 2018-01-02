from django.contrib import admin

# Register your models here.
from oc_server import models

# admin.site.register(models.Course)
# admin.site.register(models.Section)
# admin.site.register(models.Draggable)
# admin.site.register(models.SectionRequirement)

@admin.register(models.Course)
class CourseAdmin(admin.ModelAdmin):
    list_display = ('name', 'author')

@admin.register(models.Draggable)
class DraggableAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'course')

@admin.register(models.Section)
class SectionAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'lesson_number', 'course')

    def lesson_number(self, obj):
        return obj.lesson.number
    lesson_number.admin_order_field = 'lesson__number'

    def course(self, obj):
        return obj.lesson.course.__str__()
    course.admin_order_field = 'lesson__course'

@admin.register(models.Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ('name',)

@admin.register(models.SectionRequirement)
class SectionRequirementAdmin(admin.ModelAdmin):
    list_display = ('__str__', 'course', 'lesson', 'section')

    def lesson(self, obj):
        return obj.section.lesson.__str__()
    lesson.admin_order_field = 'section__lesson'

    def course(self, obj):
        return obj.section.lesson.course.__str__()
    course.admin_order_field = 'section__lesson__course'

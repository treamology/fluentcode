from django.contrib import admin

# Register your models here.
from oc_server import models

admin.site.register(models.Course)
admin.site.register(models.Section)
admin.site.register(models.Draggable)

@admin.register(models.Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_display = ('name',)

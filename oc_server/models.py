import textwrap
from django.db import models
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django.dispatch import receiver
from django.db.models.signals import post_save

class BaseProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    completed_sections = models.ManyToManyField('Section', related_name='done_users')
    completed_section_requirements = models.ManyToManyField('SectionRequirement', related_name='done_users')

    def __str__(self):
        return self.user.username

class FeedbackSubmission(models.Model):
    user = models.ForeignKey('BaseProfile', related_name='feedback')
    message = models.TextField()
    date = models.DateTimeField()

    def __str__(self):
        return textwrap.shorten(self.message, width=32, placeholder='...')

@receiver(post_save, sender=User)
def create_initial_profile(sender, instance, created, **kwargs):
    if created:
        BaseProfile.objects.create(user=instance)

class Course(models.Model):
    name = models.CharField(max_length=128)
    author = models.CharField(max_length=128)

    def __str__(self):
        return self.name + " by " + self.author


class Lesson(models.Model):
    name = models.CharField(max_length=128)
    number = models.IntegerField()
    course = models.ForeignKey('Course', on_delete=models.CASCADE, null=True, related_name="lessons")

    def __str__(self):
        return "Lesson " + str(self.number) + ": " + self.name


class SectionRequirement(models.Model):

    description = models.CharField(max_length=128)
    unitTests = models.TextField()
    section = models.ForeignKey('Section', related_name='requirements')

    def __str__(self):
        return self.description


class Section(models.Model):
    name = models.CharField(max_length=128)
    number = models.IntegerField()
    text = models.TextField()
    lesson = models.ForeignKey('Lesson', on_delete=models.CASCADE, null=True, related_name="sections")

    def __str__(self):
        return str(self.lesson.number) + "-" + str(self.number) + ": " + self.name


class Draggable(models.Model):
    codeName = models.CharField(max_length=16)
    descName = models.CharField(max_length=16, blank=True, default='')
    descText = models.TextField()
    code = models.TextField()
    course = models.ForeignKey('Course', on_delete=models.CASCADE, null=True, related_name='draggables')
    sections = models.ManyToManyField('Section', related_name='draggables')

    def __str__(self):
        return self.codeName + ' ' + self.descName


class DraggableTextField(models.Model):
    startChar = models.PositiveIntegerField()
    endChar = models.PositiveIntegerField()
    lineNumber = models.PositiveIntegerField()
    placeholderText = models.CharField(max_length=32)

    draggable = models.ForeignKey('Draggable', on_delete=models.CASCADE, related_name='textFields')

    def __str__(self):
        return self.placeholderText + '[' + str(self.startChar) + ', ' + str(self.endChar) + ']'
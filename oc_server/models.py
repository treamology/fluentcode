from django.db import models
from django.contrib.auth.models import User
from django.contrib.postgres.fields import ArrayField
from django.dispatch import receiver
from django.db.models.signals import post_save

class BaseProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    completed_sections = models.ManyToManyField('Section', related_name='done_users')

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
        return "Section Requirement"


class Section(models.Model):
    name = models.CharField(max_length=128)
    number = models.IntegerField()
    text = models.TextField()
    lesson = models.ForeignKey('Lesson', on_delete=models.CASCADE, null=True, related_name="sections")

    def __str__(self):
        return "Section " + str(self.number) + ": " + self.name


class Draggable(models.Model):
    codeName = models.CharField(max_length=16)
    descName = models.CharField(max_length=16)
    descText = models.TextField()
    code = models.TextField()
    course = models.ForeignKey('Course', on_delete=models.CASCADE, null=True, related_name='draggables')
    sections = models.ManyToManyField('Section', related_name='draggables')

    def __str__(self):
        return self.codeName + ' ' + self.descName + ' from ' + str(self.course)

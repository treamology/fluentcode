from django.db import models


class Course(models.Model):
    name = models.CharField(max_length=128)
    author = models.CharField(max_length=128)

    def __str__(self):
        return "Course " + self.name + "by" + self.author

class Lesson(models.Model):
    name = models.CharField(max_length=128)
    number = models.IntegerField()
    course = models.ForeignKey('Course', on_delete=models.CASCADE, null=True, related_name="lessons")

    def __str__(self):
        return "Lesson " + str(self.number) + ": " + self.name


class Section(models.Model):
    name = models.CharField(max_length=128)
    number = models.IntegerField()
    text = models.TextField()
    sections = models.ForeignKey('Lesson', on_delete=models.CASCADE, null=True)

    def __str__(self):
        return "Section " + str(self.number) + ": " + self.name

# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-12-11 00:11
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('oc_server', '0004_auto_20171127_1454'),
    ]

    operations = [
        migrations.CreateModel(
            name='Draggable',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codeName', models.CharField(max_length=16)),
                ('descName', models.CharField(max_length=16)),
                ('descText', models.TextField()),
                ('code', models.TextField()),
                ('course', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='draggables', to='oc_server.Course')),
                ('sections', models.ManyToManyField(related_name='draggables', to='oc_server.Section')),
            ],
        ),
    ]
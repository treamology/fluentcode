# -*- coding: utf-8 -*-
# Generated by Django 1.11.8 on 2018-02-25 22:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('oc_server', '0011_feedbacksubmission'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseprofile',
            name='completed_section_requirements',
            field=models.ManyToManyField(related_name='done_users', to='oc_server.SectionRequirement'),
        ),
    ]

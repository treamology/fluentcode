# -*- coding: utf-8 -*-
# Generated by Django 1.11.9 on 2018-01-15 18:42
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('oc_server', '0009_auto_20180112_2335'),
    ]

    operations = [
        migrations.AddField(
            model_name='baseprofile',
            name='current_section',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='oc_server.Section'),
        ),
    ]
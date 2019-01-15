from __future__ import absolute_import
import os
from celery import Celery
from django.conf import settings

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "oc_backend.settings")
# HOST_MODE = bool(int(os.environ.get('HOST_MODE', False)))

app = Celery("oc_backend")
app.config_from_object("django.conf:settings", namespace="CELERY")
# if not HOST_MODE:
#     app.conf.broker_url = 'redis://redis:6379'
#     app.conf.result_backend = 'redis://redis:6379'
app.autodiscover_tasks()
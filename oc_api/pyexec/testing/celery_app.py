from __future__ import absolute_import
from celery import Celery

app = Celery("oc_backend", broker='redis://localhost', backend='redis://localhost')
app.conf.update(
    accept_content=['json', 'pickle']
)

app.autodiscover_tasks()
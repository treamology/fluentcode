from django.conf.urls import url
from oc_api import views as api_views

urlpatterns = [
    url('^hello/', api_views.TestView.as_view())
]
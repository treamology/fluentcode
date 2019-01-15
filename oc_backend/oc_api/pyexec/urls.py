from django.conf.urls import url, include
from . import views as exec_views

urlpatterns = [
    url(r'^execute', exec_views.ExecuteView.as_view())
]
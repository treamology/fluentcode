from django.conf.urls import url
from oc_api import views as api_views
from oc_api.pyexec import views as exec_views

urlpatterns = [
    url('^hello/', api_views.TestView.as_view()),
    url('^execute_code', exec_views.ExecuteView.as_view())
]
from django.conf.urls import url, include
from oc_api import views as api_views

from rest_framework.authtoken import views as auth_views

urlpatterns = [
    url(r'^hello/', api_views.TestView.as_view()),
    url(r'^get_auth_token', auth_views.obtain_auth_token),
    url(r'^code/', include("oc_api.pyexec.urls"))
]
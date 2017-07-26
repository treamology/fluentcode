from django.conf.urls import url
from oc_server import views as server_views
from django.contrib.auth import views as auth_views

urlpatterns = [
    url(r'^$', auth_views.LoginView.as_view()),
]
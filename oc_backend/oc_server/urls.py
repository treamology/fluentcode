from django.conf.urls import url
from oc_server import views as server_views
from django.contrib.auth import views as auth_views
from oc_server.forms import CustomAuthForm

urlpatterns = [
    url(r'^login/', auth_views.LoginView.as_view(authentication_form=CustomAuthForm)),
    url(r'^$', server_views.frontpage),
    url(r'^register/', server_views.register),
    url(r'^feedback/', server_views.feedback)
]
from django.conf.urls import url, include
from oc_api import views as api_views

from rest_framework.authtoken import views as auth_views

urlpatterns = [
    url(r'^get_auth_token', auth_views.obtain_auth_token),
    url(r'^heartbeat', api_views.Heartbeat.as_view()),
    url(r'^code/', include("oc_api.pyexec.urls")),
    url(r'^learn/courses/list', api_views.ListCourses.as_view()),
    url(r'^learn/courses/detail', api_views.CourseDetail.as_view()),
    url(r'^learn/lessons/detail', api_views.LessonDetail.as_view()),
    url(r'^learn/sections/detail', api_views.SectionDetail.as_view()),
    url(r'^learn/complete_empty_section', api_views.CompleteEmptySection.as_view())
]
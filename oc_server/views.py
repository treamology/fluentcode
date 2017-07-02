from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User


# Create your views here.
def login_page(request):
    if request.POST:
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            html = "<p>You've been logged in</p>"
            return HttpResponse(html)
        else:
            html = """
            <p>Invalid login</p>
            """
            return HttpResponse(html)
    else:
        return render(request, "oc_server/login.html")


# Create your views here.
def register_page(request):
    if request.POST:
        email = request.POST["email"]
        username = request.POST["username"]
        password = request.POST["password"]

        user = User.objects.create_user(username, email, password)

        html = "<p>Successfully created user</p>"
        return HttpResponse(html)

    else:
        return render(request, "oc_server/register.html")
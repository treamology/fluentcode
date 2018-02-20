from django.shortcuts import render, redirect
from oc_server.forms import CustomUserCreationForm, FeedbackForm
from oc_server.models import FeedbackSubmission, BaseProfile
from django.contrib.auth import authenticate, login
import datetime

def register(request):
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=password)
            login(request, user)
            return redirect('/')
    else:
        form = CustomUserCreationForm()
    return render(request, 'registration/register.html', {'form': form})

def feedback(request):
    if request.method == 'POST':
        form = FeedbackForm(request.POST)
        if form.is_valid():
            if request.user:
                user = request.user
                message = form.cleaned_data.get('message')

        feedback_submission = FeedbackSubmission.objects.create(
            user=BaseProfile.objects.get(user=user),
            message=message,
            date=datetime.datetime.now(datetime.timezone.utc)
        )
        feedback_submission.save()
        return redirect('/')
    else:
        form = FeedbackForm()
    return render(request, 'feedback.html', {'form': form})
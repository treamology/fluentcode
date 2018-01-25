from django.contrib.auth.forms import AuthenticationForm, UsernameField, UserCreationForm
from django import forms

class CustomAuthForm(AuthenticationForm):
    username = UsernameField(
        max_length=254,
        widget=forms.TextInput(attrs={'autofocus': True, 'placeholder': 'Username', 'class': 'textInput'}),
    )
    password = forms.CharField(
        strip=False,
        widget=forms.PasswordInput(attrs={'placeholder': 'Password', 'class': 'textInput'}),
    )

class CustomUserCreationForm(UserCreationForm):
    username = UsernameField(
        max_length=254,
        widget=forms.TextInput(attrs={'autofocus': True, 'placeholder': 'Username', 'class': 'textInput'}),
    )
    password1 = forms.CharField(
        strip=False,
        widget=forms.PasswordInput(attrs={'placeholder': 'Password', 'class': 'textInput'})
    )
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={'placeholder': 'Confirm Password', 'class': 'textInput'}),
        strip=False
    )
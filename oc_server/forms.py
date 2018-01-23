from django.contrib.auth.forms import AuthenticationForm, UsernameField
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

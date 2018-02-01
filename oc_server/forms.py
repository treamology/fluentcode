from django.contrib.auth.forms import AuthenticationForm, UsernameField, UserCreationForm
from django.contrib.auth.models import User
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
    email1 = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder': 'E-mail Address', 'class': 'textInput'}))
    email2 = forms.EmailField(widget=forms.EmailInput(attrs={'placeholder': 'Confirm E-mail Address', 'class': 'textInput'}))
    password1 = forms.CharField(
        strip=False,
        widget=forms.PasswordInput(attrs={'placeholder': 'Password', 'class': 'textInput'})
    )
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs={'placeholder': 'Confirm Password', 'class': 'textInput'}),
        strip=False
    )

    def clean_email2(self):
        email1 = self.cleaned_data.get('email1')
        email2 = self.cleaned_data.get('email2')
        if email1 and email2 and email1 != email2:
            raise forms.ValidationError(
                'The two email fields didn\'t match.',
                code='email_mismatch',
            )
        return email2

    def save(self, commit=True):
        user = super(CustomUserCreationForm, self).save(commit=False)
        user.email = self.cleaned_data['email2']
        if commit:
            user.save()
        return user



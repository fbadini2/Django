from django import forms
from django.contrib.auth.forms import SetPasswordForm
from django.contrib.auth.models import User

class EmailForm(forms.Form):
    email = forms.EmailField(label='Email')

class MySetPasswordForm(SetPasswordForm):
    new_password1 = forms.CharField(
        label='Nueva contraseña',
        strip=False,
        widget=forms.PasswordInput(attrs={'autocomplete': 'new-password'}),
        help_text='Ingrese una contraseña segura y no compartida con nadie más.'
    )
    new_password2 = forms.CharField(
        label='Repetir nueva contraseña',
        strip=False,
        widget=forms.PasswordInput(attrs={'autocomplete': 'new-password'}),
    )

    class Meta:
        model = User
        fields = ['new_password1', 'new_password2']



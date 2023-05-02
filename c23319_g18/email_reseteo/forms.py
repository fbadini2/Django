from django import forms
from django.contrib.auth.models import User

class ResetPasswordForm(forms.Form):
    email = forms.EmailField()

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if not User.objects.filter(email=email).exists():
            raise forms.ValidationError('Este correo electrónico no está registrado en nuestro sistema.')
        return email

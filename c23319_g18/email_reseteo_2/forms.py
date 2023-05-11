from django import forms
from django.contrib.auth.forms import PasswordResetForm


class CustomPasswordResetForm(PasswordResetForm):
    email_template_name = 'custom_password_reset_email.html'
    html_email_template_name = 'custom_password_reset_email.html'
    
    username = forms.CharField(label='Nombre de usuario', max_length=30)

    def clean_username(self):
        username = self.cleaned_data.get('username')
        if not username:
            raise forms.ValidationError('Por favor ingrese su nombre de usuario')
        return username

from django.contrib.auth.models import User


class EmailForm(forms.Form):
    email = forms.EmailField(label='Email')


from .models import Profile

class ProfileForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['bio', 'location', 'birthdate']
        labels = {'bio': 'Biografía', 'location': 'Ubicación', 'birthdate': 'Fecha de nacimiento'}
        widgets = {
            'bio': forms.Textarea(attrs={'rows': 3}),
            'location': forms.TextInput(attrs={'placeholder': 'Ciudad, País'}),
            'birthdate': forms.DateInput(attrs={'type': 'date'}),
        }

from django import forms
from django.contrib.auth.forms import PasswordResetForm, SetPasswordForm
from django.contrib.auth.models import User

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


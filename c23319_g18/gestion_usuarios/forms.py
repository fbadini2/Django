from django import forms
from django.contrib.auth.forms import PasswordResetForm, SetPasswordForm, AuthenticationForm, UsernameField
from .models import Usuario
from django.core.exceptions import ValidationError
from django.utils.translation import gettext as _

class RegistroUsuarioForm(forms.ModelForm):
    error_messages = {
        'password_mismatch': 'Las contraseñas no coinciden.',
        'email_taken': 'Este email ya está registrado en nuestra base de datos.'
    }

    password1 = forms.CharField(label='Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    password2 = forms.CharField(label='Confirmar Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    class Meta:
        model = Usuario
        fields = ('nombre', 'apellido', 'email', 'tipo')
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'apellido': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
            'tipo': forms.Select(attrs={'class': 'form-control'}),
        }

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError(self.error_messages['password_mismatch'], code='password_mismatch')
        return password2

    def clean_email(self):
        email = self.cleaned_data.get('email')
        if Usuario.objects.filter(email=email).exists():
            raise forms.ValidationError(self.error_messages['email_taken'], code='email_taken')
        return email

class LoginForm(forms.Form):
    email = forms.EmailField(label='Email', widget=forms.EmailInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label='Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))

class CambiarPasswordForm(forms.Form):
    old_password = forms.CharField(label='Contraseña Antigua', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    new_password1 = forms.CharField(label='Nueva Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    new_password2 = forms.CharField(label='Confirmar Nueva Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    def clean_new_password2(self):
        new_password1 = self.cleaned_data.get('new_password1')
        new_password2 = self.cleaned_data.get('new_password2')
        if new_password1 and new_password2 and new_password1 != new_password2:
            raise forms.ValidationError('Las contraseñas no coinciden.', code='password_mismatch')
        return new_password2

# class CustomPasswordResetForm(PasswordResetForm):
#     email = forms.EmailField(label='Email', widget=forms.EmailInput(attrs={'class': 'form-control'}))

class CustomPasswordResetForm(PasswordResetForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['email'].widget.attrs.update({'class': 'form-control'})
        self.fields['email'].label = ''
        self.fields['email'].help_text = ''
        self.fields['email'].placeholder = 'Email'
        self.fields['email'].error_messages = {'required': 'Debe ingresar un correo electrónico válido'}

        # el mail que vamos a usar como remitente
        self.from_email = 'seguridad.plas@gmail.com'


class CustomSetPasswordForm(SetPasswordForm):
    new_password1 = forms.CharField(label='Nueva Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    new_password2 = forms.CharField(label='Confirmar Nueva Contraseña', widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    def clean_new_password2(self):
        new_password1 = self.cleaned_data.get('new_password1')
        new_password2 = self.cleaned_data.get('new_password2')
        if new_password1 and new_password2 and new_password1 != new_password2:
            raise forms.ValidationError('Las contraseñas no coinciden.', code='password_mismatch')
        return new_password2

# class CustomAuthenticationForm(AuthenticationForm):
#     email = forms.EmailField(required=True)

#     class Meta:
#         fields = ['email', 'password']

class CustomAuthenticationForm(AuthenticationForm):
    username = UsernameField(
        max_length=254,
        widget=forms.TextInput(attrs={'autofocus': True}),
    )
    password = forms.CharField(
        label=_("Password"),
        strip=False,
        widget=forms.PasswordInput,
    )



class CustomCambiarPasswordForm(forms.Form):
    old_password = forms.CharField(label='Contraseña antigua', widget=forms.PasswordInput)
    new_password1 = forms.CharField(label='Contraseña nueva', widget=forms.PasswordInput)
    new_password2 = forms.CharField(label='Confirmar contraseña nueva', widget=forms.PasswordInput)

    def clean_old_password(self):
        old_password = self.cleaned_data.get('old_password')
        if not self.request.user.check_password(old_password):
            raise ValidationError('La contraseña antigua es incorrecta')
        return old_password

    def clean(self):
        new_password1 = self.cleaned_data.get('new_password1')
        new_password2 = self.cleaned_data.get('new_password2')
        if new_password1 and new_password2 and new_password1 != new_password2:
            raise ValidationError('Las contraseñas nuevas no coinciden')
        return self.cleaned_data

class CustomCambiarPasswordForm(SetPasswordForm):
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)

from django.contrib.auth.forms import SetPasswordForm

class CustomSetPasswordForm(SetPasswordForm):
    def __init__(self, user, *args, **kwargs):
        super().__init__(user, *args, **kwargs)
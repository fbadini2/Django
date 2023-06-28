from django import forms
from django.contrib.auth.forms import  SetPasswordForm, AuthenticationForm, UserCreationForm
from django.utils.translation import gettext as _
from django.contrib.auth.models import User

class CustomAuthenticationForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super(CustomAuthenticationForm, self).__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['class'] = 'form-control'
        self.fields['password'].widget.attrs['class'] = 'form-control'


class SignUpForm(UserCreationForm):
    username = forms.CharField(
        min_length=4,
        max_length=50,
        label='Nombre de usuario'
    )
    password1 = forms.CharField(
        min_length=4,
        max_length=50,
        widget=forms.PasswordInput(),
        label="Contraseña"
    )
    password2 = forms.CharField(
        min_length=4,
        max_length=50,
        widget=forms.PasswordInput(),
        label='Confirmar contraseña'
    )
    first_name = forms.CharField(
    min_length=2,
    max_length=50,
    label='Nombre'
    )
    last_name = forms.CharField(
        min_length=2,
        max_length=50,
        label='Apellido'
    )
    email = forms.CharField(
        widget=forms.EmailInput(),
        label='Email'
    )
    
    def clean_username(self):
        username = self.cleaned_data['username']
        username_taken = User.objects.filter(username=username).exists()
        if username_taken:
            self.add_error('username', 'El nombre de usuario ya esta en uso.')
        return username
    
    def clean_email(self):
        email = self.cleaned_data['email']
        email_taken = User.objects.filter(email=email).exists()
        if email_taken:
            raise forms.ValidationError('El email ya esta en uso.')
        return email

    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')
        if password1 != password2:
           raise forms.ValidationError('Las contraseñas no coinciden.')
        return password2
    
    def save(self,commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password1'])
        if commit:
            user.save()
        return user

    class Meta:
        model = User
        fields = ('username', 'first_name','last_name', 'email', 'password1', 'password2')


class CustomCambiarPasswordForm(SetPasswordForm):
    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super().__init__(*args, **kwargs)



class CustomSetPasswordForm(SetPasswordForm):
    def __init__(self, user, *args, **kwargs):
        super().__init__(user, *args, **kwargs)
from django.shortcuts import render

# Create your views here.
from django.contrib.auth.forms import PasswordResetForm, SetPasswordForm
from django.contrib.auth.views import PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView, LoginView
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse_lazy
from django.views.generic import CreateView, FormView, View
from django.shortcuts import redirect
from django.contrib import messages
from .models import Usuario
from .forms import RegistroUsuarioForm, CustomPasswordResetForm, CustomSetPasswordForm, CustomAuthenticationForm, CustomCambiarPasswordForm
from django.contrib.auth.mixins import LoginRequiredMixin
from .forms import CustomCambiarPasswordForm, CustomSetPasswordForm
from django.contrib.auth.views import PasswordChangeView
from django.views.generic.base import TemplateView
from django.contrib.auth.decorators import login_required


class RegistroUsuarioView(CreateView):
    form_class = RegistroUsuarioForm
    template_name = 'gestion_usuarios/registro_usuario.html'
    success_url = reverse_lazy('login')

    def form_valid(self, form):
        response = super().form_valid(form)
        username = form.cleaned_data.get('email')
        password = form.cleaned_data.get('password1')
        user = authenticate(self.request, username=username, password=password)
        login(self.request, user)
        return response


class LoginView(FormView):
    template_name = 'gestion_usuarios/login.html'
    form_class = CustomAuthenticationForm
    success_url = reverse_lazy('index')

# class CustomLoginView(LoginView):
#     template_name = 'gestion_usuarios/login.html'
#     form_class = CustomAuthenticationForm
#     success_url = reverse_lazy('index')

    def form_valid(self, form):
        username = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password')
        user = authenticate(self.request, username=username, password=password)
        if user is not None:
            login(self.request, user)
            return super().form_valid(form)
        else:
            messages.error(self.request, 'El usuario o la contraseña son incorrectos')
            return super().form_invalid(form)


class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect('login')


class CambiarPasswordView(LoginRequiredMixin, PasswordChangeView):
    form_class = CustomCambiarPasswordForm
    success_url = reverse_lazy('gestion_usuarios:cambiar_password_done')
    template_name = 'gestion_usuarios/cambiar_password.html'
    extra_context = {'password_form': CustomSetPasswordForm(user=None)}

class CambiarPasswordDoneView(TemplateView):
    template_name = 'gestion_usuarios/cambiar_password_done.html'
    success_url = reverse_lazy('gestion_usuarios:cambiar_password_done')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)        
        context['login_url'] = reverse_lazy('login')
        return context
# class CambiarPasswordView(FormView):
#     form_class = CustomCambiarPasswordForm
#     template_name = 'gestion_usuarios/cambiar_password.html'
#     success_url = reverse_lazy('inicio')

#     def dispatch(self, request, *args, **kwargs):
#         if not request.user.is_authenticated:
#             return redirect('login')
#         return super().dispatch(request, *args, **kwargs)

#     def form_valid(self, form):
#         form.request = self.request  # pasamos el request al form
#         form.save()
#         return super().form_valid(form)
#         old_password = form.cleaned_data.get('old_password')
#         new_password1 = form.cleaned_data.get('new_password1')
#         new_password2 = form.cleaned_data.get('new_password2')
#         if not self.request.user.check_password(old_password):
#             form.add_error('old_password', 'La contraseña antigua es incorrecta')
#             return self.form_invalid(form)
#         if new_password1 != new_password2:
#             form.add_error('new_password2', 'Las contraseñas nuevas no coinciden')
#             return self.form_invalid(form)
#         self.request.user.set_password(new_password1)
#         self.request.user.save()
#         return super().form_valid(form)


class CustomPasswordResetView(PasswordResetView):
    form_class = CustomPasswordResetForm
    email_template_name = 'gestion_usuarios/password_reset_email.html'
    template_name = 'gestion_usuarios/password_reset_form.html'
    success_url = reverse_lazy('password_reset_done')


class CustomPasswordResetDoneView(PasswordResetDoneView):
    template_name = 'gestion_usuarios/password_reset_done.html'
    success_url = reverse_lazy('password_reset_done')


class CustomPasswordResetConfirmView(PasswordResetConfirmView):
    form_class = CustomSetPasswordForm
    template_name = 'gestion_usuarios/password_reset_confirm.html'
    success_url = reverse_lazy('password_reset_complete')


class CustomPasswordResetCompleteView(PasswordResetCompleteView):
    template_name = 'gestion_usuarios/password_reset_complete.html'

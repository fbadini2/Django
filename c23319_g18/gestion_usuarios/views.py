from typing import Any
from django.shortcuts import render

# Create your views here.
from django import forms
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import PasswordChangeView
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import redirect
from django.http import HttpResponseRedirect
from django.urls import reverse_lazy
from django.views.generic import FormView, View
from django.views.generic.base import TemplateView
from .forms import  CustomSetPasswordForm, CustomAuthenticationForm, CustomCambiarPasswordForm, SignUpForm
from django.contrib.auth.validators import UnicodeUsernameValidator
from django.contrib.auth import password_validation, authenticate, login
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.views.decorators.cache import never_cache
from django.views.decorators.csrf import csrf_protect


def signup(request):
    form = SignUpForm()
    if request.method == "POST":
        form = SignUpForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            form.save()
            messages.success(request, 'Registro exitoso para ' + username)
            # new_user = authenticate(username=username, password=password)
            # if new_user is not None:
            #     login(request, new_user)
            return redirect('login')
    return render(request, 'gestion_usuarios/signup.html',{'form':form})

class LoginView(FormView):
    template_name = 'gestion_usuarios/login.html'
    form_class = CustomAuthenticationForm
    success_url = reverse_lazy('index')

    @method_decorator(csrf_protect)
    @method_decorator(never_cache)
    def dispatch(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            return HttpResponseRedirect(self.get_success_url())
        else:
            return super(LoginView,self).dispatch(request, *args, **kwargs)
        
    def form_valid(self, form):
        username = form.cleaned_data.get('username')
        password = form.cleaned_data.get('password')
        user = authenticate(self.request, username=username, password=password)
        if user is not None:
            login(self.request, user)
            return super().form_valid(form)
        else:
            messages.error(self.request, 'La combinación de usuario y contraseña no coinciden')
            return super().form_invalid(form)

@method_decorator(login_required, name='dispatch')
class LogoutView(View):
    def get(self, request):
        logout(request)
        return redirect('login')

@method_decorator(login_required, name='dispatch')
class CambiarPasswordView(LoginRequiredMixin, PasswordChangeView):
    form_class = CustomCambiarPasswordForm
    success_url = reverse_lazy('gestion_usuarios:cambiar_password_done')
    template_name = 'gestion_usuarios/cambiar_password.html'
    extra_context = {'password_form': CustomSetPasswordForm(user=None)}
    
@method_decorator(login_required, name='dispatch')
class CambiarPasswordDoneView(TemplateView):
    template_name = 'gestion_usuarios/cambiar_password_done.html'
    success_url = reverse_lazy('gestion_usuarios:cambiar_password_done')

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)        
        context['login_url'] = reverse_lazy('login')
        return context

def page_not_found_view(request, exception):
    return render(request, '404.html', status=404)
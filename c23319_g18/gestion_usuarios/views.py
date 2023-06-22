from django.shortcuts import render

# Create your views here.
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.views import PasswordChangeView
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.views.generic import FormView, View
from django.views.generic.base import TemplateView
from .forms import  CustomSetPasswordForm, CustomAuthenticationForm, CustomCambiarPasswordForm
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator



# class RegistroUsuarioView(CreateView):
#     form_class = RegistroUsuarioForm
#     template_name = 'gestion_usuarios/registro_usuario.html'
#     success_url = reverse_lazy('login')

#     def form_valid(self, form):
#         response = super().form_valid(form)
#         username = form.cleaned_data.get('email')
#         password = form.cleaned_data.get('password1')
#         user = authenticate(self.request, username=username, password=password)
#         login(self.request, user)
#         return response


class LoginView(FormView):
    template_name = 'gestion_usuarios/login.html'
    form_class = CustomAuthenticationForm
    success_url = reverse_lazy('index')


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
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import messages
from django.core.mail import send_mail
from django.conf import settings
from django.utils.crypto import get_random_string
from .forms import EmailForm, PasswordResetForm, MySetPasswordForm
from django.http import Http404
from django.core.mail import EmailMultiAlternatives
from django.utils.html import strip_tags
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.contrib.auth.views import PasswordResetCompleteView

def enviar_email_reseteo_password(user_email, token, request):
    subject = 'Reseteo de Contraseña'
    html_message = render_to_string('email_reseteo_2/email_reseteo_password.html', {'token': token, 'user_email': user_email, 'request': request})
    plain_message = strip_tags(html_message)
    from_email = 'from@example.com'
    recipient_list = [user_email]
    send_mail(subject, plain_message, from_email, recipient_list, html_message=html_message)

from django.template.loader import render_to_string

from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string

def resetear_password(request):
    if request.method == 'POST':
        form = EmailForm(request.POST)
        if form.is_valid():
            user_email = form.cleaned_data['email']
            user = User.objects.filter(email=user_email).first()
            if user:
                # Generamos un token aleatorio para el link de reseteo
                token = get_random_string(length=32)
                # Creamos un registro en la base de datos con el token y el usuario correspondiente
                user.set_password_token = token
                user.save()
                # Renderizamos el template de correo electrónico
                html_content = render_to_string('email_reseteo_2/reset_password_email.html', {
                    'token': token,
                    'user_email': user_email,
                    'reset_url': f'http://{request.get_host()}/email_reseteo_2/reset_password/{token}/{user_email}'
                })
                # Enviamos el correo electrónico con el link de reseteo
                msg = EmailMultiAlternatives(
                    subject='Reseteo de contraseña',
                    body='Este es un correo electrónico de prueba',
                    from_email=settings.EMAIL_HOST_USER,
                    to=[user_email]
                )
                msg.attach_alternative(html_content, 'text/html')
                msg.send()
                return redirect('email_reseteo_2:resetear_password_done')
            else:
                messages.error(request, 'El email no está registrado en nuestro sistema.')
        else:
            messages.error(request, 'Formulario no válido. Por favor, inténtalo de nuevo.')
    else:
        form = EmailForm()
    return render(request, 'email_reseteo_2/resetear_password.html', {'form': form})

def resetear_password_confirm(request, token, user_email):
    try:
        user = User.objects.get(email=user_email)
    except User.DoesNotExist:
        raise Http404("Token inválido o expirado.")

    if request.method == 'POST':
        form = MySetPasswordForm(user=user, data=request.POST)
        if form.is_valid():
            form.save()
            return redirect('email_reseteo_2:password_reset_complete')
    else:
        form = MySetPasswordForm(user=user)

    return render(request, 'email_reseteo_2/resetear_password_confirm.html', {'form': form})

def resetear_password_done(request):
    return render(request, 'email_reseteo_2/confirmacion_envio.html')

class EmailPasswordResetCompleteView(PasswordResetCompleteView):
    template_name = 'email_reseteo_2/password_reset_complete.html'
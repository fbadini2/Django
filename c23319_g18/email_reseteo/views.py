from django.shortcuts import render

# Create your views here.
# email_reseteo/views.py
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.shortcuts import render, redirect
from django.urls import reverse
from django.contrib import messages
from email_reseteo.forms import ResetPasswordForm
from django.conf import settings
import smtplib

def reset_password(request):
    if request.method == 'POST':
        form = ResetPasswordForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']

            # Generar el enlace para resetear la contraseña
            reset_password_url = request.build_absolute_uri(reverse('password_reset_confirm', kwargs={'uidb64': 'placeholder', 'token': 'placeholder'}))
            reset_password_url = reset_password_url.replace('placeholder', '{}')
            # reset_password_url = request.build_absolute_uri(reverse('password_reset_confirm'))
            # reset_password_url += f'?email={email}'

            # Renderizar el cuerpo del correo electrónico utilizando una plantilla HTML
            html_content = render_to_string('email_reseteo/reset_password_email.html', {'reset_password_url': reset_password_url})

            # Configurar los detalles de la cuenta de correo electrónico
            smtp_server = settings.EMAIL_HOST
            smtp_port = settings.EMAIL_PORT
            smtp_username = settings.EMAIL_HOST_USER
            smtp_password = settings.EMAIL_HOST_PASSWORD

            # Crear una instancia de SMTP y establecer una conexión segura
            smtp_conn = smtplib.SMTP(smtp_server, smtp_port)
            smtp_conn.ehlo()
            smtp_conn.starttls()
            smtp_conn.ehlo()

            # Autenticar la conexión utilizando las credenciales de la cuenta de correo electrónico
            smtp_conn.login(smtp_username, smtp_password)

            # Enviar el correo electrónico
            subject = 'Resetear contraseña'
            from_email = settings.DEFAULT_FROM_EMAIL
            to_email = email
            message = EmailMultiAlternatives(subject, html_content, from_email, [to_email])
            message.attach_alternative(html_content, 'text/html')
            message.send()

            # Cerrar la conexión SMTP
            smtp_conn.quit()

            messages.success(request, 'Se ha enviado un correo electrónico a la dirección indicada.')
            return redirect('email_reseteo:reset_password_done')
    else:
        form = ResetPasswordForm()
    return render(request, 'email_reseteo/reset_password.html', {'form': form})

def reset_password_done(request):
    return render(request, 'email_reseteo/reset_password_done.html')

# from django.core.mail import send_mail
# from gestion_usuarios.forms import ResetPasswordForm
# from gestion_usuarios.models import UserProfile
# import smtplib

# def reset_password(request):
#     if request.method == 'POST':
#         form = ResetPasswordForm(request.POST)
#         if form.is_valid():
#             email = form.cleaned_data['email']
#             user = UserProfile.objects.get(user__email=email).user
#             # Generamos un token único para el usuario y lo guardamos en la base de datos
#             token = user.generate_reset_token()
#             user.save()

#             # Preparamos el correo electrónico
#             subject = 'Resetear contraseña de mi_app'
#             message = f'Hola {user.username},\n\nPara resetear tu contraseña, haz click en el siguiente enlace: {request.build_absolute_uri("/reset-password-confirm/" + token)}\n\nSi no has solicitado resetear tu contraseña, ignora este mensaje.\n\nGracias,\nEl equipo de mi_app'
#             from_email = 'noreply@mi_app.com'
#             recipient_list = [email]
#             # Enviamos el correo electrónico
#             send_mail(subject, message, from_email, recipient_list)

#             return render(request, 'email_reseteo/reset_password_done.html')
#     else:
#         form = ResetPasswordForm()

#     return render(request, 'email_reseteo/reset_password.html', {'form': form})

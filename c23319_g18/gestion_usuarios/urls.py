from django.urls import path, include
from django.contrib.auth import views as auth_views
from .views import  CambiarPasswordDoneView, RegistroUsuarioView, LoginView, LogoutView, CambiarPasswordView, CustomPasswordResetView, CustomPasswordResetDoneView, CustomPasswordResetConfirmView, CustomPasswordResetCompleteView

app_name = 'gestion_usuarios'

urlpatterns = [
    
    path('registro/', RegistroUsuarioView.as_view(), name='registro'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('cambiar_password/', CambiarPasswordView.as_view(), name='cambiar_password'),
    path('cambiar_password/done/', CambiarPasswordDoneView.as_view(), name='cambiar_password_done'),

    # URLs para resetear la contraseña
    # path('password_reset/', CustomPasswordResetView.as_view(), name='password_reset'),
    # path('password_reset/done/', CustomPasswordResetDoneView.as_view(), name='password_reset_done'),
    # path('reset/<uidb64>/<token>/', CustomPasswordResetConfirmView.as_view(), name='password_reset_confirm'),
    # path('reset/done/', CustomPasswordResetCompleteView.as_view(), name='password_reset_complete'),

    path('academia/', include('academia.urls'), name='index'), # redirección a la app academia
]

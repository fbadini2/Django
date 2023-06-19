from django.urls import path
from . import views
from .views import EmailPasswordResetCompleteView
app_name = 'email_reseteo_2'

urlpatterns = [
    path('reset_password/', views.resetear_password, name='resetear_password'),
    path('reset_password/<str:token>/<str:user_email>/', views.resetear_password_confirm, name='resetear_password_confirm'),
    path('password_reset/done/', views.resetear_password_done, name='resetear_password_done'),
    path('reset/done/', EmailPasswordResetCompleteView.as_view(), name='password_reset_complete'),
    #path('perfil/', views.profile, name='profile'),
]


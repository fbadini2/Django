from django.urls import path, include
from django.contrib.auth import views as auth_views
from .views import  CambiarPasswordDoneView, LoginView, LogoutView, CambiarPasswordView
from django.contrib import admin

app_name = 'gestion_usuarios'

urlpatterns = [
    
    # path('registro/', RegistroUsuarioView.as_view(), name='registro'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('cambiar_password/', CambiarPasswordView.as_view(), name='cambiar_password'),
    path('cambiar_password/done/', CambiarPasswordDoneView.as_view(), name='cambiar_password_done'),
    path('academia/', include('academia.urls'), name='index'), # redirección a la app academia
]

handler404 = "gestion_usuarios.views.page_not_found_view"
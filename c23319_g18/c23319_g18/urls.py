"""c23319_g18 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from gestion_usuarios.views import LoginView
from .views import home
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    # path('',include('login2.urls'),name='index'),
    # #path('',include('users.urls')),
    # path('', include('registro_app.urls')),
    # path('', include('registro_usuarios.urls')),
    path('', home, name='home'),
    path('gestion_usuarios/login/', LoginView.as_view(), name='login'),
    path('gestion_usuarios/', include('gestion_usuarios.urls'),name='gestion_usuarios'),
    path('email_reseteo_2/', include('email_reseteo_2.urls')),
    #path('email_reseteo/', include('email_reseteo.urls'),name='email_reseteo'),
    path("academia/", include("academia.urls"),name='academia'),
    path('admin/', admin.site.urls,name='admin'),
    path('fotos/', include('fotos.urls')),
    
   
    
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


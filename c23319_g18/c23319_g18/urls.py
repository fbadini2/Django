from django.urls import include, path
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from gestion_usuarios.views import LoginView
from .views import home



urlpatterns = [

    
    # path('', home, name='home'),
    path('', home, name='login'),
    path('gestion_usuarios/', include('gestion_usuarios.urls'),name='gestion_usuarios'),
    path("academia/", include("academia.urls"),name='academia'),
    path('gestion_usuarios/login/', LoginView.as_view(), name='login'),
    path('', include("academia.urls")),
    path('email_reseteo_2/', include('email_reseteo_2.urls')),
    
    path('admin/', admin.site.urls,name='admin'),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


from django.urls import include, path
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [

    path('', include("academia.urls")),
    # path('', home, name='home'),
    # path('gestion_usuarios/login/', LoginView.as_view(), name='login'),
    # path('gestion_usuarios/', include('gestion_usuarios.urls'),name='gestion_usuarios'),
    # path('email_reseteo/', include('email_reseteo.urls'),name='email_reseteo'),
    # path('email_reseteo_2/', include('email_reseteo_2.urls')),
    # #path('email_reseteo/', include('email_reseteo.urls'),name='email_reseteo'),
    # path("academia/", include("academia.urls"),name='academia'),
    # path('admin/', admin.site.urls,name='admin'),
    path('admin/', admin.site.urls),
    
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)



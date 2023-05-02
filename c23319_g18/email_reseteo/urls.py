from django.urls import path
from email_reseteo import views

app_name = 'email_reseteo'

urlpatterns = [
    path('reset_password/', views.reset_password, name='reset_password'),
    path('reset_password_done/', views.reset_password_done, name='reset_password_done'),
]


# from django.urls import path
# from email_reseteo.views import reset_password

# app_name = 'email_reseteo'
# urlpatterns = [
#     path('reset_password/', reset_password, name='reset_password'),
#     path('reset_mail_sent/', )
# ]

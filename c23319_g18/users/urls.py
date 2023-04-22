from django.urls import path
from .views import MyLoginView

urlpatterns = [
    path('', MyLoginView.as_view(),name='index'),
    path('login/', MyLoginView.as_view(),name='login'),
]

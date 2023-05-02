from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('informes', views.informes, name='informes'),
    path('alumnos', views.alumnos, name='alumnos'),
    path('profesores', views.profesores, name='profesores'),
    path('aulas', views.aulas, name='aulas'),
    path('materias', views.materias, name='materias'),
    path('calificaciones', views.calificaciones, name='calificaciones'),

    #path('gestion_usuarios/', include('gestion_usuarios.urls'), name='gestion_usuarios'), # redirección a la app gestion_usuarios
]

from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('informes', views.informes, name='informes'),
    path('alumnos/', views.alumnos, name='alumnos'),
    path('edita/<int:id>', views.alumnoedit, name='edita'),
    path('profesores', views.profesores, name='profesores'),
    path('editp/<int:id>', views.profesoredit, name='editp'),
    path('aulas', views.aulas, name='aulas'),
    path('materias', views.materias, name='materias'),
    path('calificaciones', views.calificaciones, name='calificaciones'),
]
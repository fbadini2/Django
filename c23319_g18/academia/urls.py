<<<<<<< HEAD
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
    path('editau/<int:id>', views.aulasedit, name='editau'),
    path('materias', views.materias, name='materias'),
    path('editm/<int:id>', views.materiasedit, name='editm'),
    path('calificaciones', views.calificaciones, name='calificaciones'),
    path('crear', views.create, name='create'),
=======
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
    path('editau/<int:id>', views.aulasedit, name='editau'),
    path('materias', views.materias, name='materias'),
    path('editm/<int:id>', views.materiasedit, name='editm'),
    path('calificaciones', views.calificaciones, name='calificaciones'),
    path('crear', views.create, name='create'),
>>>>>>> 2d91993de4914ec1ff4111cea21b646d824f83d4
]
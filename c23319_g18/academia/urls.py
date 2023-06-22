from django.urls import path
from . import views



urlpatterns = [
    path('academia/', views.index, name='index'),
    path('informes', views.informes, name='informes'),
    path('alumnos/', views.alumnos, name='alumnos'),
    path('edita/<int:id>', views.alumnoedit, name='edita'),
    path('profesores/', views.profesores, name='profesores'),
    path('editp/<int:id>', views.profesoredit, name='editp'),
    path('aulas', views.aulas, name='aulas'),
    path('editau/<int:id>', views.aulasedit, name='editau'),
    path('materias', views.materias, name='materias'),
    path('editm/<int:id>', views.materiasedit, name='editm'),
    path('formulario/', views.formulario_view, name='formulario'),
    path('editaform/<int:id>', views.editar_formulario, name='editaform'),
]  
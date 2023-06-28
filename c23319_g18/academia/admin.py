from django.contrib import admin

# Register your models here.
from .models import Alumno, AlumnoClase
admin.site.register(Alumno)
admin.site.register(AlumnoClase)
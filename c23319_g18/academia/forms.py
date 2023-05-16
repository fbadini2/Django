from django import forms
from .models import Alumno, Profesor

class Alumnoform(forms.ModelForm):
    class Meta:
        model = Alumno
        fields = ('nombre', 'apellido', 'nro_doc', 'nro_tel', 'correo', 'fec_nacimiento')
        # fields = '__all__'

class Profesorform(forms.ModelForm):
    class Meta:
        model = Profesor
        fields = ('nombre', 'apellido', 'nro_doc', 'nro_tel', 'correo', 'fec_nacimiento')
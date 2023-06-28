from django import forms
from .models import Alumno, Profesor, Materia, Clase, AlumnoClase

class Alumnoform(forms.ModelForm):
    class Meta:
        model = Alumno
        fields = ('nombre', 'apellido', 'nro_doc', 'nro_tel', 'correo', 'id_provincia', 'id_pais', 'fec_nacimiento', 'foto', 'fec_inicio', 'activo')

 
class Profesorform(forms.ModelForm):
    class Meta:
        model = Profesor
        fields = ('nombre', 'apellido', 'nro_doc', 'nro_tel', 'correo', 'id_provincia', 'id_pais', 'fec_nacimiento', 'foto', 'fec_inicio', 'activo')


class Materiaform(forms.ModelForm):
    class Meta:
        model = Materia
        fields = ('materia', 'carrera', 'anio', 'cuatrimestre')
        error_messages = {
            'materia' :{
                'required':'No te olvides de mi!'
            }
        }
class Claseform(forms.ModelForm):
    class Meta:
        model = Clase
        fields = ('id_clase', 'clase','periodo','id_materia','id_profesor','capacidad')
        error_messages = {
            'materia' :{
                'required':'No te olvides de mi!'
            }
        }  

class AlumnoClaseForm(forms.ModelForm):
    alumno = forms.ModelChoiceField(queryset=Alumno.objects.all())
    clases = forms.ModelMultipleChoiceField(queryset=Clase.objects.all(), widget=forms.CheckboxSelectMultiple)
    faltas = forms.IntegerField()
    calificacion = forms.IntegerField()
    class Meta:
        model = AlumnoClase
        fields = ('alumno', 'clases', 'faltas', 'calificacion')
from django import forms
from .models import Alumno, Profesor, Materia, Clase

class Alumnoform(forms.ModelForm):
    class Meta:
        model = Alumno
        fields = ('nombre', 'apellido', 'nro_doc', 'nro_tel', 'correo', 'fec_nacimiento')
        # fields = '__all__'

class Profesorform(forms.ModelForm):
    class Meta:
        model = Profesor
        fields = ('nombre', 'apellido', 'nro_doc', 'nro_tel', 'correo', 'fec_nacimiento')

class Materiaform(forms.ModelForm):
    class Meta:
        model = Materia
        fields = ('id_materia', 'materia')
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
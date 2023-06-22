
from django.db import models
from django import forms


class Alumno(models.Model):
    id_alumno = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=75)
    apellido = models.CharField(max_length=75)
    nro_doc = models.CharField(max_length=15)
    foto = models.ImageField(upload_to='images/alumnos', null=True)
    fec_nacimiento = models.CharField(max_length=10)
    id_provincia = models.ForeignKey('Provincia', models.DO_NOTHING, db_column='id_provincia', default=1)
    id_pais = models.ForeignKey('Pais', models.DO_NOTHING, db_column='id_pais', default=1)
    nro_tel = models.CharField(max_length=75)
    correo = models.CharField(max_length=100)
    fec_inicio = models.CharField(max_length=10)
    clases = models.ManyToManyField('Clase', through='AlumnoClase')
    activo = models.BooleanField(blank=True, null=True)  # This field type is a guess.
    
    class Meta:
        managed = False
        db_table = 'alumno'

    def __str__(self):
        return str(self.nombre + ' ' + self.apellido)


class Clase(models.Model):
    id_clase = models.AutoField(primary_key=True)
    clase = models.CharField(max_length=35, blank=True, null=True)
    periodo = models.IntegerField(blank=True, null=True)
    id_materia = models.ForeignKey('Materia', models.DO_NOTHING, db_column='id_materia')
    id_profesor = models.ForeignKey('Profesor', models.DO_NOTHING, db_column='id_profesor')
    capacidad = models.IntegerField(blank=True, null=True)
    alumnos = models.ManyToManyField('Alumno', through='AlumnoClase')

    class Meta:
        managed = False
        db_table = 'clase'


class Materia(models.Model):
    id_materia = models.AutoField(primary_key=True)
    materia = models.CharField(max_length=35, blank=True, null=True)
    carrera = models.CharField(max_length=35, blank=True, null=True)
    anio = models.CharField(max_length=15, blank=True, null=True)
    cuatrimestre = models.CharField(max_length=15, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'materia'
    
    def __str__(self):
        return str(self.materia)


class Pais(models.Model):
    id_pais = models.AutoField(primary_key=True)
    iso = models.CharField(max_length=2, blank=True, null=True)
    desc_pais = models.CharField(max_length=75, blank=True, null=True)
    bandera = models.TextField(blank=True, null=True)
    numorden = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pais'
    
    def __str__(self):
        return str(self.desc_pais)



class Profesor(models.Model):
    id_profesor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=75, blank=True, null=True)
    apellido = models.CharField(max_length=75, blank=True, null=True)
    nro_doc = models.CharField(max_length=15)
    foto = models.ImageField(upload_to='images/profesores', null=True)
    fec_nacimiento = models.CharField(max_length=10)
    id_provincia = models.ForeignKey('Provincia', models.DO_NOTHING, db_column='id_provincia', default=1)
    id_pais = models.ForeignKey(Pais, models.DO_NOTHING, db_column='id_pais', default=1)
    nro_tel = models.CharField(max_length=75)
    correo = models.CharField(max_length=100)
    fec_inicio = models.CharField(max_length=10)
    activo = models.BooleanField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'profesor'

    
    def __str__(self):
        return str(self.nombre + ' ' + self.apellido )


class Provincia(models.Model):
    id_provincia = models.AutoField(primary_key=True)
    desc_provincia = models.CharField(max_length=35, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'provincia'
    
    def __str__(self):
        return str(self.desc_provincia)


class AlumnoClase(models.Model):
    alumno = models.ForeignKey(Alumno, models.DO_NOTHING, db_column='id_alumno')
    clase = models.ForeignKey(Clase, models.DO_NOTHING, db_column='id_clase')
    faltas = models.IntegerField()
    calificacion = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'alumno_clase'


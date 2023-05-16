# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Alumno(models.Model):
    id_alumno = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=75, blank=True, null=True)
    apellido = models.CharField(max_length=75, blank=True, null=True)
    tipo_doc = models.CharField(max_length=5)
    nro_doc = models.CharField(max_length=15)
    # foto = models.TextField(blank=True, null=True)
    fec_nacimiento = models.CharField(max_length=10)
    # id_provincia = models.ForeignKey('Provincia', models.DO_NOTHING, db_column='id_provincia', default=1)
    # id_pais = models.ForeignKey('Pais', models.DO_NOTHING, db_column='id_pais')
    # tipo_tel = models.CharField(max_length=5)
    nro_tel = models.CharField(max_length=75)
    correo = models.CharField(max_length=100)
    # fec_inicio = models.CharField(max_length=10)
    # activo = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'alumno'


class AlumnoClase(models.Model):
    id_alumno = models.ForeignKey(Alumno, models.DO_NOTHING, db_column='id_alumno')
    id_clase = models.ForeignKey('Clase', models.DO_NOTHING, db_column='id_clase')
    faltas = models.IntegerField()
    calificacion = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'alumno_clase'


class Clase(models.Model):
    id_clase = models.AutoField(primary_key=True)
    clase = models.CharField(max_length=35, blank=True, null=True)
    periodo = models.IntegerField(blank=True, null=True)
    id_materia = models.ForeignKey('Materia', models.DO_NOTHING, db_column='id_materia')
    id_profesor = models.ForeignKey('Profesor', models.DO_NOTHING, db_column='id_profesor')
    capacidad = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'clase'


class Materia(models.Model):
    id_materia = models.AutoField(primary_key=True)
    materia = models.CharField(max_length=35, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'materia'


class Pais(models.Model):
    id_pais = models.AutoField(primary_key=True)
    iso2 = models.CharField(max_length=2, blank=True, null=True)
    iso3 = models.CharField(max_length=3, blank=True, null=True)
    isonum = models.IntegerField()
    desc_pais = models.CharField(max_length=75, blank=True, null=True)
    bandera = models.TextField(blank=True, null=True)
    numorden = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pais'


class Profesor(models.Model):
    id_profesor = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=75, blank=True, null=True)
    apellido = models.CharField(max_length=75, blank=True, null=True)
    tipo_doc = models.CharField(max_length=5)
    nro_doc = models.CharField(max_length=15)
    # foto = models.TextField(blank=True, null=True)
    fec_nacimiento = models.CharField(max_length=10)
    # id_provincia = models.ForeignKey('Provincia', models.DO_NOTHING, db_column='id_provincia')
    # id_pais = models.ForeignKey(Pais, models.DO_NOTHING, db_column='id_pais')
    # tipo_tel = models.CharField(max_length=5)
    nro_tel = models.CharField(max_length=75)
    correo = models.CharField(max_length=100)
    # fec_inicio = models.CharField(max_length=10)
    # activo = models.TextField(blank=True, null=True)  # This field type is a guess.

    class Meta:
        managed = False
        db_table = 'profesor'


class Provincia(models.Model):
    id_provincia = models.AutoField(primary_key=True)
    provincia = models.CharField(max_length=35, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'provincia'

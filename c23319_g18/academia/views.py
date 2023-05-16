from django.shortcuts import render, redirect
from django.http import HttpResponse
from .forms import Alumnoform, Profesorform
from .models import Materia, Alumno, Pais, Profesor


def alumnos(request):
    alumnos = Alumno.objects.all().order_by('-id_alumno')[:8]
    paises = Pais.objects.all()
    if request.method == 'GET':
        form = Alumnoform()
    else:
        form = Alumnoform(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/alumnos')
    return render(request, "alumnos.html", {'alumnos':alumnos, 'paises':paises, 'form':form})


def alumnoedit(request, id):
    alumnos = Alumno.objects.all().order_by('-id_alumno')[:8]
    paises = Pais.objects.all()
    alumno = Alumno.objects.get(id_alumno = id)
    if request.method == 'GET':
        form = Alumnoform(instance = alumno)
    else:
        form = Alumnoform(request.POST, instance = alumno)
        if form.is_valid():
            form.save()
            return redirect('/alumnos')
    return render(request, "alumnos.html", {'alumnos':alumnos, 'paises':paises, 'form':form})

def profesores(request):
    profesores = Profesor.objects.all().order_by('-id_profesor')[:8]
    paises = Pais.objects.all()
    if request.method == 'GET':
        form = Profesorform()
    else:
        form = Profesorform(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/profesores')
    return render(request, "profesores.html", {'profesores':profesores, 'paises':paises, 'form':form})

def profesoredit(request, id):
    profesores = Profesor.objects.all().order_by('-id_profesor')[:8]
    paises = Pais.objects.all()
    profesor = Profesor.objects.get(id_profesor = id)
    if request.method == 'GET':
        form = Profesorform(instance = profesor)
    else:
        form = Profesorform(request.POST, instance = profesor)
        if form.is_valid():
            form.save()
            return redirect('/profesores')
    return render(request, "profesores.html", {'profesores':profesores, 'paises':paises, 'form':form})

def aulas(request):
    return render(request, "aulas.html")

def materias(request):
    items = Materia.objects.all()
    return render(request, "materias.html", {'items':items})

def calificaciones(request):
    return render(request, "calificaciones.html")

def informes(request):
    return render(request, "informes.html")

def index(request):
    return render(request, "nosotros.html")

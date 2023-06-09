from django.shortcuts import render, redirect
from django.http import HttpResponse
from .forms import Alumnoform, Profesorform, Materiaform, Claseform
from .models import Materia, Alumno, Pais, Profesor, Clase


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
    items = Clase.objects.all().order_by('-id_clase')[:8]
   
    if request.method == 'GET':
        form = Claseform()
    else:
        form = Claseform(request.POST) 
        if form.is_valid():
            form.save()
            return redirect('/aulas')
        
    return render(request, "aulas.html", {'items':items, 'form':form})

def aulasedit(request, id):
    items = Clase.objects.all().order_by('-id_clase')[:8]
    clase = Clase.objects.get(id_clase = id)
    # item_profesor = Profesor.objects.select_related().get(id_profesor=clase.id_profesor.pk)
    if request.method == 'GET':
        form = Claseform(instance = clase)
    else:
        form = Claseform(request.POST, instance = clase)
        if form.is_valid():
            form.save()
            return redirect('/aulas')
    return render(request, "aulas.html", {'items':items,  'form':form})
    


def materias(request):
    items = Materia.objects.all().order_by('-id_materia')[:8]
    if request.method == 'GET':
        form = Materiaform()
    else:
        form = Materiaform(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/materias')
        
    return render(request, "materias.html", {'items':items, 'form':form})

def materiasedit(request, id):
    items = Materia.objects.all().order_by('-id_materia')[:8]
    materia = Materia.objects.get(id_materia = id)
    if request.method == 'GET':
        form = Materiaform(instance = materia)
    else:
        form = Materiaform(request.POST, instance = materia)
        if form.is_valid():
            form.save()
            return redirect('/materias')
    return render(request, "materias.html", {'items':items, 'form':form})

def calificaciones(request):
    return render(request, "calificaciones.html")

def informes(request):
    return render(request, "informes.html")

def index(request):
    return render(request, "nosotros.html")

def create(request):
    return render(request, "create.html")
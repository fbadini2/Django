from django.shortcuts import render, redirect, get_object_or_404
from .forms import Alumnoform, Profesorform, Materiaform, Claseform
from .models import Materia, Alumno, Profesor, Clase

def alumnos(request):

    if request.GET.get('tags') == None:
        alumnos = Alumno.objects.all().order_by('-id_alumno')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        alumnos = Alumno.objects.extra(where=["nombre LIKE %s OR apellido LIKE %s"], params=[param, param]).order_by('-id_alumno')[:8]

    if request.method == 'GET':
        form = Alumnoform()
    else:
        form = Alumnoform(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/alumnos')
    return render(request, "alumnos.html", {'alumnos':alumnos, 'form':form})

def alumnoedit(request, id):
    
    if request.GET.get('tags') == None:
        alumnos = Alumno.objects.all().order_by('-id_alumno')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        alumnos = Alumno.objects.extra(where=["nombre LIKE %s OR apellido LIKE %s"], params=[param, param]).order_by('-id_alumno')[:8]
  
    alumno = get_object_or_404(Alumno, id_alumno = id)

    if request.method == 'GET':
        form = Alumnoform(instance = alumno)
    else:
        form = Alumnoform(request.POST, request.FILES, instance = alumno)
        if form.is_valid():
            form.save()
            return redirect('/alumnos')
    return render(request, "alumnos.html", {'alumnos':alumnos, 'form':form})



def profesores(request):
    
    if request.GET.get('tags') == None:
        profesores = Profesor.objects.all().order_by('-id_profesor')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        profesores = Profesor.objects.extra(where=["nombre LIKE %s OR apellido LIKE %s"], params=[param, param]).order_by('-id_profesor')[:8]
  
    # paises = Pais.objects.all()
    if request.method == 'GET':
        form = Profesorform()
    else:
        form = Profesorform(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/profesores')
    return render(request, "profesores.html", {'profesores':profesores, 'form':form})

def profesoredit(request, id):
    profesores = Profesor.objects.all().order_by('-id_profesor')[:8]
    # paises = Pais.objects.all()
    profesor = Profesor.objects.get(id_profesor = id)
    if request.method == 'GET':
        form = Profesorform(instance = profesor)
    else:
        form = Profesorform(request.POST, instance = profesor)
        if form.is_valid():
            form.save()
            return redirect('/profesores')
    return render(request, "profesores.html", {'profesores':profesores, 'form':form})

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

    if request.method == 'GET':
        form = Claseform(instance = clase)
    else:
        form = Claseform(request.POST, instance = clase)
        if form.is_valid():
            form.save()
            return redirect('/aulas')
    return render(request, "aulas.html", {'items':items,  'form':form})
    

def materias(request):
    items = Materia.objects.all().order_by('id_materia')[:7]
    if request.method == 'GET':
        form = Materiaform()
    else:
        form = Materiaform(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/materias')
        
    return render(request, "materias.html", {'items':items, 'form':form})

def materiasedit(request, id):
    items = Materia.objects.all().order_by('id_materia')[:7]
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

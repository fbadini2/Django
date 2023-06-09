from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .forms import Alumnoform, Profesorform, Materiaform, Claseform, AlumnoClaseForm
from .models import Materia, Alumno, Profesor, Clase, Pais, AlumnoClase


@login_required
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

@login_required
def alumnoedit(request, id):
    
    if request.GET.get('tags') == None:
        alumnos = Alumno.objects.all().order_by('-id_alumno')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        alumnos = Alumno.objects.extra(where=["nombre LIKE %s OR apellido LIKE %s"], params=[param, param]).order_by('-id_alumno')[:8]
  
    alumno = get_object_or_404(Alumno, id_alumno = id)
    country = Pais.objects.select_related().get(id_pais=alumno.id_pais.pk)

    if request.method == 'GET':
        form = Alumnoform(instance = alumno)
    else:
        form = Alumnoform(request.POST, request.FILES, instance = alumno)
        if form.is_valid():
            form.save()
            return redirect('/alumnos')
    return render(request, "alumnos.html", {'alumnos':alumnos, 'country':country, 'form':form})


@login_required
def profesores(request):
    if request.GET.get('tags') == None:
        profesores = Profesor.objects.all().order_by('-id_profesor')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        profesores = Profesor.objects.extra(where=["nombre LIKE %s OR apellido LIKE %s"], params=[param, param]).order_by('-id_profesor')[:8]
  
    if request.method == 'GET':
        form = Profesorform()
    else:
        form = Profesorform(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('/profesores')
    return render(request, "profesores.html", {'profesores':profesores, 'form':form})

@login_required
def profesoredit(request, id):
    
    if request.GET.get('tags') == None:
        profesores = Profesor.objects.all().order_by('-id_profesor')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        profesores = Profesor.objects.extra(where=["nombre LIKE %s OR apellido LIKE %s"], params=[param, param]).order_by('-id_profesor')[:8]
 
    
    profesor = Profesor.objects.get(id_profesor = id)
    country = Pais.objects.select_related().get(id_pais=profesor.id_pais.pk)

    if request.method == 'GET':
        form = Profesorform(instance = profesor)
    else:
        form = Profesorform(request.POST,request.FILES, instance = profesor)
        if form.is_valid():
            form.save()
            return redirect('/profesores')
    return render(request, "profesores.html", {'profesores':profesores, 'country':country, 'form':form})

@login_required
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

@login_required
def aulasedit(request, id):

    if request.GET.get('tags') == None:
        items = Clase.objects.all().order_by('-id_clase')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        items = Clase.objects.extra(where=[" clase LIKE %s"], params=[param]).order_by('-id_clase')[:8]
    
    clase = Clase.objects.get(id_clase = id)

    if request.method == 'GET':
        form = Claseform(instance = clase)
    else:
        form = Claseform(request.POST, instance = clase)
        if form.is_valid():
            form.save()
            return redirect('/aulas')
    return render(request, "aulas.html", {'items':items,  'form':form})
    

@login_required
def materias(request):
    if request.GET.get('tags') == None:
        items = Materia.objects.all().order_by('id_materia')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        items = Materia.objects.extra(where=["carrera LIKE %s OR materia LIKE %s"], params=[param, param]).order_by('-id_materia')[:8]
    
    if request.method == 'GET':
        form = Materiaform()
    else:
        form = Materiaform(request.POST)
        if form.is_valid():
            form.save()
            return redirect('/materias')
        
    return render(request, "materias.html", {'items':items, 'form':form})

@login_required
def materiasedit(request, id):

    if request.GET.get('tags') == None:
        items = Materia.objects.all().order_by('id_materia')[:8]
    else:
        param = '%' + str(request.GET.get('tags')) + '%'
        items = Materia.objects.extra(where=["carrera LIKE %s OR materia LIKE %s"], params=[param, param]).order_by('-id_materia')[:8]
    
    materia = Materia.objects.get(id_materia = id)
    if request.method == 'GET':
        form = Materiaform(instance = materia)
    else:
        form = Materiaform(request.POST, instance = materia)
        if form.is_valid():
            form.save()
            return redirect('/materias')
    return render(request, "materias.html", {'items':items, 'form':form})

@login_required
def formulario_view(request):
    alumnos = Alumno.objects.all()
    clases = Clase.objects.all()
    alumno_clases = AlumnoClase.objects.all()

    # Obtener el parámetro de ordenamiento desde la URL
    sort_param = request.GET.get('sort')
    direction_param = request.GET.get('direction')
    default_direction = 'asc'
    if direction_param and direction_param.lower() == 'desc': 
        default_direction = 'desc'

    # Ordenar los registros
    if sort_param:
        if sort_param == 'alumno':
            alumno_clases = alumno_clases.order_by(f'alumno__apellido', f'alumno__nombre')
        elif sort_param == 'clases':
            alumno_clases = alumno_clases.order_by('clase__clase')
        elif sort_param == 'faltas':
            alumno_clases = alumno_clases.order_by('faltas')
        elif sort_param == 'calificacion':
            alumno_clases = alumno_clases.order_by('calificacion')

        # Invertir el orden si la dirección es descendente
        if default_direction == 'desc':
            alumno_clases = alumno_clases.reverse()
    
    if request.method == 'POST':
        alumno_id = request.POST.get('alumno')
        clase_ids = request.POST.getlist('clases')
        faltas = int(request.POST.get('faltas'))
        calificacion = int(request.POST.get('calificacion'))
        #materia_id = request.POST.get('materia')
        
        alumno = Alumno.objects.get(id_alumno=alumno_id)
        
        for clase_id in clase_ids:
            clase = Clase.objects.get(id_clase=clase_id)
            #materia = Materia.objects.get(id_materia=materia_id)
            AlumnoClase.objects.create(
                alumno=alumno, 
                clase=clase,
                #materia =materia,
                faltas=faltas,
                calificacion=calificacion
            )  
        
        return redirect('formulario')  
        
    context = {
        'alumnos': alumnos,
        'clases': clases,
        'items': alumno_clases,
        'direction': request.GET.get('direction')  # Pasar el parámetro 'direction' al contexto
    }
    
    return render(request, 'formulario.html', context)

@login_required
def editar_formulario(request, id):
    alumnos = Alumno.objects.all()
    clases = Clase.objects.all()
    alumno_clases = AlumnoClase.objects.all()

    registro = get_object_or_404(AlumnoClase, id=id)
    
    if request.method == 'GET':
        form = AlumnoClaseForm(instance=registro)
    else:
        form = AlumnoClaseForm(request.POST, instance=registro)
        if form.is_valid():
            form.save()
            return redirect('formulario')
    
    context = {
        'alumnos': alumnos,
        'clases': clases,
        'items': alumno_clases,
        'form': form
    }
    
    return render(request, 'formulario.html', context)

@login_required
def calificaciones(request):
    return render(request, "calificaciones.html")

@login_required
def informes(request):
    return render(request, "informes.html")

@login_required
def index(request):
    return render(request, "nosotros.html")

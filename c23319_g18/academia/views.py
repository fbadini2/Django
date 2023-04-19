from django.shortcuts import render
from django.http import HttpResponse
from .models import Materia

# Create your views here.
# def index(request):
#     return HttpResponse("<h1>You're at the academia app index.</h1>")

def index(request):
    return render(request, "nosotros.html")

def informes(request):
    return render(request, "informes.html")

def alumnos(request):
    return render(request, "alumnos.html")

def profesores(request):
    return render(request, "profesores.html")

def aulas(request):
    return render(request, "aulas.html")

def materias(request):
    items = Materia.objects.all()
    return render(request, "materias.html", {'items':items})

def calificaciones(request):
    return render(request, "calificaciones.html")
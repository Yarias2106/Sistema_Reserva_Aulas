
import email
from django import http
from django.shortcuts import render,redirect
from django.template import Template,context
from django.http import request, HttpResponse
from django.template.loader import get_template
from GestionDB.models import Docente
from django.contrib.auth import authenticate, get_user_model, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth.models import User
from unicodedata import normalize

def loginPropio(request):
    if request.method=="POST":
        correo=request.POST.get('email','')
        passwod=request.POST.get('contraseña','')
        if(Docente.objects.filter(contraseña=passwod).exists() and Docente.objects.filter(email=correo).exists()):
            usuario = authenticate(username=correo, password=passwod)
            if usuario is not None:
                print("si entro aqui papu si entro")
                print("si entro aqui papu si entro")
                print("si entro aqui papu si entro")
                print("si entro aqui papu si entro")
                print("si entro aqui papu si entro")
                login(request, usuario)
                return redirect("/inicio_Doc/")

    return render(request,"login.html")


@login_required(login_url='/login/')
def inicio_Doc(request): 
    if request.method=="POST":
        logout(request)
        return redirect("/login/")

    return render(request,"inicio_Doc.html")


        # correo=request.POST.get('email','')
        # contraseña=request.POST.get('contraseña','')
        # variable = Docente.objects.get(contraseña="lorem")
        # variable1 = Docente.objects.filter(contraseña="lorem")
        # print(variable1[0].telefono_Docente)
        # estudiante = Docente(nombre_Docente="rosemary",apellido_Docente="bascopes",telefono_Docente="76543210",email="elmail@okas",contraseña="123456789")
        # estudiante.save()

        # usuario = User.objects.create_user(username = "test",email = "correo",password="7d8Zggtt", first_name = "primarNombre")
        # usuario.save()
        # var=User.objects.get(username="test")
        # print(var.password)


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
from django.contrib import messages

def loginPropio(request):
    # try:
    #     print(request.user.username)
    #     return redirect('/VistaDocente/')
    # except:
    if(len(request.user.username)>0):
       return redirect('/VistaDocente/')
    else:
        if request.method=="POST":
            correo=request.POST.get('email','')
            passwod=request.POST.get('contraseña','')
            res= redirect("/login/")
            
            if len(correo)==0 and len(passwod)==0:
                    mensaje(request,"Por favor ingrese todos los campos")
                    return res

            if len(correo)==0:
                    mensaje(request,"Por favor ingrese su correo electrónico")
                    return res

            if len(passwod)==0:
                    mensaje(request,"Por favor ingrese una contraseña")
                    return res        

            if( Docente.objects.filter(email=correo).exists()):
                if(Docente.objects.filter(contraseña=passwod).exists()):
                    usuario = authenticate(request, username=correo, password=passwod)
                    if usuario is not None:
                        login(request, usuario)
                        return redirect('/VistaDocente/')
                else:
                    mensaje(request,"Error: contraseña incorrecta")
                    return res
            else:
                mensaje(request,"Error: Usuario no registrado")
                return res 

        return render(request,"login.html")

@login_required(login_url='/login/')
def VistaDocente(request):
    nombre = (Docente.objects.get(email=request.user.username)).nombre_Docente
    apellido = (Docente.objects.get(email=request.user.username)).apellido_Docente
    nombreCompleto=nombre+" "+apellido
    contexto={'nombre':nombreCompleto}
    return render(request,"VistaDocente.html",contexto)
    return render(request,"VistaDocente.html")

def salir(request):
    logout(request)
    return redirect("/login/")

# @login_required(login_url='/login/')
# def inicio_Doc(request): 
#     if request.method=="POST":
#         logout(request)
#         return redirect("/login/")
#     return render(request,"inicio_Doc.html")

# correo=request.POST.get('email','')
# contraseña=request.POST.get('contraseña','')
# variable = Docente.objects.get(contraseña="lorem")
# variable1 = Docente.objects.filter(contraseña="lorem")
# print(variable1[0].telefono_Docente)
# estudiante = Docente(nombre_Docente="rosemary",apellido_Docente="bascopes",telefono_Docente="76543210",email="elmail@okas",contraseña="123456789")
# estudiante.save(
# usuario = User.objects.create_user(username = "test",email = "correo",password="7d8Zggtt", first_name = "primarNombre")
# usuario.save()
# var=User.objects.get(username="test")
# print(var.password)


def mensaje(req,mensajeError):  
    messages.add_message(request=req, level=messages.WARNING, message = mensajeError)
from django.http import HttpResponse, request
from django.template import Template, Context, context
from django.shortcuts import render, redirect
from GestionMunayDB.models import Docente, Reserva, Aula, Materia, Grupo, Dicta
from django.contrib import messages

from django.contrib.auth.models import User
from django.contrib.auth import authenticate, get_user_model, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import make_password
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import user_passes_test
from django.db.models import Q
from unicodedata import normalize

def inicio(request): #Vista Inicio

    contexto={
    'id_profesor':5,
    'nombre_profesor':"juan",
    }
    return render(request,'index.html', contexto)

def profesor1(user):
    prof= not (user.get_username() == 'mantequilla_prof' or user.get_username() == 'Aron_prof' or user.get_username() == 'christian_prof' or user.get_username() == 'mario_prof')
    return prof

#@user_passes_test(profesor1,login_url='/Inicio_Profesores/')
#@user_passes_test(profesor,login_url='/')
def login1(request): 
    try:
        #print(request.user.first_name)
        return redirect('/')
    except:
        if request.method=="POST":   
            res= redirect("/Login/")
            usuario_login=request.POST.get('usuario','')
            contraseña=request.POST.get('contraseña','')
            if(espacio(usuario_login)):
                mensaje(request,"Porfavor llene todos los campos")
                return res
            if len(contraseña)==0 or len(usuario_login)==0:
                mensaje(request,"Porfavor llene todos los campos")
                return res
            elif validar(usuario_login)==False:
                mensaje(request,"Error el nombre de usuario no es valido")
                return res
            #if("_prof" in usuario_login):
            if(Docente.objects.filter(email=usuario_login).exists()):
                    if(Docente).objects.filter(contraseña=contraseña).exists()and Docente.objects.filter(email=usuario_login).exists()):
                        usuario = authenticate(username=usuario_login, password=contraseña)
                        if usuario is not None:
                            login(request, usuario)
                            messages.info(request, "¡Bienvenido!")   
                            return redirect("/Pagina_Inicio/")
                    else:
                            mensaje(request,"Error: contraseña incorrecta")
                            return res
            else:
                mensaje(request,"Error: Usuario no registrado")
                return res
       
    return render (request, "login.html")

def validar(nombreUsuario):
    valido_usuario = True
    i = 0
    while(i<len(nombreUsuario) and valido_usuario):
        aux = (int)(ord(nombreUsuario[i]))
        letrita = nombreUsuario[i]
        if (not((aux>64 and aux<91) or (aux>96 and aux<123)or (aux>47 and aux<59)
            or letrita=="á" or letrita=="é" or letrita=="í" or letrita=="_" or letrita=="-"
            or letrita=="ó" or letrita=="ú" or letrita=="Á" or letrita=="É"
            or letrita=="Í" or letrita=="Ó" or letrita=="Ú" or letrita==" "
            or letrita=="ñ" or letrita=="Ñ")):
                    
            valido_usuario = False
        i +=1
    return valido_usuario

def espacio(palabra):
    res=False
    contador=0
    aux=0
    control=0
    while(contador<2 and aux<len(palabra)and control<100):
        control=control+1
        if(palabra[aux]==" "):
            contador=contador+1
        aux=aux+1
    if(contador==2):
        res=True
    if(contador==1 and len(palabra)==1):
        res=True
    return res
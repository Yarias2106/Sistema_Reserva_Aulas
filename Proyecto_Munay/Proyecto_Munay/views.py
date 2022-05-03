
# from curses import savetty
import email
from django import http
from django.shortcuts import render,redirect
from django.template import Template,context
from django.http import request, HttpResponse
from django.template.loader import get_template
from GestionDB.models import Docente, Grupo, Reserva, Materia
from django.contrib.auth import authenticate, get_user_model, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import user_passes_test
from django.contrib.auth.models import User
from unicodedata import normalize
from django.contrib import messages
# from django.utils import simplejson
# import json
from json import dumps
from GestionDB import models
from datetime import datetime

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
    
    nombreCompleto=nombreApp(request)
    contexto={'nombre':nombreCompleto}
    return render(request,"VistaDocente.html",contexto)
    return render(request,"VistaDocente.html")

def salir(request):
    logout(request)
    return redirect("/login/")

def nombreApp(request):
    nombre = (Docente.objects.get(email=request.user.username)).nombre_Docente
    apellido = (Docente.objects.get(email=request.user.username)).apellido_Docente
    
    return nombre+" "+apellido

@login_required(login_url='/login/')
def Reserva(request):
    nombreCompleto=nombreApp(request)
    Cod_Doc= (Docente.objects.get(email=request.user.username)).id
    Tupla_Grupo = Grupo.objects.filter(Cod_Docente=Cod_Doc)

    Lista_Mat = []
    for elemento in Tupla_Grupo:
        mat = (elemento.Cod_Materia.Nombre).strip()
        if(mat) not in Lista_Mat:           
            Lista_Mat.append(mat)

    contexto={
        'nombre':nombreCompleto,
        'Tupla_Grupo' :Tupla_Grupo,
        'tuplita' : Lista_Mat
        }
    return render(request, "FormularioReserva.html",contexto)
    
@login_required(login_url='/login/')
def Ambiente(request):

    nombreCompleto=nombreApp(request)

    contexto={
        'nombre':nombreCompleto,}
    return render(request, "FormularioAmbiente.html",contexto)

@login_required(login_url='/login/')
def ReservaExitosa(request):

    nombreCompleto=nombreApp(request)

    contexto={
        'nombre':nombreCompleto,}
    return render(request, "ReservaExitosa.html",contexto)


def validar(request):
    
    Reserva = "/Reserva/"
    if request.method=="POST":
        Materia=request.POST.get('Materia','')
        Grupo=request.POST.get('Grupo','')
        Alumno=request.POST.get('alumno','')
        Fecha=request.POST.get('Fecha','')
        Horario=request.POST.get('Horario','')
        CantPeriodos=request.POST.get('Periodo','')
        Motivo=request.POST.get('Motivo','')
        Motivo=Motivo.strip()
        contexto = {
            'Materia' : Materia,
            'Grupo' : Grupo,
            'Alumno' : Alumno,
            'Fecha' : Fecha,
            'Horario' : Horario,
            'CantPeriodos' : CantPeriodos,
            'Motivo' : Motivo
        }
        
        auxiliar_descripcion =Motivo.upper()
        if(len(Motivo)>300):
            mensaje(request,"El motivo de reserva es muy largo")
            return redirect(Reserva)
        if(len(Motivo)<10):
            mensaje(request,"El motivo de reserva es muy corto")
            return redirect(Reserva)

        encontre1 = False
        contador1 =0
        n1=''
        while(contador1<len(auxiliar_descripcion)-2 and not encontre1):
            codigoDescripcion = (ord(auxiliar_descripcion[contador1]))
            if not(codigoDescripcion>47 and codigoDescripcion<59):
                if auxiliar_descripcion[contador1]==auxiliar_descripcion[contador1+1] and auxiliar_descripcion[contador1]==auxiliar_descripcion[contador1+2] :
                    n1 =Motivo[contador1]
                    encontre1 = True
            contador1 += 1
        if(encontre1):
            mensaje(request,"El carácter '" + n1 + "'no debería repetirse tantas veces en la descripción")
            return redirect(Reserva) 

        
        if(len(Materia)==0):
            mensaje(request,"Por favor seleccione una Materia")
            return redirect(Reserva)
        
        if(len(Grupo)==0):
            mensaje(request,"Por favor seleccione un Grupo")
            return redirect(Reserva)
        
        mensaje(request,"Solicitud realizada correctamente")
        # datetime.today().strftime('%Y-%m-%d'),
        # now=datetime.now()
        # Cod_Doc= (Docente.objects.get(email=request.user.username)).id
        # Save_Reserva = models.Reserva.objects.create(
        #     cant_Periodos = CantPeriodos,
        #     Hora_Reserva = Horario,
        #     Fecha_Solicitud_Res = now.date(),
        #     motivo = Motivo,
        #     Cant_Est_Sol = Alumno,
        #     Cod_Docente_id = Cod_Doc,
        #     Cod_Aula_id = 1,
        #     Fecha_Reserva = Fecha,
        #     Hora_Solicitud_Res = now.time()
        #     )
        # Save_Reserva.save()
        
    return redirect("/Reserva/")

def mensaje(req,mensajeError):  
    messages.add_message(request=req, level=messages.WARNING, message = mensajeError)


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



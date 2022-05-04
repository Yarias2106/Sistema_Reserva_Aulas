
# from curses import savetty
from cmath import inf
import email
from operator import le
from django import http
from django.shortcuts import render,redirect
from django.template import Template,context
from django.http import request, HttpResponse
from django.template.loader import get_template
from GestionDB.models import Docente, Grupo, Reserva, Materia, Aula
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
    
    nombreCompleto=nombreUsuario(request)
    contexto={'nombre':nombreCompleto}
    return render(request,"VistaDocente.html",contexto)
    return render(request,"VistaDocente.html")

def salir(request):
    logout(request)
    return redirect("/login/")

def nombreUsuario(request):
    nombre = (Docente.objects.get(email=request.user.username)).nombre_Docente
    apellido = (Docente.objects.get(email=request.user.username)).apellido_Docente
    
    return nombre+" "+apellido

@login_required(login_url='/login/')
def Reserva_(request):
    nombreCompleto=nombreUsuario(request)
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

    nombreCompleto=nombreUsuario(request)

    contexto={
        'nombre':nombreCompleto,}
    return render(request, "FormularioAmbiente.html",contexto)

@login_required(login_url='/login/')
def ReservaExitosa(request):

    nombreCompleto=nombreUsuario(request)
    Cod_Doc= (Docente.objects.get(email=request.user.username)).id
    informe = Reserva.objects.filter(Cod_Docente_id=Cod_Doc).order_by("-id")
    contexto={
        'Motivo': informe[0].motivo
        }
    print(informe[0].motivo)
    
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

        Ambientes_aula = Aula.objects.filter(Cant_Estudiante__gte=Alumno).filter(Tipo_Aula="AUC").order_by("Cant_Estudiante")
        Ambientes_lab = Aula.objects.filter(Cant_Estudiante__gte=Alumno).filter(Tipo_Aula="LAB").order_by("Cant_Estudiante")
        Ambientes_aud = Aula.objects.filter(Cant_Estudiante__gte=Alumno).filter(Tipo_Aula="AUD").order_by("Cant_Estudiante")
   
        aula=buscarAmbienteDisponible(Ambientes_aula,Fecha,Horario)
        lab=buscarAmbienteDisponible(Ambientes_lab,Fecha,Horario)
        aud=buscarAmbienteDisponible(Ambientes_aud,Fecha,Horario)
     
        #print("aula elegida es " + str(aula))
        #print("laboratorio elegido es " + str(lab))
        #print("auditorio elegido es " + str(aud) )
        nombreCompleto=nombreUsuario(request)
        contexto ={
            'nombre':nombreCompleto,
            'Aula' : aula,
            'Laboratorio' : lab,
            'Auditorio' : aud,
            'Materia' : Materia,
            'Grupo' : Grupo,
            'Alumno' : Alumno,
            'Fecha' : Fecha,
            'Horario' : Horario,
            'CantPeriodos' : CantPeriodos,
            'Motivo' : Motivo
        }
    return render(request, "FormularioAmbiente.html",contexto)     
    #return redirect("/Reserva/")
def pruebita(request):
    
    aula = request.GET.get('Aula', None)
    Laboratorio = request.GET.get('Laboratorio', None)
    Auditorio = request.GET.get('Auditorio', None)

    Materia = request.GET.get('Materia', None)
    Grupo = request.GET.get('Grupo', None)
    Alumno = request.GET.get('Alumno', None)
    Fecha = request.GET.get('Fecha', None)
    Horario = request.GET.get('Horario', None)
    CantPeriodos = request.GET.get('CantPeriodos', None)
    Motivo = request.GET.get('Motivo', None)
    tipoAmbiente = request.GET.get('Ambiente', None)

    filtroAmbiente = aula
    if(tipoAmbiente == "Laboratorio"):
        filtroAmbiente = Laboratorio
    if(tipoAmbiente == "Auditorio"):
        filtroAmbiente = Auditorio
    
    datetime.today().strftime('%Y-%m-%d'),
    now=datetime.now()
    Cod_Doc= (Docente.objects.get(email=request.user.username)).id
    Codigo_Aula = (Aula.objects.get(Cod_Aula=filtroAmbiente)).id
    
    Save_Reserva = models.Reserva.objects.create(
        cant_Periodos = CantPeriodos,
        Hora_Reserva = Horario,
        Fecha_Solicitud_Res = now.date(),
        motivo = Motivo,
        Cant_Est_Sol = Alumno,
        Cod_Docente_id = Cod_Doc,
        Cod_Aula_id = Codigo_Aula,
        Fecha_Reserva = Fecha,
        Hora_Solicitud_Res = now.time()
    )
    Save_Reserva.save()
    
    contexto = {'Motivo' : Motivo}
    return render(request,"ReservaExitosa.html",contexto)

def buscarAmbienteDisponible(Ambientes,Fecha,Horario):
    print("funcionBuscar")
    ambiente_elegido="No encontre"
    horarios = ["06:45","08:15","09:45","11:15","12:45","14:15","15:45","17:15","18:45","20:15"]
    HorarioAnterior = ""
    posPlus = 0
    print("antes de buscar horario anterior  :"+Horario)
    if( Horario in horarios and Horario != "06:45"):
        pos = horarios.index(Horario)-1
        posPlus = pos+2
        HorarioAnterior = horarios[pos]
        print("horario anterior : "+HorarioAnterior)
    

    for i in Ambientes:
        id_Aula = i.id

        ocupado = Reserva.objects.filter(Fecha_Reserva=Fecha).filter(Hora_Reserva=Horario).filter(Cod_Aula=id_Aula)
        ocupadoAux = ""
        if(len(HorarioAnterior) != 0):
           
            ocupadoAux = Reserva.objects.filter(Fecha_Reserva=Fecha).filter(Hora_Reserva=HorarioAnterior).filter  (Cod_Aula=id_Aula).filter(cant_Periodos=2)
        

        if (len(ocupado)==0 and len(ocupadoAux) == 0):
           ambiente_elegido=i.Cod_Aula
           print(ambiente_elegido)
           break

    return ambiente_elegido

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



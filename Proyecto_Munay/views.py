
# from curses import savetty
from cmath import inf
from contextlib import ContextDecorator
import email
from operator import le
from pyexpat import model
from turtle import update
from django import http
from django.shortcuts import render,redirect
from django.template import Template,context
from django.http import request, HttpResponse
from django.template.loader import get_template
from GestionDB.models import Docente, Grupo, Parametro, Reserva, Materia, Aula
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
        if(request.user.first_name == "Administrador"):
           return redirect('/VistaAdmin/')
        else:
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
                if(correo == "MunayAdmin"):
                    usuario = authenticate(request, username=correo, password=passwod)
                    if usuario is not None:
                        login(request, usuario)
                        return redirect('/VistaAdmin/')  
                else:
                    mensaje(request,"Error: Usuario no registrado")
                    return res
                

        return render(request,"login.html")

@login_required(login_url='/login/')
def VistaDocente(request):
    if(request.user.first_name == "Administrador"):
        return redirect('/VistaAdmin/')
    else:
        nombreCompleto=nombreUsuario(request)
        contexto={'nombre':nombreCompleto}
        return render(request,"VistaDocente.html",contexto)
    # return render(request,"VistaDocente.html")

def salir(request):
    logout(request)
    return redirect("/login/")

def nombreUsuario(request):
    nombre = (Docente.objects.get(email=request.user.username)).nombre_Docente
    apellido = (Docente.objects.get(email=request.user.username)).apellido_Docente
    
    return nombre+" "+apellido

@login_required(login_url='/login/')
def Reserva_(request,error):
    nombreCompleto=nombreUsuario(request)
    Cod_Doc= (Docente.objects.get(email=request.user.username)).id
    Tupla_Grupo = Grupo.objects.filter(Cod_Docente=Cod_Doc)

    Lista_Mat = []
    for elemento in Tupla_Grupo:
        mat = (elemento.Cod_Materia.Nombre).strip()
        if(mat) not in Lista_Mat:           
            Lista_Mat.append(mat)

    rango = Parametro.objects.last()

    contexto={
        'nombre':nombreCompleto,
        'Tupla_Grupo' :Tupla_Grupo,
        'tuplita' : Lista_Mat,
        'error' : error,
        'rango' : rango
        }
    return render(request, "FormularioReserva.html",contexto)
    
@login_required(login_url='/login/')
def Ambiente(request):

    nombreCompleto=nombreUsuario(request)

    contexto={
        'nombre':nombreCompleto,
        }
    return render(request, "FormularioAmbiente.html",contexto)

@login_required(login_url='/login/')
def ReservaExitosa(request):

    nombreCompleto=nombreUsuario(request)
    Cod_Doc= (Docente.objects.get(email=request.user.username)).id
    informe = Reserva.objects.filter(Cod_Docente_id=Cod_Doc).order_by("-id")
    Motivo=request.POST.get('Motivo','')
    Justificacion=request.POST.get('Justificacion','')
    Materia = request.POST.get('Materia','')
    Grupo = request.POST.get('Grupo','')
    Alumno = request.POST.get('Alumno','')
    Fecha = request.POST.get('Fecha','')
    Horario = request.POST.get('Hora','')
    CantPeriodos = request.POST.get('CantPeriodos','')
    Ambiente=request.POST.get('Ambiente','')
    now=datetime.now()
    Fecha_Solicitud_Res = now.date()
    Hora_Solicitud_Res = now.time()
    
    contexto={
        'Motivo': Motivo,
        'Justificacion': Justificacion,
        'Materia' : Materia,
        'Grupo' : Grupo,
        'Alumno' : Alumno,
        'Fecha' : Fecha,
        'Horario' : Horario,
        'CantPeriodos' : CantPeriodos,
        'nombre':nombreCompleto,
        'Ambiente' : Ambiente,
        'FSol' : Fecha_Solicitud_Res,
        'HSol' : Hora_Solicitud_Res
        }
    # print(informe[0].motivo)
    
    return render(request, "ReservaExitosa.html",contexto)

@login_required(login_url='/login/')
def MisReservas(request):
    nombreCompleto=nombreUsuario(request)
    Cod_Doc= (Docente.objects.get(email=request.user.username)).id
    tarjetas = (Reserva.objects.filter(Cod_Docente_id=Cod_Doc))
    now=datetime.now()
    Fecha_actual = now.date()
    Hora_actual = now.time()
    
    for i in tarjetas:
      if(Fecha_actual > i.Fecha_Reserva):
         i.delete()

      if(Fecha_actual==i.Fecha_Reserva):
          if(Hora_actual>i.Hora_Reserva):
             i.delete()
      
    tarjetas2 = (Reserva.objects.filter(Cod_Docente_id=Cod_Doc))      
    contexto={
        'nombre':nombreCompleto,
        'tarjetas' : tarjetas2
    }
    
    # for tupla in tarjetas:
    #     print(tupla.Cod_Aula_id)
    return render(request, "MiReservaDocente.html",contexto)

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
        Justificacion=request.POST.get('Justificacion','')
        Motivo=Motivo.strip()
        nombreCompleto=nombreUsuario(request)
        Cod_Doc= (Docente.objects.get(email=request.user.username)).id
        
        
        Limite = limiteReserva(Grupo,Fecha,Materia,Cod_Doc)
        contexto ={
                'nombre':nombreCompleto,
                'Materia' : Materia,
                'Grupo' : Grupo,
                'Alumno' : Alumno,
                'Fecha' : Fecha,
                'Horario' : Horario,
                'CantPeriodos' : CantPeriodos,
                'Motivo' : Motivo,
                'Justificacion' : Justificacion,
                }

        if Limite == 1:
        
            Ambientes_aula = Aula.objects.filter(Cant_Estudiante__gte=Alumno).filter(Tipo_Aula="AUC").order_by("Cant_Estudiante")
            Ambientes_lab = Aula.objects.filter(Cant_Estudiante__gte=Alumno).filter(Tipo_Aula="LAB").order_by("Cant_Estudiante")
            Ambientes_aud = Aula.objects.filter(Cant_Estudiante__gte=Alumno).filter(Tipo_Aula="AUD").order_by("Cant_Estudiante")
    
            aula=buscarAmbienteDisponible(Ambientes_aula,Fecha,Horario,CantPeriodos)
            lab=buscarAmbienteDisponible(Ambientes_lab,Fecha,Horario,CantPeriodos)
            cant_aud=Ambientes_aud[0].Cant_Estudiante/2
            if(int(Alumno)>=cant_aud): 
              aud=buscarAmbienteDisponible(Ambientes_aud,Fecha,Horario,CantPeriodos)
            else:
              aud="No encontre"  
            
            contexto['Aula']= aula
            contexto['Laboratorio'] = lab
            contexto['Auditorio'] = aud  
            return render(request, "FormularioAmbiente.html",contexto)  
        else: 
           dir = "/Reserva/" + str(Limite) + "/"
           #return render(request, "FormularioReserva.html",contexto)     
           return redirect(dir)

def limiteReserva(grupo,fecha,materia,cod_doc):
 #respuesta = "Todo bien"
 respuesta = 1
 #now=datetime.now()
 #fecha_actual = now.date()
 filtro = Reserva.objects.filter(Grupo=grupo).filter( Cod_Docente=cod_doc).filter(Materia=materia).filter(Fecha_Reserva=fecha)
 if (len(filtro)>0):
  #respuesta = "Materia y Grupo ya registrado para este dia"
  respuesta = 2
 filtro_2 = Reserva.objects.filter(Grupo=grupo).filter( Cod_Docente=cod_doc).filter(Materia=materia)
 if(len(filtro_2)>=2):
  #respuesta = "Solo se permiten 2 reservas por Materia y Grupo"
  respuesta = 3
 
 return respuesta

def Eliminar(request):
    Codigo =  request.GET.get('Codigo', None)
    print("este es el codigo espero no de bugs")
    print(Codigo)
    Tupla = Reserva.objects.get(id=Codigo)
    Tupla.delete()
    return redirect("/MisReservas/")

def pruebita(request):
    
    aula = request.GET.get('Aula', None)
    Laboratorio = request.GET.get('Laboratorio', None)
    Auditorio = request.GET.get('Auditorio', None)

    Mate = request.GET.get('Materia', None)
    Grupi = request.GET.get('Grupo', None)
    Alumno = request.GET.get('Alumno', None)
    Fecha = request.GET.get('Fecha', None)
    Horario = request.GET.get('Horario', None)
    CantPeriodos = request.GET.get('CantPeriodos', None)
    Motivo = request.GET.get('Motivo', None)
    Justify = request.GET.get('Justificacion', None)
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
    # print(Mate)
    # print(Grupi)
    # print(Motivo)
    Save_Reserva = models.Reserva.objects.create(
        cant_Periodos = CantPeriodos,
        Hora_Reserva = Horario,
        Fecha_Solicitud_Res = now.date(),
        motivo = Motivo,
        Cant_Est_Sol = Alumno,
        Cod_Docente_id = Cod_Doc,
        Cod_Aula_id = Codigo_Aula,
        Fecha_Reserva = Fecha,
        Hora_Solicitud_Res = now.time(),
        Materia = Mate,
        Grupo = Grupi,
        Cod_Ambiente = filtroAmbiente,
        Justificacion = Justify
    )
    Save_Reserva.save()
    
    # contexto = {'Motivo' : Motivo}
    return render(request,"ReservaExitosa.html")

def buscarAmbienteDisponible(Ambientes,Fecha,Horario,CantPeriodos):
    print("funcionBuscar")
    ambiente_elegido="No encontre"
    horarios = ["06:45","08:15","09:45","11:15","12:45","14:15","15:45","17:15","18:45","20:15"]
    HorarioAnterior = ""
    HorarioPosterior =""
    posPlus = 0
    print("antes de buscar horario anterior  :"+Horario)
    if( Horario in horarios and Horario != "06:45"):
        pos = horarios.index(Horario)-1
        posPlus = pos+2
        HorarioAnterior = horarios[pos]
        print("horario anterior : "+HorarioAnterior)
     
    print("Cantidad de Periodos " + str(CantPeriodos))

    if CantPeriodos=="2":
        print("Ingresando if")
        pos = horarios.index(Horario)+1
        print("esta es la posicion de de horarios + 1 deberia ser 1?" + str(pos))
        HorarioPosterior = horarios[pos]
        print(HorarioPosterior)
    

    for i in Ambientes:
        id_Aula = i.id

        ocupado = Reserva.objects.filter(Fecha_Reserva=Fecha).filter(Hora_Reserva=Horario).filter(Cod_Aula=id_Aula)
        ocupadoAux = ""
        ocupadoAux2 = ""
        if(len(HorarioAnterior) != 0):
           ocupadoAux = Reserva.objects.filter(Fecha_Reserva=Fecha).filter(Hora_Reserva=HorarioAnterior).filter(Cod_Aula=id_Aula).filter(cant_Periodos=2)
        if(len(HorarioPosterior)!=0):
           ocupadoAux2 = Reserva.objects.filter(Fecha_Reserva=Fecha).filter(Hora_Reserva=HorarioPosterior).filter(Cod_Aula=id_Aula) 
 
        if (len(ocupado)==0 and len(ocupadoAux) == 0 and len(ocupadoAux2) == 0):
           ambiente_elegido=i.Cod_Aula
           print(ambiente_elegido)
           break

    return ambiente_elegido

def mensaje(req,mensajeError):  
    messages.add_message(request=req, level=messages.WARNING, message = mensajeError)


@login_required(login_url='/login/')
def VistaAdmin(request):
    
    nombreCompleto=request.user.first_name
    contexto={'nombre':nombreCompleto}
    return render(request,"VistaAdministrador.html",contexto)

@login_required(login_url='/login/')
def ReservasAdmin(request):
    nombreCompleto=request.user.first_name
    tarjetas = (Reserva.objects.all().select_related('Cod_Docente'))
    
    now=datetime.now()
    Fecha_actual = now.date()
    Hora_actual = now.time()
    
    for i in tarjetas:
      if(Fecha_actual > i.Fecha_Reserva):
         i.delete()

      if(Fecha_actual==i.Fecha_Reserva):
          if(Hora_actual>i.Hora_Reserva):
             i.delete()
      
    tarjetas2 = (Reserva.objects.all())      
    contexto={
        'nombre':nombreCompleto,
        'tarjetas' : tarjetas2
    }
    
    # for tupla in tarjetas:
    #     print(tupla.Cod_Aula_id)
    return render(request,"ReservasAdmin.html",contexto)

@login_required(login_url='/login/')
def VistaAmbientesAdmin(request):
    Ambientes = Aula.objects.all().order_by('Cod_Aula')
    nombreCompleto=request.user.first_name
    contexto={
        'nombre':nombreCompleto,
        'Ambientes' : Ambientes
        }
    return render(request,"VistaAmbientesAdmin.html",contexto)

@login_required(login_url='/login/')
def VistaDocentesAdmin(request):
    Docentes = Docente.objects.all().order_by('apellido_Docente')
    nombreCompleto=request.user.first_name
    contexto={
        'nombre':nombreCompleto,
        'Docentes' : Docentes
        }
    return render(request,"VistaDocentesAdmin.html",contexto)

@login_required(login_url='/login/')
def VistaParametrosAdmin(request):
    nombreCompleto=request.user.first_name
    rango = Parametro.objects.last()
    contexto={
        'nombre': nombreCompleto,
        'rango' : rango
        }
    if request.method=="GET" and request.GET.get('min', None):
        min = request.GET.get('min', None)
        max = request.GET.get('max', None)
        
        rango = models.Parametro.objects.create(Minimo=min,Maximo=max,MaximoReservas=2)
        rango.save()

    return render(request,"VistaParametrosAdmin.html",contexto)

@login_required(login_url='/login/')
def VistaAmbientesDocente(request):
    Ambientes = Aula.objects.all().order_by("Cod_Aula")
    nombreCompleto=nombreUsuario(request)
    contexto={ 
        'nombre': nombreCompleto,
        'Ambientes' : Ambientes
        }
    return render(request,"VistaAmbientesDocente.html",contexto)

@login_required(login_url='/login/')
def editarAmbiente(request):
    ident =  request.GET.get('id', None)
    ambiente =  request.GET.get('ambiente', None)
    tipo =  request.GET.get('tipo', None)
    size =  request.GET.get('size', None)
    print("estos son los dato")
    print(ident)
    print(ambiente)
    print(tipo)
    print(size)
    # cantidad = int(size)
    # dato = Aula.objects.get(id = ident)
    # dato.Cant_Estudiante = cantidad
    # dato.Cod_Aula = ambiente
    # dato.Tipo_Aula = tipo
    # dato.save()
    # test = models.Aula.objects.update()
    # obj.refresh_from_db()
    (Aula.objects.filter(id=ident)).update(Cant_Estudiante = int(size),Cod_Aula = ambiente,Tipo_Aula = tipo)
    return redirect("/Ambientes/")



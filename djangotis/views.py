from django.http import HttpResponse, request
from django.template import Template, Context, context
from django.shortcuts import render, redirect

def inicio(request): #Vista Inicio

    contexto={
    'id_profesor':5,
    'nombre_profesor':"juan",
    }
    return render(request,'index.html', contexto)
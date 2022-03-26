from django.http import HttpResponse, request
from django.template import Template, Context, context
from django.shortcuts import render, redirect

def inicio(request): #Vista Inicio
    return render(request,'index.html')
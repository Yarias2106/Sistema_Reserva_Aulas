from operator import truediv
from pickle import TRUE
from pyexpat import model
from statistics import mode
from django.db import models
from django.db.models.deletion import CASCADE
# Create your models here.
class Docente(models.Model):
    # El id de Docente se genera automaticamente
    nombre_Docente = models.CharField(max_length=50)
    apellido_Docente = models.CharField(max_length=50)
    email = models.CharField(max_length=80)
    contraseña = models.CharField(max_length=50)
    
    def __str__(self):
        return self.email

class Aula(models.Model):
    # El id de aula se genera automaticamente
    # Cod_Reserva= models.ForeignKey(Reserva,on_delete=CASCADE,null=True)
    Cant_Estudiante = models.IntegerField()
    Cod_Aula = models.CharField(max_length=60,null=True)
    Tipo_Aula = models.CharField(max_length=60,null=True)

    def __str__(self):
        return self.Cod_Aula


class Reserva(models.Model):
     # El id de Reserva se genera automaticamente
    Cod_Docente= models.ForeignKey(Docente,on_delete=CASCADE,null=True)
    Cod_Aula = models.ForeignKey(Aula,on_delete=CASCADE,null=True)
    cant_Periodos = models.IntegerField()
    Fecha_Reserva = models.DateField(null=True)
    Hora_Reserva = models.TimeField()
    Fecha_Solicitud_Res = models.DateField()
    Hora_Solicitud_Res = models.TimeField(null=True)
    motivo = models.CharField(max_length=256)
    Cant_Est_Sol=models.IntegerField()
    Materia = models.CharField(max_length=120,null=True)
    Grupo = models.CharField(max_length=16,null=True)
    Cod_Ambiente = models.CharField(max_length=60,null=True)
    def __str__(self):
        return self.motivo


class Materia(models.Model):
     # El id de Materia se genera automaticamente
    Nombre = models.CharField(max_length=60)
    Carrera = models.CharField(max_length=60)

    def __str__(self):
        return self.Nombre

# class Grupo(models.Model):
#      # El id de grupo se genera automaticamente
#     Cod_Materia= models.ForeignKey(Materia,on_delete=CASCADE,null=True)
#     Numero_Grupo = models.CharField(max_length=32)

#     def __str__(self):
#         return self.Numero_Grupo

class Grupo(models.Model):
     # El id de Grupo se genera automaticamente
    Cod_Docente = models.ForeignKey(Docente,on_delete=CASCADE,null=True)
    Cod_Materia= models.ForeignKey(Materia,on_delete=CASCADE,null=True)
    Cant_Inscritos = models.IntegerField(null=True)
    Cod_Grupo= models.CharField(max_length=60,null=True)
    
    
    def __str__(self):
        return self.Cod_Docente
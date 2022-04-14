from operator import truediv
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

    def __str__(self):
        return self.Cant_Estudiante


class Reserva(models.Model):
     # El id de Reserva se genera automaticamente
    Cod_Docente= models.ForeignKey(Docente,on_delete=CASCADE,null=True)
    Cod_Aula = models.ForeignKey(Aula,on_delete=CASCADE,null=True)
    cant_Periodos = models.IntegerField()
    fecha_Reserva = models.TimeField()
    Fecha_Solicitud_Res = models.TimeField()
    motivo = models.CharField(max_length=256)
    Cant_Est_Sol=models.IntegerField()

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
    Cod_Materia= models.ForeignKey(Materia,on_delete=CASCADE,null=True)
    # Cod_Grupo= models.ForeignKey(Grupo,on_delete=CASCADE,null=True)
    Cod_Docente = models.ForeignKey(Docente,on_delete=CASCADE,null=True)
    Cant_Inscritos = models.IntegerField(null=True)
    
    def __str__(self):
        return self.Cod_Docente
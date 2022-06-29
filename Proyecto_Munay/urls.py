"""Munay URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path
from Proyecto_Munay.views import inicio,loginPropio,VistaDocente,salir,Reserva_,validar,Ambiente,ReservaExitosa,MisReservas,Guardar,Eliminar,VistaAdmin, ReservasAdmin,VistaAmbientesAdmin,VistaAmbientesDocente,VistaDocentesAdmin,VistaParametrosAdmin,editarAmbiente,MatGrupoDocente

urlpatterns = [
    path('admin/', admin.site.urls),
    path('',inicio),
    path('login/',loginPropio),
    path('VistaDocente/',VistaDocente),
    path('salir/',salir),
    path('Reserva/<int:error>/',Reserva_),
    path('Ambiente/',Ambiente),
    path('ReservaExitosa/',ReservaExitosa),
    path('MisReservas/',MisReservas),
    path('validar/',validar),
    path('Guardar/', Guardar, name='Guardar'),
    path('Eliminar/', Eliminar, name='Eliminar'),
    path('VistaAdmin/',VistaAdmin),
    path('ReservasAdmin/', ReservasAdmin ),
    path('ConfigurarParametros/',VistaParametrosAdmin),
    path('Docentes/',VistaDocentesAdmin),
    path('Ambientes/',VistaAmbientesAdmin),
    path('VerAmbientes/',VistaAmbientesDocente),
    path('editarAmbiente/',editarAmbiente,name='editarAmbiente'),
    path('MatGrupoDocente/<int:pk>/',MatGrupoDocente)

]

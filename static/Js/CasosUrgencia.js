let diaActual = new Date();
let diasemana = diaActual.getDay();
let Urgencia = document.getElementById("CheckUrgente");

let horaAct = diaActual.getHours();
let minutosAct = diaActual.getMinutes();

//Domingos
if(diasemana === 0){
    Urgencia.disabled = true;
}

//Lunes a viernes despues de las 20:15
if(![0,6].includes(diaActual) && horaAct>= 20){
    Urgencia.disabled = true;
}

//Sabados despues de las 12:45
if(diasemana === 6 && horaAct>= 12){
    Urgencia.disabled = true;
}
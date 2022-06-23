let titleR = document.getElementById("tituloReservaAdmin");
let reserT = document.getElementById("home-tab");
let UrgenT = document.getElementById("profile-tab");
let existeN = document.getElementById("normal");
let existeU = document.getElementById("urgenciaT");
let vacio = document.getElementById("vacio");

if(existeN){
    console.log("Hay reservas normales");
}else{
    vacio.textContent = "No hay reservas";
}

function cambiarTitulo1(){
    titleR.textContent = "Reservas por orden de llegada";
    reserT.className = "nav-link active";
    UrgenT.className = "nav-link text-white";

    if(existeN){
        vacio.textContent = "";
    }else{
        vacio.textContent = "No hay reservas";
    }
}

function cambiarTitulo2(){
    titleR.textContent = "Reservas por Emergencia";
    reserT.className = "nav-link text-white";
    UrgenT.className = "nav-link active";

    if(existeU){
        vacio.textContent = "";
    }else{
        vacio.textContent = "No hay reservas de Emergencia";
    }
}
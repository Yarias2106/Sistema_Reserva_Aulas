let titleR = document.getElementById("tituloReservaAdmin");
let reserT = document.getElementById("home-tab");
let UrgenT = document.getElementById("profile-tab");

function cambiarTitulo1(){
    titleR.textContent = "Reservas por orden de llegada";
    reserT.className = "nav-link active";
    UrgenT.className = "nav-link text-white";
}

function cambiarTitulo2(){
    titleR.textContent = "Reservas por Urgencia";
    reserT.className = "nav-link text-white";
    UrgenT.className = "nav-link active";
}
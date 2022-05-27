function crearJustificativo(datoMin) {

  let limMin = parseInt(datoMin);
  let valorCheck = document.getElementById("Crear");
  let crearJust = document.getElementById("justCreate");

  let dateActU = getDiaActual();
  let dateMin = new Date();

  let fchForm = document.getElementById('Fecha');

  let horUrgencia = document.getElementById("Horario");
  let periodoUrgencia = document.getElementById("Periodo");


  if (valorCheck.value === "Apagado") {

    valorCheck.value = "Encendido"
    crearJust.innerHTML = `
      <label for="validationTextarea" class="form-label text-white">Justificativo:</label>
      <textarea class="form-control" name="Justificacion" placeholder="Justifique la urgencia de su reserva" id="Justificativo" name="Justificativo"></textarea>
     
      <div class="invalid-feedback">
      </div>
      `;
    crearJust.className = "mb-3";

    fchForm.min = dateActU;
    fchForm.value = "";
    horUrgencia.getElementsByTagName('option')[0].selected = 'selected';
    periodoUrgencia.getElementsByTagName('option')[0].selected = 'selected';

  } else {
    valorCheck.value = "Apagado";
    while (crearJust.firstChild) {
      crearJust.removeChild(crearJust.firstChild);
    }

    crearJust.className = "";
    fchForm.value = "";

    dateMin = limite(limMin);
    fchForm.min = dateMin;

    eliminarHorarios();

    horUrgencia.innerHTML = `
      <option disabled selected value="">Seleccione el horario</option><option>06:45</option>
      <option>08:15</option>
      <option>09:45</option><option>11:15</option><option>12:45</option>
      <option>14:15</option><option>15:45</option><option>17:15</option>
      <option>18:45</option><option>20:15</option>`;

    periodoUrgencia.getElementsByTagName('option')[0].selected = 'selected';

  }

};

function horarioActual() {

  let date = new Date();

  let horaA = date.getHours();
  let ArregloOpciones = [6, 8, 9, 11, 12, 14, 15, 17, 18, 20];
  let ArregloHorarios = ["06:45", "08:15", "09:45", "11:15", "12:45", "14:15", "15:45", "17:15", "18:45", "20:15"];
  let horUrgencia = document.getElementById("Horario");
  let diasemana = date.getDay();
  let horaAct = date.getHours();
  let minutosAct = date.getMinutes();

  let fchValor = document.getElementById('Fecha');

  let diaHoy = getDiaActual();

  if (fchValor.value === diaHoy) {
    //Lunes a viernes > 20:00 || Sabado > 12:00 ||  Domingo
    if ((![0, 6].includes(date) && horaAct >= 20) || (diasemana === 6 && horaAct >= 12) || (diasemana === 0)) {
      eliminarHorarios();
    } else {
      eliminarHorarios();

      let posAr = -1;

      for (pos in ArregloOpciones) {
        if (ArregloOpciones[pos] >= horaA) {
          posAr = pos;
          break;
        }
      }

      for (indx = posAr; indx < ArregloHorarios.length; indx++) {
        let opcionesU = document.createElement("option");
        opcionesU.text = ArregloHorarios[indx];
        horUrgencia.appendChild(opcionesU);
      }
    }
  }
};

function getDiaActual() {
  let dateActU = new Date();

  let dayActU = dateActU.getDate();
  let monthActU = dateActU.getMonth() + 1;
  let yearActU = dateActU.getFullYear();

  if (monthActU < 10) {
    if (dayActU < 10) {
      dateActU = `${yearActU}-0${monthActU}-0${dayActU}`;
    } else {
      dateActU = `${yearActU}-0${monthActU}-${dayActU}`;
    }
  } else {
    if (dayActU < 10) {
      dateActU = `${yearActU}-${monthActU}-0${dayActU}`;
    } else {
      dateActU = `${yearActU}-${monthActU}-${dayActU}`;
    }
  }

  return dateActU;
}

function eliminarHorarios() {
  let horUrgencia = document.getElementById("Horario");

  for (let i = horUrgencia.options.length; i >= 0; i--) {
    horUrgencia.remove(i);
  }

  horUrgencia.innerHTML = `
          <option disabled selected value="">Seleccione el horario</option>`;
}
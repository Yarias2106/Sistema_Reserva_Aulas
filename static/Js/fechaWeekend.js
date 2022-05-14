const picker = document.getElementById('Fecha');

picker.addEventListener('input', function(e){
  var day = new Date(this.value).getUTCDay();
  if([0].includes(day)){
    e.preventDefault();
    this.value = '';
    alert('No se permite reservar domingos');
  }

  let horarios = document.getElementById("Horario");

  if([6].includes(day)){
      
      for (let i = horarios.options.length; i >= 0; i--) {
        horarios.remove(i);
      }
      horarios.innerHTML = `<option disabled selected value="">Seleccione el horario</option><option>06:45</option><option>08:15</option>
      <option>09:45</option><option>11:15</option><option>12:45</option>`;
  }else{

        for (let i = horarios.options.length; i >= 0; i--) {
            horarios.remove(i);
          }

      horarios.innerHTML = `<option disabled selected value="">Seleccione el horario</option><option>06:45</option>
      <option>08:15</option>
      <option>09:45</option><option>11:15</option><option>12:45</option>
      <option>14:15</option><option>15:45</option><option>17:15</option>
      <option>18:45</option><option>20:15</option>`;
  }
});
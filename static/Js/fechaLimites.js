var parseDate = function(date){
    var parts = date.split('-');
    var temp = parts[0];
    parts[0] = parts[1];
    parts[1] = temp;
    return new Date(Date.parse(parts.join('/')));  
  }
  
  var sumDays = function(date, days){
    var fdate = parseDate(date);
    fdate.setDate(fdate.getDate()+days);
    return fdate;
  }

  function limite(lim){

    let dateN = new Date();
    let day = dateN.getDate();
    let month = dateN.getMonth() + 1;
    let year = dateN.getFullYear();

    if(month < 10){
      if(day<10){
        dateN = `0${day}-0${month}-${year}`;
      }else{
        dateN = `${day}-0${month}-${year}`;
      }
    }else{
      if(day<10){
        dateN = `0${day}-${month}-${year}`;
      }else{
        dateN = `${day}-${month}-${year}`;
      }
    }

    let fch = sumDays(dateN, lim);
    let fchDay = fch.getDate();
    let fchMonth = fch.getMonth() + 1;
    let fchYear = fch.getFullYear();

    let fechaFinal = new Date();

    if(fchMonth < 10){
      if(fchDay<10){
        fechaFinal = `${fchYear}-0${fchMonth}-0${fchDay}`;
      }else{
        fechaFinal = `${fchYear}-0${fchMonth}-${fchDay}`;
      }
    }else{
      if(fchDay<10){
        fechaFinal = `${fchYear}-${fchMonth}-0${fchDay}`;
      }else{
        fechaFinal = `${fchYear}-${fchMonth}-${fchDay}`;
      }
    }

    return fechaFinal;
  }

//Limites de fecha

let fechaOr = document.getElementById('Fecha');
let minimo = 10;
let maximo = 20;

let fechaMin = new Date();
let fechaMax = new Date();

fechaMin = limite(minimo);
fechaMax = limite(maximo);

fechaOr.min = fechaMin;
fechaOr.max = fechaMax;
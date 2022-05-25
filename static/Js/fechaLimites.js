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

let fch = sumDays("13-1-2022", 30);
let fchDay = fch.getDate();
let fchMonth = fch.getMonth() + 1;
let fchYear = fch.getFullYear();

console.log(fch);
console.log(fchDay);
console.log(fchMonth);
console.log(fchYear);

let fechaFinal = new Date();

if(fchMonth < 10){
    fechaFinal = `${fchYear}-0${fchMonth}-${fchDay}`;
}else{
    fechaFinal = `${fchYear}-${fchMonth}-${fchDay}`;
}

console.log(fechaFinal);
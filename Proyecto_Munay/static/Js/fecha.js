let date = new Date();

let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let monthMax;
let yearMax;

if(month < 10){
  date = `${year}-0${month}-${day}`;
}else{
  date = `${year}-${month}-${day}`;
}

document.getElementById('Fecha').value = date;
document.getElementById('Fecha').min = date;

let dateMax = new Date();
console.log(dateMax.getDate() + 13);
dateMax = date.setDate(date.getDate()+5);


// if(month==12){
//     monthMax = 1;
//     yearMax = year + 1; 
// }else{
//     monthMax = month + 1;
//     yearMax = year;
// }

// if(monthMax < 10){
//     dateMax = `${yearMax}-0${monthMax}-${day}`;
//   }else{
//     dateMax = `${yearMax}-${monthMax}-${day}`;
//   }

  document.getElementById('Fecha').max = dateMax;
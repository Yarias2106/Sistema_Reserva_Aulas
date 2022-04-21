let date = new Date();

let day = date.getDate();
let month = date.getMonth() + 1;
let year = date.getFullYear();
let monthMax;
let yearMax;
let dayMax;

if(month < 10){
  date = `${year}-0${month}-${day}`;
}else{
  date = `${year}-${month}-${day}`;
}

document.getElementById('Fecha').value = date;
document.getElementById('Fecha').min = date;

let dateMax = new Date();

 if(month =='01'){
    if(year%4==0 && (year%100!=0 || year%400==0)){
        if(day>=30){
            dayMax = 29;
        }else{
            dayMax = day;
        }
    }else{
        if(day>=29){
            dayMax = 28;
        }else{
            dayMax = day;
        }
    }
 }else{
    if(month == '03' || month == '05' || month == '08' || month == '10'){
        if(day==31){
            dayMax= 30;
        }else{
            dayMax= day;
        }
    }else{
        dayMax = day;
    }
 }

 if(month==12){
    monthMax = 1;
    yearMax = year + 1;     
}else{
    monthMax = month + 1;
    yearMax = year;
}

if(monthMax < 10){
    dateMax = `${yearMax}-0${monthMax}-${dayMax}`;
  }else{
    dateMax = `${yearMax}-${monthMax}-${dayMax}`;
  }

  document.getElementById('Fecha').max = dateMax;
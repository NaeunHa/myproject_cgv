const birth_year = document.querySelector('#birth_year');
const birth_month = document.querySelector('#birth_month');
const birth_day = document.querySelector('#birth_day');

let now = new Date();
let year = now.getFullYear();
let month = now.getMonth() + 1;
// let month = (now.getMonth() + 1) > 9 ? '' + (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
let day = now.getDate();
// let day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());
console.log('year : ' + year);
console.log('month : ' + month);
console.log('day : ' + day);

for(let i = 1900; i <= year ; i++){
    if(i == year){
        birth_year.innerHTML += `<option value="${i}" selected>${i}</option>`;
    }else{
        birth_year.innerHTML += `<option value="${i}">${i}</option>`;
    }
}

for(let i = 1; i <= 12; i++){
    if(i == month){
        birth_month.innerHTML += `<option value="${i}" selceted>${i}</option>`;
    }else{
        birth_month.innerHTML += `<option value="${i}">${i}</option>`;
    }
    
    for(let j = 1; j <= 31; j++){
        if(j == day){
            console.log(i)
            birth_day.innerHTML += `<option value="${j}" selected>${j}</option>`;
        }else{
            birth_day.innerHTML += `<option value="${j}">${j}</option>`;
        }
    }
} 
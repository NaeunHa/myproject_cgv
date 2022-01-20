const email_site_select = document.querySelector('.select_email_site');
const select_year = document.querySelector('#select_year');
const select_month = document.querySelector('#select_month');
const select_day = document.querySelector('#select_day');
const item_ip =  document.querySelectorAll('.item_ip'); 
const submit_btn = document.querySelector('.submit_btn');
const error_msg = document.querySelectorAll('.error_msg');
const success_msg = document.querySelector('.success_msg');
//  [0]:이름, [1]:아이디, [2]:비밀번호, [3]:비밀번호 확인, [4]: 이메일id
const param_phone = document.querySelector('#param_phone');

var signUpData = {
	username : "",
	userid : "",
	password : "",
	phone : param_phone.value,
	birthday : "",
	email : ""
}

var signUpFlag = new Array();
for(let i = 0; i < 6; i++){
	signUpFlag.push(false);
}
// [0]:이름, [1]:아이디, [2]:비밀번호 확인, [3]:생일-년도, [4]:생일-월, [5]:생일-일, [6]:이메일


let selected_email_val = "";
let selected_val = "";
let user_email =  "";

function insertDateOptions(select_year, select_month, select_day){
	let now = new Date();
	let year = now.getFullYear();
	let month = now.getMonth() + 1;
	let day = now.getDate();
		
	for(let i = 1900; i <= year ; i++){
	    if(i == year){
	        select_year.innerHTML += `<option value="${i}" selected="selected">${i}</option>`;
	    }else{
	        select_year.innerHTML += `<option value="${i}">${i}</option>`;
	    }
	};
	
	var last_day = 31;
	
	for(let i = 1; i <= 12; i++){
	    if(i == month){
	        select_month.innerHTML += `<option value="${i}" selected="selected">${i}</option>`;
	    }else{
	        select_month.innerHTML += `<option value="${i}">${i}</option>`;
	    }
	
	    if( i == 2 ) {
	    	last_day = 28;
	    }else if( (i % 2) == 0){
	    	last_day = 30;
	    }
	    
		for(let j = 1; j <= last_day; j++){
		    if(j == day){
		        select_day.innerHTML += `<option value="${j}" selected="selected">${j}</option>`;
		    }else{
		        select_day.innerHTML += `<option value="${j}">${j}</option>`;
		    }
		}
	};
}

function checkId(user_id, success_msg, error_msg){
	console.log(user_id.value);

	$.ajax({
		type: "post",
		url: "/auth/sign-up/confirm-id/" + user_id.value,
		success: function(data){
			if(data == 0){
				id_confirm_btn.style.display = "none";
				error_msg.style.display = "none";
				success_msg.style.display = "block";
				item_ip[1].setAttribute("readonly", "readonly");
				signUpData.userid = user_id.value;
				signUpFlag[1] = true;
			}else{
				error_msg.style.display = "block";
				success_msg.style.display = "none";
				signUpFlag[1] = false;
			}
		},
		error: function(){
			alert('비동기처리 오류');
		}
	});
}

function checkEmail() {
	const user_email_id = document.querySelector('#user_email_id');
	user_email = user_email_id.value + '@' + selected_val;
	
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(regEmail.test(user_email)){
		error_msg[3].style.display = "none";
		signUpData.email = user_email;
		signUpFlag[6] = true;
	}else{
		error_msg[3].style.display = "block";
		signUpFlag[6] = false;
	}
}

function noKeyPressF5(e){
	if(e.keyCode == 116){
		e.preventDefault();
		let result =  confirm("페이지 새로고침을 하면 정보가 모두 날라갑니다.\n새로고침 하시겠습니까?");

		if(result == true){
			location.href = "/auth/check-phone";
		}else{
			return false;
		}
	}else if(e.ctrlKey && (e.keyCode == 78 || e.keyCode == 82)){
		e.preventDefault();
		// ctrl + r , ctrl + h
		let result = confirm("페이지 새로고침을 하면 정보가 모두 날라갑니다.\n새로고침 하시겠습니까?");
		if(result == true){
			location.href = "/auth/check-phone";
		}else{
			return false;
		}
	}
}

// 년, 월, 일 option 태그 추가
insertDateOptions(select_year, select_month, select_day);
	
// email option 클릭시 selected 처리
email_site_select.onchange = () => {
	 selected_val = email_site_select.options[email_site_select.selectedIndex].value;
	 if(selected_val == '1'){
		email_site.value = '';
		email_site.removeAttribute("readonly");
	}else{
		email_site.value = selected_val;
		email_site.setAttribute("readonly", "readonly");
	}
	checkEmail();
}

// 이름
item_ip[0].onkeyup = () => {
	const username = document.querySelector('#username');
	signUpData.username = username.value;
	signUpFlag[0] = true;
}
		
// 아이디 중복확인
id_confirm_btn.onclick = () => {
	const user_id = document.querySelector('#user_id');
	if(user_id.value.length > 4){
		checkId(user_id, success_msg, error_msg[0]);
	}else{
		alert('아이디가 너무 짧습니다.');
	}
};
		
			
// 비밀번호 정규식
var regPw = /^.*(?=^.{8,12}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
let user_ip_pw = "";

item_ip[2].onkeyup = () => {
	
	var user_pw_val = item_ip[2].value;
	
	if(regPw.test(user_pw_val)){
		error_msg[1].style.display = "none";
		user_ip_pw = user_pw_val;
	}else{
		error_msg[1].style.display = "block";
	}
};
		
// 비밀번호 확인
item_ip[3].onkeyup = () => {		
	if(item_ip[3].value == user_ip_pw){
		error_msg[2].style.display = "none";
		signUpData.password = confirm_pw.value;
		signUpFlag[2] = true;
	}else{
		error_msg[2].style.display = "block";		
		signUpFlag[2] = false;
	}
}
		
// 생년월일
let selected_year = "";
let selected_month = "";
let selected_day = "";

select_year.onchange = () => {
	selected_year = select_year.options[select_year.selectedIndex].value;
	console.log(selected_year);
	signUpFlag[3] = true;
}

select_month.onchange = () => {
	selected_month = select_month.options[select_month.selectedIndex].value;
	if(selected_month < 10){
		selected_month = "0" + selected_month;
	}
	console.log(selected_month);
	
	let last_day = 31;
	if( selected_month == 2 ) {
    	last_day = 28;
    }else if( (selected_month % 2) == 0){
    	last_day = 30;
    }
    select_day.innerHTML = "";
	for(let j = 1; j <= last_day; j++){
		if(j == 1){
		 	select_day.innerHTML += `<option value="${j}" selected="selected">${j}</option>`;
		 }else{
		 	select_day.innerHTML += `<option value="${j}">${j}</option>`;
		 }
	}
	signUpFlag[4] = true;
}

select_day.onchange = () => {
	selected_day = select_day.options[select_day.selectedIndex].value;
	if(selected_day < 10){
		selected_day = "0" + selected_day;
	}
	console.log(selected_day);
	signUpFlag[5] = true;
}


// 이메일 정규식	
item_ip[4].onkeyup = () => {
	checkEmail(user_email_id);
}
		
		
// 회원가입
submit_btn.onclick = () => {
	
	let count = 0;
	for(let i = 0; i < signUpFlag.size; i++){
		if( signUpFlag[i] == false ){
			count ++;
		}
	}
	
	if(count == 0){
		signUpData.birthday = selected_year + selected_month + selected_day;
		console.log(signUpData);
	
		$.ajax({
			type: "post",
			url: "/auth/sign-up",
			data : JSON.stringify(signUpData),
			dataType: "text",
			contentType: "application/json;charset=UTF-8",
			success : function(data){
				if(data == 1){
				alert("회원가입이 완료되었습니다.\n로그인 페이지로 이동합니다.");
				location.href = "/auth/sign-in";
				}else{
					alert("회원가입에 실패했습니다.");
					console.log(data);
				}
			},
			error: function(){
				alert('비동기처리 오류');
			}
		});
	}else{
		alert('형식이 다 채워지지 않았습니다.');
	}
}

// 새로고침 방지
document.onkeydown = (e) => {
	noKeyPressF5(e);
}

// 뒤로가기 방지

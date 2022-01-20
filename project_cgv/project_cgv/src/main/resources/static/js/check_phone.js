const certification_btn = document.querySelector('.certification_btn');
const sa_code_inputs = document.querySelector('.sa_code_inputs');
const certification_code_btn = document.querySelector('.certification_code_btn');
const code_number = document.querySelector('#code_number');
const submit_btn = document.querySelector('.submit_btn');
const id_confirm_btn = document.querySelector('#id_confirm_btn');

let item_ip = ""; // [0]: 
//  [0]:이름, [1]:아이디, [2]:비밀번호, [3]:비밀번호 확인, [4]: 이메일id
let email_site_select = "";
let select_birth = "";

sa_code_inputs.style.display = "none";
let phone = "";
let sms_code = "";

function sendSMS(phone_num){
	
	if(phone_num.value.length == 11){
		phone = phone_num.value;
		console.log(phone);
		
		$.ajax({
			type: "post",
			url: "/auth/sign-up/sendSMS/" + phone,
			success: function(data){
				alert('메세지가 전송 되었습니다.');
				sms_code = data;
				
				// 핸드폰 번호 readonly 처리 및 인증버튼 숨기기
				certification_btn.style.display = 'none';
				phone_num.setAttribute("readonly", "readonly");
				
				// 코드입력창, 인증버튼 block 처리
				sa_code_inputs.style.display = "flex";
			},
			error: function(){
				alert('비동기처리 오류');
				phone_num.focus();
			}
		});
	
	}else{
		alert('입력이 잘못되었습니다.');
	}
}

function checkSMSCode(code){
	if( code.length == 6 ){
		
		if(sms_code == code){
			alert('인증되었습니다.');
			location.replace("/auth/sign-up?phone=" + phone);
		}else{
			alert('인증번호가 다릅니다.');
		}
		
	}else{
		alert('입력이 잘못되었습니다.');
	}
}

function noKeyPressF5(e){
	if(e.keyCode == 116){
		e.preventDefault();
		let result =  confirm("페이지 새로고침을 하면 정보가 모두 날라갑니다.\n새로고침 하시겠습니까?");

		if(result == true){
			return true;
		}else{
			return false;
		}
	}else if(e.ctrlKey && (e.keyCode == 78 || e.keyCode == 82)){
		e.preventDefault();
		// ctrl + r , ctrl + h
		let result = confirm("페이지 새로고침을 하면 정보가 모두 날라갑니다.\n새로고침 하시겠습니까?");
		if(result == true){
			return true;
		}else{
			return false;
		}
	}
}

// 인증번호 문자 보내기
certification_btn.onclick = () => {
   const phone_num = document.querySelector('#phone_num');
	sendSMS(phone_num);
};

// 인증번호 확인

certification_code_btn.onclick = () => {
	let code = code_number.value;
	checkSMSCode(code);
};

// 새로고침 방지
document.onkeydown = (e) => {
	noKeyPressF5(e);
}

// 뒤로가기 방지

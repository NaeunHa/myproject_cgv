const submit_btn = document.querySelectorAll('.submit_btn'); 
// [0]:sendSMS, [1]:checkCode
const item_ip = document.querySelectorAll('.item_ip');
// [0]: phoneNum, [1]: codeNum
const sa_code_box = document.querySelector('.sa_code_box');


sa_code_box.style.display = "none";
let phone = "";
let sms_code = "";

function sendSMS(phoneNum){
	
	if(phoneNum.value.length == 11){
		phone = phoneNum.value;
		
		$.ajax({
			type: "post",
			url: "/auth/sign-up/sendSMS/" + phone,
			success: function(data){

				if(data != 1){
					alert('메세지가 전송 되었습니다.');
					sms_code = data;
					
					// 핸드폰 번호 readonly 처리 및 인증버튼 숨기기
					submit_btn[0].style.display = 'none';
					phoneNum.setAttribute("readonly", "readonly");
					
					// 코드입력창, 인증버튼 block 처리
					sa_code_box.style.display = "block";
				}else{
					alert('이미 가입되어 있는 번호 입니다.');
					phoneNum.value = "";
					phoneNum.focus();
				}

			},
			error: function(){
				alert('비동기처리 오류');
				phoneNum.focus();
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
submit_btn[0].onclick = () => {
	sendSMS(item_ip[0]);
};

// 인증번호 확인
submit_btn[1].onclick = () => {
	checkSMSCode(item_ip[1].value);
};

// 새로고침 방지
document.onkeydown = (e) => {
	noKeyPressF5(e);
}

// 뒤로가기 방지

/**
 * 비밀번호 재설정
 */
 
 const id_ip = document.querySelector('.id_ip');
const ip_phone = document.querySelector('.ip_phone');
const ip_code = document.querySelector('.ip_code');
const pw_ip = document.querySelectorAll('.pw_ip');
const box_content = document.querySelectorAll('.box_content');
const send_btn = document.querySelector('.send_btn');
const check_btn = document.querySelector('.check_btn');
const set_btn = document.querySelector('.set_btn');
const code_box = document.querySelector('.code_box');
const errorMsg = document.querySelectorAll('.errorMsg');

let id = "";
let code = "";
let checkPasswordFlag = false;

id_ip.focus();

code_box.style.display = "none";
box_content[1].style.display = "none";

function sendMessage(phoneNum){
	
	if(phoneNum.length == 11){
		
		 $.ajax({
			type: "post",
			url: "/auth/check/" + phoneNum,
			dataType: "text",
			success: function(data){
				console.log(data.length);
				if(data != null){
					alert('코드 전송 완료');
					code = data;
					id_ip.setAttribute("readonly", "readonly");
					ip_phone.setAttribute("readonly", "readonly");
					
					send_btn.style.display = "none";
					code_box.style.display = "flex";
					ip_code.focus();
				}else{
					alert("가입되어있지 않은 번호 입니다.");
				}
				
			},
			error: function(){
				alert('비동기 처리 오류');
			}
		});
	}else{
		alert('입력이 올바르지 않습니다.');
	}
}

function checkCode(ip_code){
	if(ip_code == code){
		alert("인증되었습니다.");
		
		$.ajax({
			type: "post",
			url: "/auth/confirm-id/" + id_ip.value,
			dataType: "text",
			success: function(data){
				if(data == 1){
					id = id_ip.value;
					box_content[0].style.display = "none";
					box_content[1].style.display = "block";	
					pw_ip[0].focus();				
				}else{
					alert('존재하지 않는 아이디 입니다.');
				}
			},
			error: function(){
				alert('비동기 처리 오류');
			}
		});
		
	}else{
		alert("일치하지 않습니다.");
	}
}

function updatePassword(checkPasswordFlag){
	if(checkPasswordFlag == true){
	
		$.ajax({
			type: "patch",
			url: "/auth/update/password",
			data: {
				"userid": id,
				"newPassword": pw_ip[1].value
			},
			dataType: "text",
			success: function(data){
				let passwordRespObj = JSON.parse(data);
				console.log(passwordRespObj);
		
				if(passwordRespObj.code == 200){
					alert('비밀번호가 재설정 되었습니다.\n 로그인 창으로 이동합니다.');
					location.href = "/auth/sign-in";
				}else{
					alert(passwordRespObj.message);
					pw_ip[0].value = "";
					pw_ip[1].value = "";
					pw_ip[0].focus();
				}
			}
		});
	}
}
 
/* 숫자만 입력할 수 있게 */
function fn_press(event, type) {
	if (type == 'numbers') {
		if (event.keyCode < 48 || event.keyCode > 57) {
			return false;
		}
	}
}

/* 한글은 입력할 수 없게(좌, 우 방향키, 백스페이스, 딜리트, 탭키는 예외) */
function fn_press_kor(obj) {
	if (window.event.keyCode == 8 || window.event.keyCode == 9 || window.event.keyCode == 37 ||
		window.event.keyCode == 39 || window.event.keyCode == 46) {
		return;
	}
	obj.value = obj.value.replace(/[\a-zㄱ-ㅎㅏ-ㅣ가-힣]/g, '');
}

function clearMsgNode(msg){
	while(msg.hasChildNodes()){
		msg.removeChild(msg.firstChild);
	}
	msg.style.display = 'none';
}

function messageService(indexNumber, msgText){
	

	//msg를 모두 clear하는 작업
	clearMsgNode(errorMsg[indexNumber]);
	
	let msgTextNode = document.createTextNode(msgText);
		
		errorMsg[indexNumber].appendChild(msgTextNode);
		errorMsg[indexNumber].style.display = 'block';
}

function passwordCheck(id,password){
    if(! /^[a-z0-9#?!@$%^&*-]{8,12}$/.test(password)){
        let msg = '숫자, 영문자, 특수문자 조합으로 8~12자리를 사용해야 합니다.';
        return msg;
    }
    
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
	var checkSpecialChar = password.search(/[#?!@$ %^&*-]/g);
    
    // 빈값확인
    if(checkNumber <0 || checkEnglish <0 || checkSpecialChar <0){
        let msg = '숫자, 영문자, 특수문자를 혼용하여야 합니다.';
        return msg;
    }
    
    if(/(\w)\1\1\1/.test(password)){
        let msg = '444같은 문자를 4번 이상 사용하실 수 없습니다.';
        return msg;
    }
    
    if(password.search(id) > -1){
        let msg = '비밀번호에 아이디가 포함되었습니다.';
        return msg;
    }

    return 'true'; // 성공시 문자열 true 반환 (return값들이 String이기 때문에)
}

ip_phone.onkeyup = (e) => {
	fn_press(e, ip_phone.type);
	fn_press_kor(ip_phone);
}

send_btn.onclick = () => {
	sendMessage(ip_phone.value);
}
check_btn.onclick = () => {
	checkCode(ip_code.value);
}

// 비밀번호 정규식
pw_ip[0].onkeyup = () => {
	let msg = passwordCheck(id, pw_ip[0].value);
	if(msg == 'true'){
		clearMsgNode(errorMsg[0]);
	}else{
		messageService(0, msg);	
	}
};

// 비밀번호 확인
pw_ip[1].onkeyup = () => {		
	if(pw_ip[1].value == pw_ip[0].value){
		clearMsgNode(errorMsg[1]);
		checkPasswordFlag = true;
	}else{
		let msg = "비밀번호가 다릅니다.";
		messageService(1, msg);
		checkPasswordFlag = false;
	}
}

set_btn.onclick = () => {
	updatePassword(checkPasswordFlag);
}
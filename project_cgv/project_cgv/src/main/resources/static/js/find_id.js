/**
 * 아이디 찾기 
 */
 const ip_phone = document.querySelector('.ip_phone');
 const ip_code = document.querySelector('.ip_code');
 const send_btn = document.querySelector('.send_btn');
 const check_btn = document.querySelector('.check_btn');
 const code_box = document.querySelector('.code_box');
 const id_box = document.querySelector('.id_box');
 const box_content = document.querySelectorAll('.box_content');
 
 code_box.style.display = "none";
 box_content[1].style.display = "none";
 
 let code = null;
 let phoneNum = null;
 let user_id = null;
 
function sendMessage(phoneNum){
	
	if(phoneNum.length == 11){
		
		 $.ajax({
			type: "post",
			url: "/auth/find/check-phone/" + phoneNum,
			dataType: "text",
			success: function(data){
				console.log(data.length);
				if(data != null){
					alert('코드 전송 완료');
					code = data;
					send_btn.style.display = "none";
					ip_phone.setAttribute('readonly', 'readonly');		
					code_box.style.display = "block";
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

function checkCode(data){
	if(data == code){
		alert("인증되었습니다.");
		
		$.ajax({
			type: "post",
			url: "/auth/find/checked-phone/"+phoneNum,
			dataType: "text",
			success: function(data){
				box_content[0].style.display = "none";
				box_content[1].style.display = "block";
				id_box.innerHTML = `<span>${data}</span>`;
			},
			error: function(){
				alert('비동기 처리 오류');
			}
		});
		
	}else{
		alert("일치하지 않습니다.");
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

ip_phone.onkeyup = (e) => {
	fn_press(e, ip_phone.type);
	fn_press_kor(ip_phone);
}
ip_code.onkeyup = (e) => {
	fn_press(e, ip_code.type);
	fn_press_kor(ip_code);
}
send_btn.onclick = () => {
	phoneNum = ip_phone.value;
	sendMessage(phoneNum);
}
check_btn.onclick = () => {
	checkCode(ip_code.value);
}

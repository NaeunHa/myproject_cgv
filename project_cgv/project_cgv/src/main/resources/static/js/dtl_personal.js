/**
 * 회원정보 수정
 */

const user_info = document.querySelectorAll('.user_info');
// [0]: 아이디, [1]: 전화번호, [2]: 이메일 

const item_ip = document.querySelectorAll('.item_ip');
// [0]: 비밀번호, [1]: 비밀번호 확인, [2]: 전화번호, [3]: 전화번호 인증코드, [4]: 이메일 , [5]: 이메일확장자

const change_btn = document.querySelectorAll('.change_btn');
// [0]: 비밀번호, [1]: 전화번호, [2]: 이메일

const hidden_box = document.querySelectorAll('.hidden_box');
// [0]: 비밀번호 입력, [1]: 비밀번호 확인, [2]: 전화번호, [3]: 이메일

const now_info = document.querySelectorAll('.now_info');
// [0]: 전화번호, [1]: 이메일

const errorMsg = document.querySelectorAll('.errorMsg');
// [0]: 비밀번호, [1]: 비밀번호 확인, [2]: 이메일

const sendSMS_btn = document.querySelector('.sendSMS_btn');
// [0]: 휴대폰 인증

const update_personal_btn = document.querySelectorAll('.update_personal_btn');
// [0]: 비밀번호 변경, [1]: 휴대폰 인증 확인 및 변경, [2]: 이메일 변경

const birth_select = document.querySelectorAll('.birth_select');
//[0]: year, [1]: month, [2]: day

const item_select = document.querySelector('.item_select'); // 이메일 확장자 선택
//[0]: 비밀번호, [1]: 휴대폰, [2] 이메일

const set_birth_btn = document.querySelector('.set_birth_btn');
const birth_empty_box = document.querySelector('.birth_empty_box');
const set_bith_hidden_box = document.querySelector('.set_bith_hidden_box');
const update_birth_btn = document.querySelector('.update_birth_btn');
const user_phone = document.querySelector('.user_phone');

const code_box = document.querySelector('.code_box'); // 휴대전화 인증코드
const principal_birth = document.querySelector('.principal_birth');

let isPasswordValid = false;
let selected_year = "";
let selected_month = "";
let selected_day = "";

var phone_start = user_info[1].value.substr(0, 3);
var phone_middle = user_info[1].value.substr(3, 4);
var phone_end = user_info[1].value.substr(7, 4);

user_phone.textContent = phone_start + "-" + phone_middle + "-" + phone_end;

if(principal_birth != null){
    let year = principal_birth.value.substring(0, 4);
    let month = principal_birth.value.substring(4, 6);
    let day = principal_birth.value.substring(6, 8);
    
    const user_birth = document.querySelector('.user_birth');
	user_birth.textContent = `${year}년 ${month}월 ${day}일`;
	
}else{
    insertDateOptions(birth_select[0], birth_select[1], birth_select[2]);
    setBirthday(birth_select[0], birth_select[1], birth_select[2]);
    
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
    
    
        for(let i = 1; i <= 12; i++){
            if(i == month){
                select_month.innerHTML += `<option value="${i}" selected="selected">${i}</option>`;
            }else{
                select_month.innerHTML += `<option value="${i}">${i}</option>`;
            }
        
            setDateOption(select_day, i, day);
        };
    }
    
    function setDateOption(select_day, month, day){
        var last_day = 31;
    
        if( month == 2 ) {
            last_day = 28;
        }else if( (month % 2) == 0){
            last_day = 30;
        }
        
        if(day == 0){
            for(let j = 1; j <= last_day; j++){
                if(j == 1){
                    select_day.innerHTML += `<option value="${j}" selected="selected">${j}</option>`;
                }else{
                    select_day.innerHTML += `<option value="${j}">${j}</option>`;
                }
            }
        }else{
            for(let j = 1; j <= last_day; j++){
                if(j == day){
                    select_day.innerHTML += `<option value="${j}" selected="selected">${j}</option>`;
                }else{
                    select_day.innerHTML += `<option value="${j}">${j}</option>`;
                }
            }
        }
    }

    function setBirthday(select_year, select_month, select_day){    
        // year
        select_year.onchange = () => {
            selected_year = select_year.options[select_year.selectedIndex].value;
        }
        
        // month
        select_month.onchange = () => {
            selected_month = select_month.options[select_month.selectedIndex].value;
            if(selected_month < 10){
                selected_month = "0" + selected_month;
            }
        
            setDateOption(select_day, selected_month, 0);
        }
        
        //day 
        select_day.onchange = () => {
			 selected_day = select_day.options[select_day.selectedIndex].value;
			 if(selected_day < 10){
				selected_day = "0" + selected_day;
			}
		}
    }
}

// 생년월일
for(let i = 0; i < change_btn.length; i++){
    change_btn[i].onclick = () => {
        if(i == 0){
            // 비밀번호 변경 -> 입력창  + 정규식 + 확인 column open
            hidden_box[i].classList.toggle('hidden_box');
            hidden_box[i+1].classList.toggle('hidden_box');
        }else if(i == 1){
            // 전화번호 변경 -> 입력창 + 인증버튼 open
            now_info[0].classList.toggle('hidden_box');
            hidden_box[i+1].classList.toggle('hidden_box');

        }else if(i == 2){
            // 이메일 변경 -> 입력창 open + 정규식 errorMsg open
            now_info[1].classList.toggle('hidden_box');
            hidden_box[i+1].classList.toggle('hidden_box');
            hidden_box[i+2].classList.toggle('hidden_box');
        }
    }
}

let isBirthValid = false;
if(set_birth_btn != null){
    set_birth_btn.onclick = () => {
		console.log("click");
		birth_empty_box.classList.toggle('hidden_box');
		set_bith_hidden_box.classList.toggle('hidden_box');
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

let phone = "";
let sms_code = "";

function sendSMS(phoneNum){
	console.log(phoneNum.value);
	if(phoneNum.value.length == 11){
		phone = phoneNum.value;
		
		$.ajax({
			type: "post",
			url: "/auth/sendSMS/" + phone,
			success: function(data){
				if(data != 1){
					alert('메세지가 전송 되었습니다.');
					sms_code = data;
					
					// 핸드폰 번호 readonly 처리 및 인증버튼 숨기기
					update_personal_btn[0].style.display = 'none';
					phoneNum.setAttribute("readonly", "readonly");
					
					// 코드입력창, 인증버튼 block 처리
					code_box.style.display = "block";
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
		return false;
	
	}else{
		alert('입력이 잘못되었습니다.');
	}
}

let isCodeValid = false;
function checkSMSCode(code){
	if( code.length == 6 ){
		
		if(sms_code == code){
			alert('인증되었습니다.');
            code_box.style.display = "none";
            item_ip[2].setAttribute("readonly", "readonly");
            isCodeValid = true;
		}else{
			alert('인증번호가 다릅니다.');
			isCodeValid = false;
		}
		
	}else{
		alert('입력이 잘못되었습니다.');
		isCodeValid = false;
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

// errorMsg -  [0]:아이디, [1]:비밀번호, [2]:비밀번호 확인, [3]: 이메일
// successMsg - id
function messageService(indexNumber, msgText){
	
	//msg를 모두 clear하는 작업
	clearMsgNode(errorMsg[indexNumber]);
	
	let msgTextNode = document.createTextNode(msgText);

    errorMsg[indexNumber].appendChild(msgTextNode);
    errorMsg[indexNumber].style.display = 'block';
}

function passwordCheck(id, password){
    if(! (/^[a-z0-9#?!@$%^&*-]{8,12}$/).test(password)){
        let msg = '숫자, 영문자, 특수문자 조합으로 8~12자리를 사용해야 합니다.';
        return msg;
    }
    
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
	var checkSpecialChar = password.search(/[#?!@$ %^&*-]/g);
    
    // 빈값확인
    if(checkNumber < 0 || checkEnglish < 0 || checkSpecialChar < 0 ){
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

let user_email = "";
let isEmailValid = false;
function checkEmail() {
	user_email = item_ip[4].value + '@' + item_ip[5].value;
	
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(regEmail.test(user_email)){
		clearMsgNode(errorMsg[2]);
        isEmailValid = true;
	}else{
		let msg = "사용하실 수 없는 이메일 입니다.";
		messageService(2, msg);
        isEmailValid = false;
	}
}

function updateUserData(updateData){
	console.log(updateData);
	$.ajax({
        type: "patch",
        url: "/user/account/update/user",
        data: updateData,
        dataType: "text",
        success: function(data){
            if(data == "true"){
                alert('수정 완료했습니다.');
                location.reload();
            }else{
                alert('수정 실패했습니다.');
            }
        },
        error: function(){
            alert('비동기 처리 오류');
        }
    })
    return false;
}

function updatePassword(){
	$.ajax({
		type: "patch",
		url: "/auth/update/password",
		data: {
			"userid": user_info[0].value,
			"newPassword": item_ip[1].value
		},
		dataType: "text",
		success: function(data){
			let passwordRespObj = JSON.parse(data);
			console.log(passwordRespObj);
	
			if(passwordRespObj.code == 200){
				alert('비밀번호가 재설정 되었습니다.\n다시 로그인 해주세요.');
				location.href = "/logout";
			}else{
				alert(passwordRespObj.message);
				item_ip[0].value = "";
				item_ip[1].value = "";
				item_ip[0].focus();
			}
		}
	});
	return false;
}

let selected_email_val = "";

if(item_ip[0] != null){

	// 비밀번호 정규식
	item_ip[0].onkeyup = () => {
		let msg = passwordCheck(user_info[0].value, item_ip[0].value);
		if(msg == 'true'){
			clearMsgNode(errorMsg[0]);
		}else{
			messageService(0, msg);	
		}
	};
	
	// 비밀번호 확인
	item_ip[1].onkeyup = () => {
		if(item_ip[1].value == item_ip[0].value){
			clearMsgNode(errorMsg[1]);
	        isPasswordValid = true;
		}else{
			let msg = "비밀번호가 다릅니다.";
			messageService(1, msg);
	        isPasswordValid = false;
		}
	}
	
	// 휴대폰 확인
	item_ip[2].onkeyup = (e) => {
	    fn_press(e, item_ip[2].type);
	    fn_press_kor(item_ip[2]);
	}

	// 이메일 
	item_select.onchange = () => {
		selected_email_val = item_select.options[item_select.selectedIndex].value;
	
		if(selected_email_val == '1'){
			item_ip[5].value = '';
			email_site.removeAttribute("readonly");
		}else{
			item_ip[5].value = selected_email_val;
			item_ip[5].setAttribute("readonly", "readonly");
		}
		checkEmail();
	}
	
	// 휴대폰 인증번호 문자 보내
	sendSMS_btn.onclick = () => {
	    sendSMS(item_ip[2]);
	};
	
	// 정보 업데이트
	update_personal_btn[0].onclick = () => {
		if(isPasswordValid){
			updatePassword();				
		}
	}
	update_personal_btn[1].onclick = () => {
		// 휴대폰 코드 인증
		checkSMSCode(item_ip[3].value);
		
		if(isCodeValid){
			let data = {"phone" : item_ip[2].value}
			
			updateUserData(data);
		}else{
			alert('휴대폰 인증은 필수 입니다.');
		}
	}
	update_personal_btn[2].onclick = () => {
		if(isEmailValid){
			let data = {"email" : user_email}
			
			updateUserData(data);				
		}else{
			alert('이메일 입력은 필수입니다.');
		}
	}
}

if(update_birth_btn != null){
	update_birth_btn.onclick = () => {
		let data = {"birthday" : selected_year + selected_month + selected_day}
		updateUserData(data);
	}
}
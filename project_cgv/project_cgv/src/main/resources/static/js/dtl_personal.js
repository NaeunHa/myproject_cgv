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
const submit_btn = document.querySelectorAll('.submit_btn');
// [0]: 휴대폰 인증, [1]: 휴대폰 인증코드, [2]: 정보 update
const birth_select = document.querySelectorAll('.birth_select');
//[0]: year, [1]: month, [2]: day
const item_select = document.querySelector('.item_select'); // 이메일 확장자 선택
//[0]: 비밀번호, [1]: 휴대폰, [2] 이메일
const submit_btn = document.querySelectorAll('.submit_btn'); // 수정 버

const set_birth_btn = document.querySelector('.set_birth_btn');
const birth_empty_box = document.querySelector('.birth_empty_box');
const set_bith_hidden_box = document.querySelector('.set_bith_hidden_box');

const code_box = document.querySelector('.code_box'); // 휴대전화 인증코드
const user_phone = document.querySelector('.user_phone');
const principal_birth = document.querySelector('.principal_birth');

let middleNum = user_info[1].value.substring(3, 7);
let endNum = user_info[1].value.substring(7, 11);
user_phone.textContent = `010 - ${middleNum} - ${endNum}`;

if(principal_birth != null){
    const user_birth = document.querySelector('.user_birth');
    let year = principal_birth.value.substring(0, 4);
    let month = principal_birth.value.substring(4, 6);
    let day = principal_birth.value.substring(6, 8);
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
            selected_year = item_select[0].options[item_select[0].selectedIndex].value;
        }
        
        // month
        select_month.onchange = () => {
            selected_month = item_select[1].options[item_select[1].selectedIndex].value;
            if(selected_month < 10){
                selected_month = "0" + selected_month;
            }
        
            setDateOption(select_day, selected_month, 0);
        }
    }
}

// 생년월일
let selected_year = "";
let selected_month = "";
let selected_day = "";

let changePasswordFlag = false;
let chanePhoneNumFlag = false;
let changeEmailFlag = false;
let setBirthdayFlag = false;

for(let i = 0; i < change_btn.length; i++){
    change_btn[i].onclick = () => {
        if(i == 0){
            // 비밀번호 변경 -> 입력창  + 정규식 + 확인 column open
            hidden_box[i].classList.toggle('hidden_box');
            hidden_box[i+1].classList.toggle('hidden_box');
        }else if(i == 1){
            // 전화번호 변경 -> 입력창 +인증버튼 open
            now_info[0].classList.toggle('hidden_box');
            hidden_box[i+1].classList.toggle('hidden_box');

        }else if(i == 2){
            // 이메일 변경 -> 입력창 open + 정규식 errorMsg open
            now_info[1].classList.toggle('hidden_box');
            hidden_box[i+1].classList.toggle('hidden_box');
        }
    }
}

if(set_birth_btn != null){
    set_birth_btn.onclick = () => {
        birth_empty_box.classList.toggle('set_bith_hidden_box');
        set_bith_hidden_box.classList.toggle('set_bith_hidden_box');
    
        if(set_bith_hidden_box.classList.contains('set_bith_hidden_box')){
            setBirthdayFlag = false;
        }else{
            setBirthdayFlag = true;
        }
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

code_box.style.display = "none";
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
					submit_btn[0].style.display = 'none';
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
	
	}else{
		alert('입력이 잘못되었습니다.');
	}
}

function checkSMSCode(code){
	if( code.length == 6 ){
		
		if(sms_code == code){
			alert('인증되었습니다.');
            code_box.style.display = "none";
            item_ip[2].setAttribute("readonly", "readonly");
            chanePhoneNumFlag = true;
		}else{
			alert('인증번호가 다릅니다.');
		}
		
	}else{
		alert('입력이 잘못되었습니다.');
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

function checkEmail() {
	let user_email = item_ip[4].value + '@' + item_ip[5].value;
	
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(regEmail.test(user_email)){
		clearMsgNode(errorMsg[2]);
        changeEmailFlag = true;
	}else{
		let msg = "사용하실 수 없는 이메일 입니다.";
		messageService(2, msg);
        changeEmailFlag = false;
	}
}

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
        changePasswordFlag = true;
	}else{
		let msg = "비밀번호가 다릅니다.";
		messageService(1, msg);
        changePasswordFlag = false;
	}
}

// 휴대폰 확인
item_ip[2].onkeyup = (e) => {
    fn_press(e, item_ip[2].type);
    fn_press_kor(item_ip[2]);
}

let selected_email_val = "";

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

// 이메일 확인
item_ip[4].onkeyup = () => {
	checkEmail();
}

// 휴대폰 인증번호 문자 보내기
submit_btn[0].onclick = () => {
    sendSMS(item_ip[2]);
};

// 휴대폰 인증번호 확인
submit_btn[1].onclick = () => {
    checkSMSCode(item_ip[3].value);
};

// 정보 업데이트
submit_btn[2].onclick = () => {
    updateUserInfoData = {
        "password": null,
        "birthday": null,
        "phone": null,
        "email": null
    }
    
    if(changePasswordFlag != false){
        updateUserInfoData.password = item_ip[1].value;
    }
    if(setBirthdayFlag != false){
        updateUserInfoData.birthday = selected_year + selected_month + selected_day;
    }
    if(chanePhoneNumFlag != false){
        updateUserInfoData.phone = item_ip[2].value;
    }
    if(changeEmailFlag != false){
        updateUserInfoData.email = item_ip[4].value + "@" + item_ip[5].value;
    }

    $.ajax({
        type: "patch",
        url: "/user/account/update-peronal-info",
        data: updateUserInfoData,
        dataType: "text",
        success: function(data){
            if(data == "true"){
                alert('회원정보 수정 완료');
                location.reload();
            }else{
                alert('회원정보 수정 실패');
            }
        },
        error: function(){
            alert('비동기 처리 오류');
        }
    })
}
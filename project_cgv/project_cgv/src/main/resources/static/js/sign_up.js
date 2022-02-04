const item_select = document.querySelectorAll('.item_select');
// [0]: year, [1]: month, [2]: day, [3]: email_site
const item_ip =  document.querySelectorAll('.item_ip'); 
// [0]:이름, [1]:아이디, [2]:비밀번호, [3]:비밀번호 확인, [4]: 폰번호, [5]:이메일 id, [6]:이메일 사이트
const submit_btn = document.querySelectorAll('.submit_btn');
// [0]: 아이디 중복 확인, [1]: 회원가입
const errorMsg = document.querySelectorAll('.errorMsg');
const successMsg = document.querySelector('.successMsg');

var signUpFlag = new Array();
for(let i = 0; i < 6; i++){
	signUpFlag.push(false);
}
// [0]:이름, [1]:아이디, [2]:비밀번호 확인,
// [3]:생일-년도, [4]:생일-월, [5]:생일-일, [6]:이메일id

let selected_email_val = "";

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

function clearMsgNode(msg){
	while(msg.hasChildNodes()){
		msg.removeChild(msg.firstChild);
	}
	msg.style.display = 'none';
}

// errorMsg -  [0]:아이디, [1]:비밀번호, [2]:비밀번호 확인, [3]: 이메일
// successMsg - id
function messageService(indexNumber, msgText, msgFlag){
//	const errorMsg = document.querySelectorAll('.errorMsg');
//	const successMsg = document.querySelector('.successMsg');
	
	//msg를 모두 clear하는 작업
	clearMsgNode(errorMsg[indexNumber]);
	clearMsgNode(successMsg);
	
	let msgTextNode = document.createTextNode(msgText);
		
	if(msgFlag == 0){ //0: errorMsg 로 처리
		errorMsg[indexNumber].appendChild(msgTextNode);
		errorMsg[indexNumber].style.display = 'block';
	}else{ // 1: succesMsg 로 처리
		successMsg.appendChild(msgTextNode);
		successMsg.style.display = 'block';
	}
}

function checkId(id){

	$.ajax({
		type: "post",
		url: "/auth/sign-up/confirm-id/" + id.value,
		success: function(data){
			console.log(data);
			if(data == 0){
				submit_btn[0].style.display = "none";
				let msg = "사용가능한 아이디 입니다."
				messageService(0, msg, 1);
				item_ip[1].setAttribute("readonly", "readonly");
				signUpFlag[1] = true;
			}else{
				let msg = "사용할 수 없는 아이디 입니다."
				messageService(0, msg, 0);
				item_ip[1].focus();
				signUpFlag[1] = false;
			}
		},
		error: function(){
			alert('비동기처리 오류');
		}
	});
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
	let user_email = item_ip[5].value + '@' + item_ip[6].value;
	
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(regEmail.test(user_email)){
		signUpFlag[6] = true;
		clearMsgNode(errorMsg[3]);
	}else{
		let msg = "사용하실 수 없는 이메일 입니다.";
		messageService(3, msg, 0);
		signUpFlag[6] = false;
	}
}

// 년, 월, 일 option 태그 추가
insertDateOptions(item_select[0], item_select[1], item_select[2]);
	
// email option 클릭시 selected 처리
item_select[3].onchange = () => {
	selected_email_val = item_select[3].options[item_select[3].selectedIndex].value;

	if(selected_email_val == '1'){
		item_ip[6].value = '';
		email_site.removeAttribute("readonly");
	}else{
		item_ip[6].value = selected_email_val;
		item_ip[6].setAttribute("readonly", "readonly");
	}
	checkEmail();
}

// 이름
item_ip[0].onkeyup = () => {
	signUpFlag[0] = true;
}

// 아이디 중복확인
submit_btn[0].onclick = () => {
	if(item_ip[1].value.length > 4){
		checkId(item_ip[1]);
	}else{
		alert('아이디가 너무 짧습니다.');
	}
};

// 비밀번호 정규식
item_ip[2].onkeyup = () => {
	let msg = passwordCheck(item_ip[1].value, item_ip[2].value);
	if(msg == 'true'){
		clearMsgNode(errorMsg[1]);
	}else{
		messageService(1, msg, 0);	
	}
};

// 비밀번호 확인
item_ip[3].onkeyup = () => {		
	if(item_ip[3].value == item_ip[2].value){
		signUpFlag[2] = true;
		clearMsgNode(errorMsg[2]);
	}else{
		let msg = "비밀번호가 다릅니다.";
		messageService(2, msg, 0);
		signUpFlag[2] = false;
	}
}

// 생년월일
let selected_year = "";
let selected_month = "";
let selected_day = "";

// year
item_select[0].onchange = () => {
	selected_year = item_select[0].options[item_select[0].selectedIndex].value;
	signUpFlag[3] = true;
}

// month
item_select[1].onchange = () => {
	selected_month = item_select[1].options[item_select[1].selectedIndex].value;
	if(selected_month < 10){
		selected_month = "0" + selected_month;
	}

	setDateOption(item_ip[2], selected_month, 0);
	signUpFlag[4] = true;
}

// day
item_select[2].onchange = () => {
	selected_day = item_select[2].options[item_select[2].selectedIndex].value;
	if(selected_day < 10){
		selected_day = "0" + selected_day;
	}
	signUpFlag[5] = true;
}

// 이메일 정규식	
item_ip[5].onkeyup = () => {
	checkEmail();
}

function isEmpty(str){
	if(typeof str == "undefined" || str == null || str == ''){
		return '사용가능';
	}else {
		return str;
	}
}

function signupValidMsg(data){
	let signupDataObj = JSON.parse(data);
	if(signupDataObj.code == 400){
		alert(
			'유효성 검사 오류.\n' + 
			'오류코드: ' + signupDataObj.code + '\n' +
			'오류 내용\n' +
			'username: ' + isEmpty(signupDataObj.username) + '\n' +
			'userid: ' + isEmpty(signupDataObj.userid) + '\n' +
			'password: ' + isEmpty(signupDataObj.password)  + '\n' +
			'phone: ' + isEmpty(signupDataObj.phone) + '\n' +
			'birthday: ' + isEmpty(signupDataObj.birthday) + '\n' +
			'email: ' + isEmpty(signupDataObj.email)
		);
	}else if(signupDataObj.code == 200){
		alert(signupDataObj.msg);
		location.replace('/auth/sign-in');
	}
}

function signup(){
	let signUpData = {
		username : item_ip[0].value,
		userid : item_ip[1].value,
		password : item_ip[3].value,
		phone : item_ip[4].value,
		birthday : selected_year + selected_month + selected_day,
		email : item_ip[5].value + '@' + item_ip[6].value
	}

	$.ajax({
		type: "post",
		url: "/auth/sign-up",
		data : signUpData,
		dataType: "text",
		success : function(data){
			signupValidMsg(data);
		},
		error: function(){
			alert('비동기처리 오류');
		}
	});
}

// 회원가입
submit_btn[1].onclick = () => {
	
	// 빈값 방지
	let count = 0;
	for(let i = 0; i < signUpFlag.size; i++){
		if( signUpFlag[i] == false ){
			count ++;
		}
	}
	
	if(count == 0){
		signup();
	}else{
		alert('형식이 다 채워지지 않았습니다.');
	}
}

// 새로고침 방지
document.onkeydown = (e) => {
	noKeyPressF5(e);
}

// 뒤로가기 방지

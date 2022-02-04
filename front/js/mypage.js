/**
 *  my page
 */
const update_btn = document.querySelector('.update_btn');
const modify_btn = document.querySelector('.modify_btn');
const modal = document.querySelectorAll('.modal');
const close_btn = document.querySelectorAll('.close_btn');
const profile_img = document.querySelector('.profile_img');
const userid = document.querySelector('.userid');
const nickname = document.querySelector('.nickname');
const check_btn = document.querySelector('.check_btn');
const cancle_btn = document.querySelector('.cancle_btn');
const user_img = document.querySelector('.user_img');
const file_btn = document.querySelector('.file_btn');
const form = document.querySelector('form');

let checknicknameFlag = false;

function popupModal(index){
    if(modal[index].classList.contains('show')){
        modal[index].classList.remove('show');
        modal[index].style.opacity = 0;
        modal[index].style.zIndex = -1;
    }else{
        modal[index].classList.add('show');
        modal[index].style.opacity = 1;
        modal[index].style.zIndex = 1000;
    }
}

function closeModal(index){
    modal[index].classList.remove('show');
    location.reload();
}

update_btn.onclick = () => {
    popupModal(0);
}

if(modify_btn != null){
    modify_btn.onclick = () => {
        popupModal(1);
    }
}

for(let i = 0; i < close_btn.length; i++){
    close_btn[i].onclick = () => {
        closeModal(i);
    }
}

cancle_btn.onclick = () => {
    modal.classList.remove('show');
    location.reload();
}

let fileChangeFlag = false;

function lodaImg(){
    let file = file_btn.files[0];
    if(file){
        let reader = new FileReader();
        reader.onload = (e) => {
            user_img.src = e.target.result;
            fileChangeFlag = true;
        }
        reader.readAsDataURL(file);
    }
}

function checkNickName () {
    if(nickname.value.length > 1){
        $.ajax({
            type: "post",
            url: '/user/my-cgv/check-nickname/' + nickname.value,
            dataType: "text",
            success: function(data){
                if(data == 0){
                    if(confirm('사용 가능한 닉네임입니다.\n사용하시겠습니까?') == true){
                        nickname.setAttribute('readonly', 'readonly');
                        nickname.style.backgroundColor = "#f6f6f6";
                        check_btn.style.display = "none";
                        checknicknameFlag = true;
                    }else{
                        nickname.focus();
                    }
                }else{
                    alert('이미 존재하는 닉네임 입니다.');
                    nickname.focus();
                }
            },
            error: function(){
                alert('비동기처리 오류');
            }
        });
    }else{
        alert('최소 2자는 입력이 되어야 합니다.');
    }
}

function changeAll() {
    let formData = new FormData(form);

    $.ajax({
        type: 'patch',
        url: '/user/my-cgv/update-info',
        data: formData,
        dataType: "text",
        enctype: 'multipart/form-data',
        processData: false,
        contentType: false,
        success: function(data){
            if(data == 'true'){
                alert('changeAll 회원정보 수정 성공');
                location.reload();
            }else{
                alert('changeAll 회원정보 수정 실패');
            }
        },
        error: function(){
            alert('비동기 처리 오류');
        }
    })
}

function changeNickName (){
    $.ajax({
        type: 'patch',
        url: '/user/my-cgv/update-info',
        data:{"nickname" : nickname.value},
        dataType:"text",
        success: function(data){
            if(data == 'true'){
                alert('changeNickName 회원정보 수정 성공');
                location.reload();
            }else{
                alert('changeNickName 회원정보 수정 실패');
            }
        },
        error: function(){
            alert('비동기 처리 오류');
        }
    })
}

function update_info(){
    if(checknicknameFlag == 'false'){
        alert('닉네임 중복확인은 필수입니다.');
    }else{
        if(fileChangeFlag == true){
            changeAll();
        }else{
            changeNickName();
        }
    }
}


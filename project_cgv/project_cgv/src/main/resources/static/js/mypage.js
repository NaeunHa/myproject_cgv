/**
 *  my page
 */

const modify_btn = document.querySelector('.modify_btn');
const modal = document.querySelector('#modal');
const close_btn = document.querySelector('.close_btn');
const profile_img = document.querySelector('.profile_img');
const userid = document.querySelector('.userid');
const nickname = document.querySelector('.nickname');
const check_btn = document.querySelector('.check_btn');
const cancle_btn = document.querySelector('.cancle_btn');
const user_img = document.querySelector('.user_img');
const file_btn = document.querySelector('.file_btn');
const form = document.querySelector('form');

let checknicknameFlag = false;

modify_btn.onclick = () => {
    if(modal.classList.contains('show')){
        modal.classList.remove('show');
        modal.style.opacity = 0;
        modal.style.zIndex = -1;
    }else{
        modal.classList.add('show');
        modal.style.opacity = 1;
        modal.style.zIndex = 1000;
    }
}

close_btn.onclick = () => {
    modal.classList.remove('show');
    location.reload();
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


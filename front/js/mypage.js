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
                    if(confirm('?????? ????????? ??????????????????.\n?????????????????????????') == true){
                        nickname.setAttribute('readonly', 'readonly');
                        nickname.style.backgroundColor = "#f6f6f6";
                        check_btn.style.display = "none";
                        checknicknameFlag = true;
                    }else{
                        nickname.focus();
                    }
                }else{
                    alert('?????? ???????????? ????????? ?????????.');
                    nickname.focus();
                }
            },
            error: function(){
                alert('??????????????? ??????');
            }
        });
    }else{
        alert('?????? 2?????? ????????? ????????? ?????????.');
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
                alert('changeAll ???????????? ?????? ??????');
                location.reload();
            }else{
                alert('changeAll ???????????? ?????? ??????');
            }
        },
        error: function(){
            alert('????????? ?????? ??????');
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
                alert('changeNickName ???????????? ?????? ??????');
                location.reload();
            }else{
                alert('changeNickName ???????????? ?????? ??????');
            }
        },
        error: function(){
            alert('????????? ?????? ??????');
        }
    })
}

function update_info(){
    if(checknicknameFlag == 'false'){
        alert('????????? ??????????????? ???????????????.');
    }else{
        if(fileChangeFlag == true){
            changeAll();
        }else{
            changeNickName();
        }
    }
}


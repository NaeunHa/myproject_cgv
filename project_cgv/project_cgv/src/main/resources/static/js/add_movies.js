/**
 *  관리자 - 영화 추가 페이지
 */

const ip_item = document.querySelectorAll('.ip_item');
// [0]: 영화명(국문), [1]: 영화명 (영문), [2]; 장르,        [3]: 감독
// [4]: 배우,            [5]: 상영시간,       [6]: 영화설명
const date_item = document.querySelectorAll('.date_item');
// [0]: 개봉일, [1]; 상영종료일
const radio_age = document.querySelectorAll('.radio_age');
// [0]: All, [1]: 12, [2]: 15, [3]: 19
const img_item = document.querySelector('.img_item'); // 포스터
const poster_img = document.querySelector('.poster_img'); // img
const media_item = document.querySelector('.media_item'); // 트레일러
const limitedAge = document.querySelector('.watchGradeNm'); // hidden - limited_age
const form = document.querySelector('form');

window.onload = () => {
    if(limitedAge != null){
        setLimitedAge();
    }
}

function setLimitedAge(){
    let ageVal = limitedAge.value.substring(0,2);
    console.log(ageVal);
    for(let i=0; radio_age.length; i++){  	      
        if(radio_age[i].value == ageVal){
            document.getElementById(`${ageVal}`).checked = "true";
           // radio_age[i].checked = "true";
//        }else{
//            radio_age[i].checked = "false";
        }
    }
}

let checkedAge = "";
function getLimitedAge(){
    for(let i = 0; i < radio_age.length; i++){
        checkedAge = radio_age[i].checked;
    }
}

function loadImg(){
    let file = img_item.files[0];
    if(file){
        let reader = new FileReader();
        reader.onload = (e) => {
            poster_img.src = e.target.result;
        }
        reader.readAsDataURL(file);
    }
}

function addMovieSubmit(){
    let formData = new FormData(form);

    if(formData.values != null){

        // formData.append("movie_limited_age", checkedAge.value);

        $.ajax({
            type: "post",
            url: "/admin/add-movie",
            data: formData,
            dataType: "text",
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            success: function(data){
                if(data == "true"){
                    alert("등록 성공");
                    location.href = "/admin/cgv-movie-list";
                }else{
                    alert('등록 실패');
                }
            },
            error: function(){
                alert("비동기 처리 오류");
            }
        })
    }
}

function updateAllSubmit(){
    // multipart로 form 데이터 보내기
    
}

function updateTextSubmit(){
    // formData가 아닌 직접 Data 만들어서!
}

function updateMovieSubmit(){
    // file이 바뀌었는지 확인 !
}
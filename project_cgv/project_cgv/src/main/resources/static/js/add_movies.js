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
const media_item = document.querySelectorAll('.media_item');

let checkedAge = "";
function getLimitedAge(){
    for(let i = 0; i < radio_age.length; i++){
        checkedAge = radio_age[i].checked;
    }
}

function addMovieSubmit(){
    let formData = new FormData(form);

    if(formData.values != null){

        formData.append("movie_limited_age", checkedAge.value);

        $.ajax({
            type: "post",
            url: "/admin/add-movie",
            data: formData,
            dataType: "text",
            enctype: "multipart/form-data",
            processData: false,
            contentType: false,
            success: function(data){
                alert("등록 성공");
                location.href = "/admin/cgv-movie-list";
            },
            error: function(){
                alert("비동기 처리 오류");
            }
        })
    }
}
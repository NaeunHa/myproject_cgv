/**
 *  비밀번호 확인
 */

function checkPassword (){
	const item_ip = document.querySelector('.item_ip');
    if(item_ip.value.length > 3){
        $.ajax({
            type: "post",
            url: "/user/my-cgv/check-password",
            data: {"password" : item_ip.value},
            dataType: "text",
            success: function(data){
            	console.log(data);
                if(data == 'true'){
                    alert('인증되었습니다.');
                    location.href = '/user/my-cgv/personal';
                }else{
                	alert('비밀번호가 다릅니다');
                }
            },
            error: function(){
                alert('비동기 처리 오류');
            }
        });
    }else{
    	alert('입력값이 짧습니다.');
    }
}

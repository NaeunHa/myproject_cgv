/**
 *  비밀번호 확인
 */
 
function checkPassword (){
	const item_ip = document.querySelector('.item_ip');
    if(item_ip.value.length > 3){
        $.ajax({
            type: "post",
            url: "/user/account/check/password",
            data: {"password" : item_ip.value},
            dataType: "text",
            success: function(data){
            	console.log(data);
                if(data == 'true'){
					let link = document.location.href;
					if(link.indexOf("personal") != -1){
						moveToPersonal();
					}else{
						moveToWithdrawal();
					}
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

function moveToPersonal(){
	location.href = '/user/account/personal';
}


function moveToWithdrawal(){
	location.href = '/user/account/withdrawal';
}


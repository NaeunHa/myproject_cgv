/**
 *  회원 탈퇴 
 */
 
 
 function checkReal(){
	if(confirm("정말 탈퇴하시겠습니까?")){
		withdrawalUser();
	}
}
 
 function withdrawalUser(){
	$.ajax({
	    type: "delete",
	    url: "/user/account/withdrawal",
	    success: function(data){
	    	console.log(data);
	        if(data == 1){
				alert('회원탈퇴에 성공했습니다.');
				location.href="/logout";
	        }else{
	        	alert('회원 탈퇴에 실패했습니다.');
	        }
	    },
	    error: function(){
	        alert('비동기 처리 오류');
	    }
	});
}
 
 
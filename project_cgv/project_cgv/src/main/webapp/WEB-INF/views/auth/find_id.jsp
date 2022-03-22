<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 아이디찾기</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/find.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
  	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="find">
        <div class="contents">
            <div class="find_container">
                <div class="tab_wrap">
                    <a href="/find-id" class="tab">아이디 찾기</a>
                    <a href="/find-password" class="tab off">비밀번호 찾기</a>
                </div>
                <div class="find_wrap">
                    <div class="description">
                        <h3>아이디 찾기</h3>
                        <span>아이디가 기억나지 않으세요? 원하시는 방법을 선택하여 아이디를 확인하실 수 있습니다.</span><br>
                        <span>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</span>
                    </div>
                    <div class="find_box">
                        <div class="box_title"><h3>아이디 찾기</h3></div>
                        <div class="box_content">
                            <h3>휴대폰 인증을 통해 본인인증 후 아이디 찾기를 할 수 있습니다.</h3>
                            <div class="inner_box">
                                <h3>휴대폰으로 찾기</h3>
                          		<div class="boxes_wrap">
                          			<div>
                          				<div class="phone_box box"> 
		                                    <input type="text" class="ip_phone" maxlength="11">
		                                    <button type="button" class="send_btn">인증하기</button>
		                                </div>
		                                <div class="code_box box">
		                                	<input type="text" class="ip_code">
		                                	<button type="button" class="check_btn">인증하기</button>
		                                </div>
                          			</div>
                          		</div>
                            </div>
                        </div>
                        <div class="box_content">
                            <h3>로그인을 원하시면 로그인 창으로 이동해 주세요.</h3>
                            <div class="inner_box">
                                <h4>고객님의 아이디</h4>
                                <div class="id_box">
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="contact_wrap">
                    <dl>
                        <dt><h3>이용문의</h3></dt>
                        <dd>
                            <span>CGV 고객센터 : 1544-1122</span>
                            <span>문의 가능 시간 : 월~금 09:00~18:00 (이 외 시간은 자동응답 안내 가능)</span>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
  	<script type="text/javascript" src="/js/find_id.js"></script>
</body>
</html>
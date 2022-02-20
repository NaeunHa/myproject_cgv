<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 비밀번호찾기</title>
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
                    <a href="/find-id" class="tab off">아이디 찾기</a>
                    <a href="/find-password" class="tab">비밀번호 찾기</a>
                </div>
                <div class="find_wrap">
                    <div class="description">
                        <h3>비밀번호 찾기</h3>
                        <span>비밀번호가 기억나지 않으세요? 원하시는 방법을 선택하여 비밀번호를 재설정하실 수 있습니다.</span><br>
                        <span>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</span>
                    </div>
                    <div class="find_box">
                        <div class="box_title"><h3>비밀번호 재설정</h3></div>
                        <div class="box_content">
                            <h3>비밀번호를 재설정할 사용자의 아이디와 휴대폰을 입력해주세요.</h3>
                            <div class="inner_box">
	                            <dl>
	                                <dt>아이디</dt>
	                                <dd><input type="text" class="id_ip"></dd>
	                            </dl>
	                            <dl>
	                            	<dt>휴대폰</dt>
	                            	<dd>
	                            		<input type="text" class="ip_phone" maxlength="11">
	                                    <button type="button" class="send_btn">인증</button>
	                            	</dd>
	                            </dl>
	                            <dl class="code_box">
	                            	<dt>인증번호</dt>
	                            	<dd>
	                            		<div>
	                            		
	                            		</div>
	                            		<input type="text" class="ip_code" maxlength="6">
	                                	<button type="button" class="check_btn">확인</button>
	                            	</dd>
	                            </dl>
                            </div>
                        </div>
                        <div class="box_content">
                            <h3>비밀번호를 재설정합니다.</h3>
                            <div class="inner_box">
	                            <dl>
	                                <dt>비밀번호</dt>
	                                <dd>
	                                    <input type="password" class="pw_ip">
	                                </dd>
	                                <dd class="errorMsg"></dd>
	                            </dl>
	                            <dl>
	                                <dt>비밀번호 확인</dt>
	                                <dd>
	                                	<input type="password" class="pw_ip">
		                                <button type="button" class="set_btn">설정</button>
	                                </dd>
	                                <dd class="errorMsg"></dd>
	                            </dl>
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
    <script type="text/javascript" src="/js/find_pw.js"></script>
</body>
</html>
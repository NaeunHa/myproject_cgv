<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 회원가입</title>
    <link rel="stylesheet" href="/css/sign_up.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
    <!-- 약관동의 -->
    <!-- 정보 입력 -->
    <section id="sign_up">
        <div class="contents">
        	<div class="img_container">
                <img src="/images/img_join_hd.jpg" alt="">
            </div> 
            <div  class="container">
                <div class="tab">회원가입</div>
                <div class="wrap_form">
                    <dl>
                        <dt>이름</dt>
                        <dd><input type="text" class="item_ip"></dd>
                    </dl>
                    <dl>
                        <dt>아이디</dt>
                        <dd>
                            <div>
                                <input type="text" class="item_ip" placeholder="아이디를 입력해주세요.">
                                <button type="button" class="submit_btn">중복확인</button>
                            </div>
                            <div class="successMsg"></div>
                            <div class="errorMsg"></div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd>
                            <input type="password" class="item_ip" placeholder="비밀번호를 입력해주세요.">
                            <span>영문자, 숫자, 특수문자 조합하여 8~12자리, 아이디와 4자리 이상 동일, 반복 문자/숫자 불가</span>
                            <span>사용가능 특수문자 : #?!@$%^&*-</span>
                            <div class="errorMsg"></div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>비밀번호 확인</dt>
                        <dd>
                            <input type="password" class="item_ip" placeholder="비밀번호를 재입력해주세요.">
                            <div class="errorMsg"></div>
                        </dd>
                    </dl>
                    <dl>
                        <dt>생년월일</dt>
                        <dd>
                            <div>
                                <select class="item_select"></select>년 
                                <select class="item_select"></select>월
                                <select class="item_select"></select>일
                            </div>
                            <span>설정하신 생일을 기준으로 15일 전 생일쿠폰이 발행됩니다.</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>휴대전화</dt>
                        <dd>
                            <div>
                                <!-- 인증된 휴대폰번호 넣기! -->
                                <input type="text" class="item_ip param" value="${phone }" readonly="readonly">
                            </div>
                            <span>주문 및 배송, 쿠폰, 이벤트 정보 등을 제공받으실 수 있습니다.</span>
                        </dd>
                    </dl>
                    <dl>
                        <dt>이메일</dt>
                        <dd>
                            <div>
                                <input type="text" class="item_ip email"> @ <input type="text" class="item_ip email">
                                <select class="item_select">
                                    <option  value="1" selected="selected">직접입력</option>
                                    <option  value="naver.com">네이버</option>
                                    <option  value="gmail.com">구글</option>
                                    <option value="hanmail.net">다음</option>
                                    <option value="nate.com">네이트</option>
                                </select>
                            </div>
                            <span>이메일 주소 입력 시 사용 가능 특수 문자 : -._</span>
                           <div class="errorMsg"></div>
                        </dd>
                    </dl>
	                <button type="button" class="submit_btn real">가입하기</button>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>  
    <script type="text/javascript" src="/js/sign_up.js"></script>
</body>
</html>
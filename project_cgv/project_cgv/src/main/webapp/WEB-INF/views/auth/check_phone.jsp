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
            <div class="container">
                <div class="tab">회원가입</div>
                <div class="wrap_form" >
                    <div class="box_content">
                        <h3>휴대폰 인증을 통해 본인인증 후 회원가입을 할 수 있습니다.</h3>
                        <div class="inner_box">
                            <h4>휴대폰으로 인증하기</h4>
                            <div>
                             	<input type="tel" class="item_ip phone" maxlength="11">
                                <button type="button" class="submit_btn">인증하기</button>
                            </div>
                            <div class="sa_code_box">
                                <input type="text"class="item_ip phone" maxlength="6">
                                <button type="button" class="submit_btn">인증하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>  
    <script type="text/javascript" src="/js/check_phone.js"></script>
</body>
</html>
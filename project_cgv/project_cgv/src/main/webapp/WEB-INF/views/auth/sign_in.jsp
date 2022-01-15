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
    <title>CGV | 로그인</title>
    <link rel="stylesheet" href="/css/sign_in.css">
</head>
<body>
   	<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="sign_in">
        <div class="contents">
            <div class="si_container">
                <div class="tab">로그인</div>
                <div class="si_wrap">
                    <p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
                    <form action="">
                        <input type="text" class="ip_id ip_box">
                        <input type="password" class="ip_pw ip_box">
                        <button type="button" class="si_btn">로그인</button>
                        <div class="save_id">
                            <input type="checkbox" id="setId">
                            <label for="save_id">아이디 저장</label>
                        </div>
                        <div class="find_info">
                            <a href="#" class="find_id">아이디 찾기</a>
                            <a href="#" class="find_pw">비밀번호 찾기</a>
                        </div>
                    </form>
                    <button type="button" class="oauth2_naver"><img src="/images/btn_loginNaver.jpg" alt=""></button>
                </div>
            </div>
            <div class="random_img">
                <!-- TODO : 랜덤 포스터 -->
                <img src="/images/poster2.jpg" alt="">
            </div>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/js/header.js"></script>
</body>
</html>
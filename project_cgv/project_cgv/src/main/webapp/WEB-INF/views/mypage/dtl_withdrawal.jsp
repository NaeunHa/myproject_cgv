<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CGV | 회원 탈퇴</title>
    <link rel="stylesheet" href="/css/mypage_nav.css">
    <link rel="stylesheet" href="/css/mypage_dtl.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
    <section id="mypage">
        <div class="contents">
        
        	<jsp:include page="../include/mypage_header.jsp"></jsp:include>
        	
        	<article class="mypage_container">
                <!-- 오른쪽 메뉴 -->
                <div class="mypage_nav">
                    <div class="mypage_nav_box">
                        <div class="nav_wrap">
                            <dl>
                                <dt><a href="/user/my-cgv">나의 영화 기록</a></dt>
                                <dd><a href="/user/my-cgv/wish">기대되는 영화</a></dd>
                                <dd><a href="/user/my-cgv/watched">내가 본 영화</a></dd>
                                <dd><a href="/user/my-cgv/review">내가 쓴 평점</a></dd>
                            </dl>
                            <dl>
                                <dt><a href="#">CGV 포인트</a></dt>
                                <dd><a href="#">적립/사용내역</a></dd>
                            </dl>
                            <dl>
                                <dt><a href="#">나의 예매 내역</a></dt>
                                <dd><a href="#">예매내역</a></dd>
                            </dl>
                            <dl>
                                <dt><a href="#">기프트샵</a></dt>
                                <dd><a href="#">결제내역</a></dd>
                            </dl>
                            <dl class="now">
                                <dt><a href="/user/account/redirect/personal">회원정보</a></dt>
		           				<dd><a href="/user/account/redirect/personal">개인정보 변경</a></dd>
		            			<dd class="now"><a href="/user/account/withdrawal">회원탈퇴</a></dd>
                            </dl>
                            <dl>
                                <dt><a href="#">나의 문의내역</a></dt>
                                <dd><a href="#">1:1 문의</a></dd>
                            </dl>
                        </div>
                    </div>
                </div>
	
                <!-- 오른쪽 세부 -->
                <div class="mypage_content">
                    <h1 class="detail_title">회원 탈퇴</h1>
                    <div id="detail_box3">
                        <div class="req_box">
                            그동안 CGV 서비스를 이용해주셔서 감사합니다.<br>
                            탈퇴를 원하시면 아래 버튼을 클릭해 주세요.
                        </div>
                        <div class="btn_wrap">
                            <button class="submit_btn" onclick="checkReal()">탈퇴하기</button>
                        </div>
                    </div>
                </div>
            </article>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/js/dtl_withdrawal.js"></script>
</body>
</html>
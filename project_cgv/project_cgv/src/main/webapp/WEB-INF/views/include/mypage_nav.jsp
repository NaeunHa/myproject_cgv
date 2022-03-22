<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<head>	
   	<link rel="stylesheet" href="/css/mypage.css">
   	<link rel="stylesheet" href="/css/modal.css">
</head>

<body>
	<div class="mypage_nav">
		<div class="mypage_nav_box">
			<div class="nav_wrap">
		        <dl class="now">
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
		        <dl>
		            <dt><a href="/user/account/redirect/personal">회원정보</a></dt>
		            <dd><a href="/user/account/redirect/personal">개인정보 변경</a></dd>
		            <dd><a href="/user/account/redirect/withdrawal">회원탈퇴</a></dd>
		        </dl>
		        <dl>
		            <dt><a href="#">나의 문의내역</a></dt>
		            <dd><a href="#">1:1 문의</a></dd>
		        </dl>
		    </div>
		</div>
	</div>
	<script type="text/javascript" defer="defer" src="/js/mypage_nav.js"></script>
</body>
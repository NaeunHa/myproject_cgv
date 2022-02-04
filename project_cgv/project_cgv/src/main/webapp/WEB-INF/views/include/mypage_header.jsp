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
	<div class="info_wrap">       
	    <div class="my_info info_box">
	        <div class="user_profile"><img class="profile_img" src="/image/${principal.user.profile_img }"></div>
	        <h1>${(empty principal.user.nickname) ? (principal.user.username) : (principal.user.nickname)}님</h1>
	        <span>${principal.user.userid }</span>
	        <button type="button" class="update_btn"></button>
	    </div>
	    <div class="sub_info_box info_box">
	        <div class="sub_info">
	            <div>
	                <h2>MEMBERSHIP</h2>
	                <span>나의 멤버쉽 등급</span>
	            </div>
	            <div><strong>${principal.user.membership_level }</strong></div>
	            
	        </div>
	        <div class="sub_info">
	            <div>
	                <h2>CGV POINT</h2>
	                <span>사용가능 포인트</span>
	            </div>
	            <div><strong>${principal.user.point }</strong> 점</div>
	        </div>
	    </div>
    </div>
    <div class="modal" class="">
	   <div class="window">
	       <div class="popup">
	           <div class="modal_title">나의 프로필 수정</div>
	           <div id="mp_content" class="modal_content">
	               <div class="user_wrap">
	               	<input type="hidden" class="userid" value="${principal.user.userid }">
	                   <h1>${principal.user.username }님</h1>
	                   <span>${principal.user.userid }</span>
	               </div>
	               <div class="content_wrap">
	               	<form id="update_form" action="">
	                    <dl>
	                        <dt>닉네임</dt>
	                        <dd>
	                            <span>한글, 영문, 숫자 혼용 가능(한글기준 10자 이내)</span>
	                            <div class="input_wrap">
	                                <input type="text" class="nickname" name="nickname" maxlength="10">
	                                <button type="button" class="check_btn" onclick="checkNickName()">중복확인</button>
	                            </div>
	                        </dd>
	                    </dl>
	                    <dl>
	                        <dt>프로필 이미지</dt>
	                        <dd>
	                           	<div class="img_wrap"><img class="user_img" src="/image/${principal.user.profile_img }" alt=""></div>
	                           	<span>JPG, GIF, BMP 파일만 등록 가능합니다. (최대 3M)</span>
	                           	<input type="file" name="file" class="file_btn" onchange="lodaImg()" value="파일 선택">
	                        </dd>
	                    </dl>
	               	</form>
	               </div>
	               <div class="btn_wrap">
	                   <button type="button" class="submit_btn" onclick="update_info()">등록하기</button>
	                     <button type="button" class="cancle_btn">취소</button>
	                 </div>
	             </div>
	             <button class="close_btn" type="button"></button>
	         </div>
	     </div>
	</div>
	<script type="text/javascript" defer="defer" src="/js/mypage.js"></script>
</body>
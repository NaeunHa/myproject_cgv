<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
	<link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<header id="header">
	<div class="header_content">
        <div class="contents">
            <div class="main_logo">
                <a href="/"><img class="img_logo" src="/images/logoRed.png" alt=""></a>
                <span>cultureplex</span>
            </div>
            <nav class="user_nav">
                <ul>
                    <li class="signUp_wrap"><a href="/auth/signin"><img src="/images/loginPassword.png" alt=""><span>로그인</span></a></li>
                    <li class="signIn_wrap"><a href="/auth/signup"><img src="/images/loginJoin.png" alt=""><span>회원가입</span></a></li>
                    <li class="member_wrap"><a href="/user/mycgv"><img src="/images/loginMember.png" alt=""><span>MY CGV</span></a></li>
                    <li class="customer_wrap"><a href="#"><img src="/images/loginCustomer.png" alt=""><span>고객센터</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <nav class="nav">
        <div class="nav_wrap">
            <div class="contents">
                <h1><a href="/"><img src="/images/logoWhite.png" alt="CGV" /></a></h1>
                <ul class="main_nav">
                    <li>
                        <a href="/movies" class="mn movie_btn">영화</a>
                        <dl class="sub_nav">
                            <dt><a href="/movies" class="movie_btn">영화</a></dt>
                            <dd><a href="/movies" class="movie_chart_btn">무비차트</a></dd>
                        </dl>
                    </li>
                    <li>
                        <a href="#" class="mn theater_btn">극장</a>
                        <dl class="sub_nav">
                            <dt><a href="#" class="theater_btn">CGV 극장</a></dt>
                            <dd><a href="#" class="theater_special_btn">특별관</a></dd>
                        </dl>
                    </li>
                    <li>
                        <a href="#" class="mn ticket_btn">예매</a>
                        <dl class="sub_nav">
                            <dt><a href="#" class="ticket_btn">빠른예매</a></dt>
                            <dd><a href="#" class="ticket_schedule_btn">상영스케줄</a></dd>
                        </dl>
                    </li>
                    <li>
                        <a href="#" class="mn store_btn">스토어</a>
                        <dl class="sub_nav">
                            <dt><a href="#" class="store_btn">스토어</a></dt>
                            <dd><a href="#" class="store_ticket_btn">영화관람권</a></dd>
                            <dd><a href="#" class="store_giftcard_btn">기프트카드</a></dd>
                            <dd><a href="#" class="store_combo_btn">콤보</a></dd>
                            <dd><a href="#" class="store_popcorn_btn">팝콘</a></dd>
                            <dd><a href="#" class="store_beverage_btn">음료</a></dd>
                            <dd><a href="#" class="store_snack_btn">스낵</a></dd>
                        </dl>
                    </li>
                    <li>
                        <a href="#" class="mn event_btn">이벤트</a>
                        <dl class="sub_nav">
                            <dt><a href="#" class="event_btn">이벤트</a></dt>
                            <dd><a href="#" class="event_special_btn">SPECIAL</a></dd>
                            <dd><a href="#" class="event_membership_btn">멤버십/CLUB</a></dd>
                            <dd><a href="#" class="event_discount_btn">제휴/할인</a></dd>
                        </dl>
                    </li>
                </ul>
                <div class="search_wrap"><input class="ip_search" type="text" placeholder="12월엔 매트릭스"><img src="/images/search.png" alt=""></div>
            </div>
        </div>
    </nav>
</header>
<!-- S 예매하기 및 TOP Fixed 버튼 -->
 <div class="fixedBtn_wrap">
     <a href="#" class="btn_fixedTicketing">예매하기</a>
     <a href="#" class="btn_gotoTop"><img src="/images/gotoTop.png" alt="최상단으로 이동" /></a>
</div>
<script type="text/javascript" defer="defer" src="/js/header.js"></script>
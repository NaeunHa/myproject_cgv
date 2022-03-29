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
    <title>CGV | 개인정보 변경</title>
    <link rel="stylesheet" href="/css/mypage_nav.css">
    <link rel="stylesheet" href="/css/mypage_dtl.css">
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
                                <dt><a href="/user/account/personal">회원정보</a></dt>
					            <dd class="now"><a href="/user/account/personal">개인정보 변경</a></dd>
					            <dd><a href="/user/account/redirect/withdrawal">회원탈퇴</a></dd>
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
                    <h1 class="detail_title">회원정보 수정</h1>
                    <div id="detail_box3">
                        <h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
                        <form class="table update_form">
                            <dl>
                                <dt>이름</dt>
                                <dd><span>${principal.user.username }</span></dd>
                            </dl> 
                            <dl>
                                <dt>아이디</dt>
                                <dd>
                                	<input hidden="hidden" class="user_info" value="${principal.user.userid }">
                                	<span>${principal.user.userid }</span>
                               	</dd>
                            </dl>
                           <c:if test="${empty (principal.user.provider)}">
                           	<dl>
                                <dt>비밀번호<button type="button" class="change_btn">변경</button></dt>
                                <dd class="hidden_box">
                                	<input type="password" class="item_ip">
                                	<div class="errorMsg"></div>                                
                                </dd>
                            </dl>
                            <dl class="hidden_box">
                                <dt>비밀번호 확인</dt>
                                <dd>
                                	<input type="password" class="item_ip">
	                                <div class="errorMsg"></div>
                                </dd>
                                <dd><button type="button" class="update_personal_btn">수정하기</button></dd>
                            </dl>
                           </c:if>
                            <dl>
	                		<c:choose>
	                   		<c:when test="${empty(principal.user.birthday)}">
	                   			<dt>생년월일<button type="button" class="set_birth_btn">설정</button></dt>
	                   			<dd class="birth_empty_box">
	                   				<span>설정이 되어있지 않습니다. 설정을 원하시면 <strong>'설정'</strong> 버튼을 클릭해주세요.</span>
	                   			</dd>
                 				<dd class="set_bith_hidden_box hidden_box">
	                      			<div>
			                            <select class="birth_select"></select>년 
			                            <select class="birth_select"></select>월
			                            <select class="birth_select"></select>일
			                            <button type="button" class="update_birth_btn">설정하기</button>
		                        	</div>
	                       	   		<span>설정하신 생일을 기준으로 15일 전 생일쿠폰이 발행됩니다.</span>
	                    		</dd>
	                   		</c:when>
	                   		<c:otherwise>  
	                   			<dt>생년월일</dt>
                				<dd>
                					<input type="hidden" class="principal_birth" value="${principal.user.birthday }">
                					<span class="user_birth"></span>
                				</dd>
	                   		</c:otherwise>
	                   	</c:choose>
                            </dl>
                        <c:choose>
                       		<c:when test="${empty (principal.user.provider)}">
                     			<dl>
	                              <dt>휴대전화<button type="button" class="change_btn">변경</button></dt>
	                              <dd class="now_info">
	                              	<input type="hidden" class="user_info" value="${principal.user.phone }">
	                                <span class="user_phone"></span>
                            	  </dd>
                              	  <dd class="hidden_box">
                                  	<input type="tel" class="item_ip" maxlength="11">
									<button type="button" class="sendSMS_btn">인증하기</button>
									<div class="code_box">
                                  		<input type="text" class="item_ip" maxlength="6">
										<button type="button" class="update_personal_btn">확인</button>									
									</div>	                                
                             	 </dd>
                          		</dl>
                       		</c:when>
                       		<c:otherwise>
                       			<dl>
                           			<dt>휴대전화</dt>
                    				<dd>
                    				  <input type="hidden" class="user_info" value="${principal.user.phone }">
	                               	  <span class="user_phone"></span>
                    				</dd>
                        		</dl>
                       		</c:otherwise>
                        </c:choose>
                        <c:choose>
                            	<c:when test="${empty (principal.user.provider)}">
                            	<dl>
	                                <dt>이메일<button type="button" class="change_btn">변경</button></dt>
	                                <dd class="now_info">
	                                	<input hidden="hidden" class="user_info" value="${principal.user.email }">
	                                    <span>${principal.user.email }</span>
	                                </dd>
	                                <dd class="hidden_box email_box">
	                                	<div>
											<input type="text" class="item_ip"> @ <input type="text" class="item_ip email">
			                                <select class="item_select">
			                                    <option value="1" selected="selected">직접입력</option>
			                                    <option value="naver.com">네이버</option>
			                                    <option value="gmail.com">구글</option>
			                                    <option value="hanmail.net">다음</option>
			                                    <option value="nate.com">네이트</option>
			                                </select>                                	
	                                	</div>
		                                <div class="errorMsg"></div>   
	                                </dd>
	                                <dd class="hidden_box"><button type="button" class="update_personal_btn">수정하기</button></dd>
                           		</dl>
                            	</c:when>
                            	<c:otherwise>
                         		<dl>
                           			<dt>이메일</dt>
                    				<dd><span>${principal.user.email }</span></dd>
                        		</dl>
                            	</c:otherwise>
                            </c:choose>
                            
                        </form>
                    </div>
                </div>
            </article>
        </div>
    </section>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript" src="/js/dtl_personal.js"></script>
</body>
</html>
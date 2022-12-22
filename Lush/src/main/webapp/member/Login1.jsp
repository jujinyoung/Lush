<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/Login1_style.css" rel="stylesheet" type="text/css">
</head>
<body>


<section id="login" style="padding-top: 128px;">
	<div class="inner">
		<article class="login-wrap">
			<div class="page-top">
				<h2 class="page-title-small">로그인</h2>
			</div>
			<ul class="tab-btn login-tab">
				<li><a id="userTab" href="javascript:;" class="on">회원</a></li>
				<li><a id="guestTab" href="javascript:;">비회원</a></li>
			</ul>

			<div class="tab-cont">
				<!-- 탭1번. 회원 -->
				<div class="tab-inner on">
					<div class="search-wrap">
						<form id="loginForm" action="/op_security_login" method="POST">
							<input type="hidden" name="_csrf" value="3214ce37-95ac-4e17-aecf-91b9988fc852"><input type="hidden" name="target" value="/">
							<input type="hidden" name="popup" value="">
							<input type="hidden" name="failureUrl" value="/users/login?target=/&amp;popup=">
							<input type="hidden" name="op_login_type" value="ROLE_USER">
							<input type="text" name="op_username" id="op_username" placeholder="아이디">
							<input type="password" name="op_password" id="op_password" placeholder="비밀번호">
							<div class="input-wrap">
								<input type="checkbox" id="save_id" name="op_remember_me" value="true"><label for="save_id">아이디 저장</label>
							</div>
							<button type="submit" class="black-btn large-btn">로그인</button>

							<ul class="login-opt flex center">
								<li><a href="/users/join-us">회원가입</a></li>
								<li><a href="/users/find-id">아이디 찾기</a></li>
								<li><a href="/users/find-password">비밀번호 찾기</a></li>
							</ul>
							
								
<!-- 네이버아이디로로그인 버튼 노출 영역 -->


<!-- //네이버아이디로로그인 버튼 노출 영역 -->

<div><input type="hidden" name="_csrf" value="3214ce37-95ac-4e17-aecf-91b9988fc852"></div></form></div>
 
				<!-- 탭2번. 비회원 -->
				<div class="tab-inner no-member">
					<form id="guestLoginForm" action="/users/guestLogin" method="POST">
						<div class="search-wrap">
						<input type="hidden" name="op_login_type" value="ROLE_USER">
						<input type="text" name="guestUserName" id="userName" placeholder="주문자명">
						<input type="text" name="orderCode" id="guestOrderNumber" placeholder="주문번호">
						<button type="submit" class="black-btn large-btn">로그인</button>
						</div>
					<div><input type="hidden" name="_csrf" value="3214ce37-95ac-4e17-aecf-91b9988fc852"></div></form>

					<p class="body2">주문번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
					</div>
			</div>
		</article>
	</div>
</section>

</body>
</html>
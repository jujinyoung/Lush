<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/ManagerLogin_style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>




<section id="login" style="padding-top: 128px;">
	<div class="inner">
		<article class="login-wrap">
			<div class="page-top">
				<h2 class="page-title-small">관리자 로그인</h2>
			</div>

			<div class="tab-cont">
				<div class="tab-inner on">
					<div class="search-wrap">
						<form id="loginForm" action="" method="POST">
							<input type="text" name="id" id="id" placeholder="관리자 아이디">
							<input type="password"name="password" id="password"  placeholder="비밀번호">
							<div class="input-wrap">
							
							</div>
							<button type="submit" class="black-btn large-btn">로그인</button>
							</form>
					</div>
					</div>
				</div>			
		</article>
			</div>
	</section>





</body>
</html>
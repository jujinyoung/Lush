<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/ManagerLogin_style.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
</head>
<body>



 <jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="login" style="padding-top: 128px;">
	<div class="inner">
		<article class="login-wrap">
			<div class="page-top">
				<h2 class="page-title-small">관리자 로그인</h2>
			</div>

			<div class="tab-cont">
				<div class="tab-inner on">
					<div class="search-wrap">
						<form id="loginForm" action="/Lush/admin/admlogin.do" method="POST">
							<input type="text" name="adminid" id="adminid" placeholder="관리자 아이디">
							<input type="password"name="adpassword" id="adpassword"  placeholder="비밀번호">
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
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>


<script>

<c:if test="${errors.idorpasserror}">
	alert('아이디 또는 패스워드를 확인해 주세요.');
</c:if>

</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String certificationCode = (String)request.getAttribute("certificationCodel");

request.setAttribute("certificationCo",certificationCode);
System.out.println(certificationCode);



String id = (String)request.getAttribute("id");
System.out.println(id);
request.setAttribute("id", id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/PassEmail_style.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
<style>
</style>
</head>
<body>

 <jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
 <section id="authPw" style="padding-top: 128px;">
	<div class="inner">
		<article class="join-wrap">
			<div class="page-top">
				<h2 class="page-title-small">비밀번호 찾기</h2>
				</div>
			<div class="search-wrap">
				<!-- 이메일 인증번호 입력 칸  -->
				<form id="emailnum" action="/Lush/member/changepass.do" method="post">
				<input type="text" name="userCertifi" placeholder="인증번호 입력">
				<input type="hidden" name="id" value="<%= (String)request.getAttribute("id") %>">
				<input type="hidden" name="certificationCo" value="<%= (String)request.getAttribute("certificationCodel") %>">
				<button type="submit" class="black-btn large-btn">이메일 인증</button>
				</form>
				<ul class="login-opt">
					<li><a href="SignUp.jsp">회원가입</a></li>
					<li><a href="FindId.jsp">아이디찾기</a></li>
				</ul>
				</div>
			</article>
	</div>
</section>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>





<script>
<c:if test="${errors.codenotmatch}">
	alert('코드가 일치하지 않습니다');
</c:if>
<c:if test="${errors.nocode}">
alert('코드가 입력되지 않았습니다.');
</c:if>

</script>
</body>
</html>
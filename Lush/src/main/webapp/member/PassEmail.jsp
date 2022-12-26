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
<title>비밀번호 찾기 - 이메일 인증</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/PassEmail_style.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
<pre>
비밀번호 찾기.jsp -> 버튼 누르는 순간 이메일 인증번호 자동 전송 ->
-> alert"인증번호를 전송했습니다" ->  이메일 인증 -> 비밀번호 변경 -> 완료

> ajax[입력받은 이메일에 랜덤값 전송, 동시에 랜덤값을 세션에 저장]
 -> 인증번호 입력란 -> 인증 확인 버튼 -> ajax[입력받은 인증 번호와 세션에 저장한 랜덤 값이 일치하는지 비교
 </pre>
 
 <section id="authPw" style="padding-top: 128px;">
	<div class="inner">
		<article class="join-wrap">
			<div class="page-top">
				<h2 class="page-title-small">비밀번호 찾기</h2>
				</div>
			<div class="search-wrap">
				<!-- 이메일 인증번호 입력 칸  -->
				<!-- 추후 param.email 로 받아 ㅇㅇㅇ 로 인증번호를 전송하였습니다 출력  -->
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


눌렀을 때 -> 인증번호가 다르면 passemail.jsp 리턴 -> alert (인증번호가 일치하지 않습니다)
			-> 같으면 비밀번호 변경페이지로 이동 
				if(usercode == null || usercode.isEmpty())
			System.out.println("코드 입력안함");
			errors.put("id", Boolean.TRUE);
		
			

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
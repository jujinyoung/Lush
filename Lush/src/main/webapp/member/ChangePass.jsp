<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
	String authcode = (String)request.getParameter("certificationCo");
	String usercode = (String)request.getParameter("userCertifi");
	System.out.println(authcode);
	System.out.println(usercode);
	if( authcode.equals(usercode)){
		// 팝업
		System.out.println("코드가 일치합니다.");
		response.sendRedirect("FindPassPre.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

비밀번호 변경 창입니다.

</body>
</html>
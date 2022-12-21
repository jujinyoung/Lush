<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 정보 입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>
</head>
<body>

<p>
<form action ="/Lush/member/join.do" method="post">
아이디 : <br/><input type="text" name="me_loginid" value="moon"><br>
암호 : <br/><input type="password" name="me_pass" value="1234"><br>
암호 확인 : <br/><input type="password" name="me_confirmpass" value="1234"><br>
이름 : <br/><input type="text" name="me_name" value="홍길동"><br>
주소 : <br/><input type="text" name="me_add" value="서울시"><br>
전화번호 : <br/><input type="text" name="me_tel" value="12-3456"><br>
이메일 : <br/><input type="email" name="me_email" value="moon@naver.com"><br>
닉 : <br/><input type="text" name="me_nick" value="AA"><br>
	

<input type="submit" value="가입">

</form>

<script>
</script>
</body>
</html>
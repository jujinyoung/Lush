<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/LoginMain_style.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
</head>
<body>



<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="login" style="padding-top: 128px;">
	<div class="inner">
		<article class="login-wrap">
			<div class="page-top">
				<h2 class="page-title-small">로그인</h2>
			</div>
			<ul class="tab-btn login-tab">
				<li><a id="userTab" href="#" class="on">회원</a></li>
				<li><a id="guestTab" href="#">비회원</a></li>
			</ul>

			<div class="tab-cont">
				<!-- 탭1번. 회원 -->
				<div class="tab-inner on">
					<div class="search-wrap">
						<form id="loginForm" action="/Lush/member/login.do" method="POST">
							<input type="hidden" name="_csrf" value="3214ce37-95ac-4e17-aecf-91b9988fc852"><input type="hidden" name="target" value="/">
							<input type="hidden" name="popup" value="">
							<input type="hidden" name="failureUrl" value="/users/login?target=/&amp;popup=">
							<input type="hidden" name="op_login_type" value="ROLE_USER">
							<input type="text" name="id" id="id" placeholder="아이디" value="nana">
							<input type="password"name="password" id="password"  placeholder="비밀번호" value="1234">
							<div class="input-wrap">
								<input type="checkbox" id="save_id" name="save_id" value="true"><label for="save_id">아이디 저장</label>
							</div>
							<button type="submit" class="black-btn large-btn">로그인</button>

							<ul class="login-opt flex center">
								<li><a href="SignUp.jsp">회원가입</a></li>
								<li><a href="FindId.jsp">아이디 찾기</a></li>
								<li><a href="FindPassPre.jsp">비밀번호 찾기</a></li>
							</ul>
							</form>
						
					</div>
					</div>

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

					<p class="body2" id="etcinfo">주문번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
					</div>
			</div>
		</article>
	</div>
</section>


<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

<script>
/* 회원/비회원 탭 변경  */

$(function() {
	
	$("#guestLoginForm").css("display", "none");
	$("#etcinfo").css("display", "none");
	
    $('#userTab').click(function(){
    	$("#loginForm").css("display", "block");
 	 	$("#guestLoginForm").css("display", "none");
 	 	 $("#etcinfo").css("display", "none");
 	    
 	 	$("#userTab").css("color", "#222");
 	 	$("#userTab").css("font-weight", "400");
 		$("#guestTab").css("color", "#949494");
	   	});
   
    $('#guestTab').click(function(){
		
		  $("#loginForm").css("display", "none");
		  $("#guestLoginForm").css("display", "block");
		  $("#etcinfo").css("display", "block");
		  
		   
	 	 	$("#guestTab").css("color", "#222");
	 	 	$("#guestTab").css("font-weight", "400");
	 		$("#userTab").css("color", "#949494");
	 	 	
	
	   	});
});
</script>

<script>

/* 아이디 저장  */
 
$(document).ready(function(){
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("saveid");
    $("#id ").val(key); 
     
    if($("#id ").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#save_id").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#save_id").change(function(){ // 체크박스에 변화가 있다면,
        if($("#save_id").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id ").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#save_id").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("saveid", $("#id ").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>
</body>
</html>
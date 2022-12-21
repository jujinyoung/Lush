<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/Login_style.css" rel="stylesheet" type="text/css">
<style>
</style>
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
						<form id="loginForm" action="/Lush/member/login.do" method="POST">
							<input type="hidden" name="_csrf" value="1b57ed98-63db-4c8a-9394-51c6884aac10"><input type="hidden" name="target" value="">
							<input type="hidden" name="popup" value="">
							<input type="hidden" name="failureUrl" value="/users/login?target=&amp;popup=">
							<input type="hidden" name="op_login_type" value="ROLE_USER">
							<input type="text" name="id" id="id" placeholder="아이디">
							<input type="password" name="password" id="password" placeholder="비밀번호">
							<div class="input-wrap">
								<input type="checkbox" id="save_id" name="op_remember_me" value="true"><label for="save_id">아이디 저장</label>
							</div>
							<button type="submit" class="black-btn large-btn">로그인</button>

							<ul class="login-opt flex center">
								<li><a href="SignUp.jsp">회원가입</a></li>
								<li><a href="FindId.jsp">아이디 찾기</a></li>
								<li><a href="FindPass.jsp">비밀번호 찾기</a></li>
							</ul>
							<div class="sns-btns">
								<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<!-- <div id="naver_id_login">
	<div id="naverIdLogin" style="display:none;"><a id="naverIdLogin_loginButton" href="#"><img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="40"></a></div>
</div> 


	<input type="hidden" name="snsType" value="naver">
	<input type="hidden" name="snsId" value="">
	<input type="hidden" name="accessToken" value="">

<!-- //네이버아이디로로그인 버튼 노출 영역 -->
<!-- 
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: '0Q8wjCNa7cJS0AvkCJEQ',
				callbackUrl: 'https://www.lush.co.kr/sns-user/naver-callback',
				isPopup: true, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 40} /* 로그인 버튼의 타입을 지정 */
			}
	);

	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();

	function naverResponse(snsUser) {

		var isJoined = true;

		$.post("/sns-user/sns-joined-check", snsUser, function(response){

			if (response.value == 0) {
				isJoined = false;
			}

			if (isJoined) {
				
						snsUserSubmit(snsUser);
					
			}
			else {
				
						location.href="/users/sns-agreement?snsType=naver";
					
			}
		});
	}

	function naverProcess() {
		$('#naverIdLogin_loginButton img').click();
	}
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

	<form id="kakaoAuthForm" action="" method="post">
    <input type="hidden" name="snsType" value="kakao">
    <input type="hidden" name="snsId" value="">
<div><input type="hidden" name="_csrf" value="1b57ed98-63db-4c8a-9394-51c6884aac10"></div></form>
<script type="text/javascript">

	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('a25f713d0b81914924e2a23fbc394b58');

	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
                        // 카톡 닉네임 이모티콘 제거 정규식
                        var patterns = "[\\uD83C-\\uDBFF\\uDC00-\\uDFFF]+";
						var nickName = response.properties.nickname;
                        nickName = nickName.replace(new RegExp(patterns), '');
                        response.properties.nickname = nickName;

						var snsUser = {
							"snsType" : "kakao",
							"snsId" : response.id,
							"email" : response.kakao_account.email,
							"snsName" : response.properties.nickname,
                            "nickName" : response.properties.nickname,
                            "gender" : (response.kakao_account.gender == "male" ? "0" : "1"),
                            "birthday" : response.kakao_account.birthday,
                            "birthyear" : '',
                            "mobile" : setMobileFormat(response.kakao_account.phone_number),
                            "age" : response.kakao_account.age_range
						};

						var isJoined = true;
                        $.post("/sns-user/sns-joined-check", snsUser, function(response){

                            if (response.value == 0) {
                                isJoined = false;
                            }

                            if (isJoined) {
                                
                                        snsUserSubmit(snsUser);
                                    
                            } else {
                                
                                        location.href="/users/sns-agreement?snsType=kakao";
                                    
                            }
                        });

					},
					fail : function(error) {
						console.log(JSON.stringify(error));
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	};

	function disconnectKakaoAction() {

        Kakao.API.request({
            url: '/v1/user/unlink',
            success: function(response) {
                userLeaveAction();
            },
            fail: function(error) {
                console.log(error);
            },
        });
    }

    function setMobileFormat(mobileNum) {
	    var mobile = "";
        if (mobileNum) {
            var moNumArr = mobileNum.split("-");
            mobile = "010" + moNumArr[1] + moNumArr[2];
        }
        return mobile;
    }
    
</script>
<a href="javascript:naverProcess();" class="naver-btn">네이버 아이디로 로그인</a>
								<a href="javascript:loginWithKakao();" class="kakao-btn">카카오 아이디로 로그인</a>
							</div></form>
						
					</div>
					<form name="sso-login-form" id="sso-login-form" action="/op_security_login" method="post" target="_parent">
	<page:csrf>
	<input type="hidden" name="target" value="/">
	<input type="hidden" name="op_login_type" value="ROLE_USER">
	<input type="hidden" name="failureUrl" value="/users/login?target=">
	<input type="hidden" name="op_username">
	<input type="hidden" name="op_password" id="op_password">
	<input type="hidden" name="op_signature" id="op_signature">
	<input type="hidden" name="op_sns_login_id" id="op_sns_login_id">


<form id="joinCompleteForm" action="/sns-user/join-complete" method="post">
	<page:csrf>
	<input type="hidden" name="loginId">


<script type="text/javascript">
	function snsUserSubmit(snsUser, target) {

		$.post("/m/sns-user/search", snsUser, function(response) {

			if (response.status == "00") {
				if (response.value == "00") {

					if (target) {
						$('#sso-login-form input[name="target"]').val(target);
					}
					$('#sso-login-form input[name="op_username"]').hide();
					$("#sso-login-form #op_password").hide();
					$('#sso-login-form input[name="op_username"]').val(response.shadowLoginKey);
					$("#sso-login-form #op_password").val(response.shadowLoginPassword);
					$("#sso-login-form #op_signature").val(response.shadowLoginSignature);
					$("#sso-login-form #op_sns_login_id").val(response.loginId);
					$("#sso-login-form").submit();
				} else if (response.value == "99") {
					var uri = "/sns-user/join-complete";
					if (isMobileLayer != 'false') {
						$("#joinCompleteForm").prop("action","/m" + uri);
					}
					$("#joinCompleteForm").find("[name=loginId]").val(response.loginId);
					$("#joinCompleteForm").submit();
				} else {
					alert(response.message);
					return false;
				}
			} else if (response.status == "01") {
				alert(response.message);
			} else {
				console.log("Error Occurred - " + response.message);
			}
		});
	}
</script> -->

</page:csrf><div><input type="hidden" name="_csrf" value="1b57ed98-63db-4c8a-9394-51c6884aac10"></div></form></page:csrf><div><input type="hidden" name="_csrf" value="1b57ed98-63db-4c8a-9394-51c6884aac10"></div></form></div>

				<!-- 탭2번. 비회원 -->
				<div class="tab-inner no-member">
					<form id="guestLoginForm" action="/users/guestLogin" method="POST">
						<div class="search-wrap">
						<input type="hidden" name="op_login_type" value="ROLE_USER">
						<input type="text" name="guestUserName" id="userName" placeholder="주문자명">
						<input type="text" name="orderCode" id="guestOrderNumber" placeholder="주문번호">
						<button type="submit" class="black-btn large-btn">로그인</button>
						</div>
					<div><input type="hidden" name="_csrf" value="1b57ed98-63db-4c8a-9394-51c6884aac10"></div></form>

					<p class="body2">주문번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
					</div>
			</div>
		</article>
	</div>
</section>









<!--  
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
<div class="tab-inner on">
<div class="search-wrap">
<form id="loginForm" action="/Lush/member/login.do" method="post">
<input type="text" name="id" placeholder="아이디"><Br>
<input type="password" name="password" placeholder="비밀번호">
	<div class="input-wrap">
	<input type="checkbox" id="save_id" name="op_remember_me" value="true" data-gtm-form-interact-field-id="0">
	<label for="save_id">아이디 저장</label>
	</div>
	<button type="submit" class="black-btn large-btn">로그인</button>
	<ul class="login-opt flex center">
		<li><a href="SignUp.jsp">회원가입</li>
		<li><a href="FindId.jsp">아이디 찾기</li>
		<li><a href="FindPass.jsp">비밀번호 찾기</li>
	</ul>
</form>
</div>
</div>
</div> <!-- tabcont -->
<!-- </article>
</div>div inner
</section>
 -->

<script>
</script>
</body>
</html>
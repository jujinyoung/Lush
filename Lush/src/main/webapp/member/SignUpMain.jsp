
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 정보 입력</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/SignUpMain_style.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>


<section id="joinInfo" style="padding-top: 128px;">
	<div class="page-top">
		<h2 class="page-title">회원가입</h2>
	</div>
	<div class="inner">
		<article class="join-step">
			<ul class="flex center">
				<li>약관동의</li>
				<li class="on">정보입력</li>
				<li>가입완료</li>
			</ul>
		</article>
		<form id="user" action="/Lush/member/join.do" method="post"><input type="hidden" name="miAgreementFlag" value="Y">
		<input type="hidden" name="authType" value="KCP">
		<article class="basic-info">
			<div class="flex">
				<h3>기본정보</h3>
				<p class="body1"><span>*</span>표시는 반드시 입력하셔야 하는 항목입니다.</p>
			</div>
			<table class="no-border-table">
				<colgroup>
					<col width="145px">
					<col width="auto">
				</colgroup>
				<tbody><tr>
					<th><span class="req">*</span>아이디</th>
					<td>
						<div class="id-check">
							<input type="text" id="loginId" name="loginId" placeholder="영문 또는 영문 및 숫자 4자리 이상" title="아이디">
							<button type="button" id="idDupCheckBtn" class="border-btn">중복확인</button>
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="req">*</span>비밀번호</th>
					<td><input type="password" id="passWord" name="password" class="_not_blank" placeholder="영문 대소문자 및 숫자 중 2개 이상 조합, 8자리 이상" title="비밀번호"></td>
				</tr>
				<tr>
					<th><span class="req">*</span>비밀번호 확인</th>
					<td><input type="password" id="passWordConfirm" class="_not_blank"></td>
				</tr>
				<tr>
					<th><span class="req">*</span>이름</th>
					<td><input type="text" id="name" name="userName" value="문성준" readonly=""></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" id="nickName" name="userNickName"></td>
				</tr>
				<tr class="basic-info-mail clear">
					<th><span class="req">*</span>이메일</th>
					<td>
						<input type="text" id="fakeEmail" value="">
						<input type="hidden" id="email" name="email" value="">
						<input type="hidden" id="emailAuthToken" value="">
						<div class="select-box">
							<a href="javascript:;" id="selectedEmail" class="selected-value">직접입력</a>
							<ul class="option-box" name="">
								<li>직접입력</li>
								<li>@naver.com</li>
								<li>@hanmail.net</li>
								<li>@gmail.com</li>
								<li>@nate.com</li>
								<li>@hotmail.com</li>
								<li>@icloud.com</li>
							</ul>
						</div>
						<button type="button" id="emailAuthRequestBtn" name="" class="border-btn">이메일 인증</button>

						<div class="auth-wrap">
							<label for="authNumber">인증번호 입력</label>
							<input type="text" id="authNumber" name="">
							<button type="button" id="confirmEmailBtn" name="" class="border-btn">메일인증 확인</button>
						</div>

						<div class="input-wrap">
							<input type="checkbox" id="mailAgree" name="receiveEmail" value="0"><label for="mailAgree">정보/이벤트 메일 수신에 동의합니다.</label>
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="req">*</span>휴대전화</th>
					<td>
						<input type="text" id="cellPhoneNum" name="phoneNumber" value="01076365334" readonly="" placeholder="- 없이 입력하세요.">
							<div class="input-wrap">
							<input type="checkbox" id="phoneAgree" name="receiveSms" value="0"><label for="phoneAgree">정보/이벤트 문자 수신에 동의합니다.</label>
						</div>
					</td>
				</tr>
				<tr class="basic-info-address">
					<th><span class="req">*</span>주소</th>
					<input type="hidden" name="post" id="post" title="우편번호">
					<td>
						<input type="text" name="newPost" id="newPost" readonly="">
						<button type="button" class="border-btn" onclick="openDaumPostcode();">우편번호 검색</button>
						<input type="text" name="address" id="address" readonly="">
						<input type="text" name="addressDetail" id="addressDetail">
					</td>
				</tr>
			</tbody></table>
		</article>
		<div class="btn-wrap large">
			<a href="javascript:void(0);" class="black-btn" id="fakeJoinBtn">회원가입</a>
			<button type="submit" style="display:none;" id="joinBtn"></button>
		</div>
		<div>
<input type="hidden" name="_csrf" value="cc5689a3-7cae-4304-8cae-43102270f4be">
</div></form></div>
</section>

<script type="text/javascript">
	var daumApiUrl = 'http://dmaps.daum.net/map_js_init/postcode.v2.js';
	if (window.location.protocol == 'https:') {
		daumApiUrl = 'https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js';
	}
	document.write('<script src="'+ daumApiUrl +'">' + '</' + 'script>');
</script>

<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="//t1.daumcdn.net/postcode/api/core/221018/1666013742754/221018.js"></script>
<script type="text/javascript">
function openDaumAddress(tagNames, callBack) {
	
	var defaultTagNames = {
		'newZipcode'			: 'newZipcode',
		'zipcode1' 				: 'zipcode1',
		'zipcode2' 				: 'zipcode2',
		'zipcode' 				: 'zipcode',
		'sido'					: 'sido',
		'sigungu'				: 'sigungu',
		'eupmyeondong'			: 'eupmyeondong',
		'jibunAddress'			: 'address',
		'jibunAddressDetail' 	: 'addressDetail',
		'roadAddress'			: 'address',
		'buildingCode'			: 'buildingCode'
	}
	
	if (tagNames != undefined) {
		$.each(defaultTagNames, function(key, value) {
			if (tagNames[key] != undefined) {
				defaultTagNames[key] = tagNames[key];
			}
		});
	}
	
	new daum.Postcode({
	    oncomplete: function(data) {	        	
	    	try {
	    		
	    		var post = data.postcode;
	    		if (post == '') {
	    			post = data.zonecode;
	    		}
	    		
		        $('input[name="'+ defaultTagNames.newZipcode +'"]').val(data.zonecode);
		        $('input[name="'+ defaultTagNames.zipcode +'"]').val(post);
		        $('input[name="'+ defaultTagNames.zipcode1 +'"]').val(data.postcode1);
		        $('input[name="'+ defaultTagNames.zipcode2 +'"]').val(data.postcode2);
		        
		        $('input[name="'+ defaultTagNames.sido +'"]').val(data.sido);
		        $('input[name="'+ defaultTagNames.sigungu +'"]').val(data.sigungu);
		        $('input[name="'+ defaultTagNames.eupmyeondong +'"]').val(data.bname);
				
		        var jibunAddress = data.jibunAddress;
		        if (jibunAddress == '') {
		        	jibunAddress = data.autoJibunAddress;
		        }
		        
		        var roadAddress = data.roadAddress;
		        if (roadAddress == '') {
		        	roadAddress = data.autoRoadAddress;
		        }
		        
		        var addr = jibunAddress;
		        if(data.userSelectedType == 'R'){
		        	addr = roadAddress;
		        }

                if(data.buildingName != ''){
                    addr += ' ('+data.buildingName+')';
                    roadAddress += ' ('+data.buildingName+')';
                }

		        $('input[name="'+ defaultTagNames.jibunAddress +'"]').val(addr);
		        $('textarea[name="'+ defaultTagNames.jibunAddress +'"]').val(addr);
		        $('input[name="'+ defaultTagNames.jibunAddressDetail +'"]').val("");
		        $('input[name="'+ defaultTagNames.jibunAddressDetail +'"]').focus();


		        $('input[name="'+ defaultTagNames.roadAddress +'"]').val(roadAddress);
		        $('input[name="'+ defaultTagNames.buildingCode +'"]').val(data.buildingCode);

		        if ($.isFunction(callBack)) {
		        	callBack(data);
		        }
		        
		        
		        
	    	} catch (e) {
				alert(e.message);
			}
	    	
	    }
	}).open();
}
</script>



<!-- 

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

</form> -->

<script>
</script>
</body>
</html>
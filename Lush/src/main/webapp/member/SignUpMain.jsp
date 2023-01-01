<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/SignUpMain_style.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>

 <jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
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
							<input type="text" class="input_id" id="loginId" name="loginId" placeholder="영문 또는 영문 및 숫자 4자리 이상" title="아이디">
							<button type="button" id="idDupCheckBtn" class="border-btn">중복확인</button>
							<!-- <label id="checkid">중복확인 클릭</label> -->
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="req">*</span>비밀번호</th>
					<td><input type="password" id="password" name="password" class="_not_blank" placeholder="영문 대소문자 및 숫자 중 2개 이상 조합, 8자리 이상" title="비밀번호"></td>
				</tr>
				<tr>
					<th><span class="req">*</span>비밀번호 확인</th>
					<td><input type="password" id="passwordconfirm" name="passwordconfirm" class="_not_blank"></td>
				</tr>
				<tr>
					<th><span class="req">*</span>이름</th>
					<td><input type="text" id="name" name="name"></td>
				</tr>
				<tr>
					<th><span class="req">*</span>닉네임</th>
					<td><input type="text" id="nick" name="nick"></td>
				</tr>

				<tr class="basic-info-mail clear">
					<th><span class="req">*</span>이메일</th>
					<td>
						 <input type="text" id="fakeEmail" name = "fakeEmail" class="_not_blank" placeholder="@를 포함해 입력해 주세요.">
						 <button type="button" id="EmailBtn" name="EmailBtn" class="border-btn">인증</button>
						 <div id="sendemail" style="display: none; color:#006400; height: 47.99px; width: 100px;
						 margin: 0 0 0 20px; padding: 4px;">
						 인증번호를<br>입력하세요
						 </div>
						<input type="hidden" id="emailsend" name="email" value="">
						<div class="auth-wrap">
							<label for="authNumber">인증번호 입력</label>
							<input type="text" id="authNumber" name="">
							<button type="button" id="confirmEmailBtn" name="" class="border-btn">메일인증 확인</button>

						</div>

						<div class="input-wrap">
							<input type="checkbox" id="mailAgree" name="receiveEmail" value="0">
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="req">*</span>휴대전화</th>
				<!-- 	<td>
						<input type="text" id="tel" name="tel" placeholder="- 없이 입력하세요.">
						<button type="button" id="telBtn" name="telBtn" class="border-btn">번호 인증</button>
						
							<div class="input-wrap">
						</div>
					</td> -->
					<td>
						<div class="id-check">
							<input type="text" id="tel" name="tel" placeholder="- 없이 입력하세요." >
							<button type="button" id="telBtn" name="telBtn" class="border-btn">번호 인증</button>
						</div>
					</td>
				</tr>
				<tr class="basic-info-address">
					<th><span class="req">*</span>주소</th>
					<td>			
					    <input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호" readonly="readonly">
						<button type="button" class="border-btn" onclick="sample6_execDaumPostcode()">우편번호 검색</button>
					<input type="text" name="sample6_address" id="sample6_address" placeholder="주소" readonly="readonly"> 
						<input type="text" name="sample6_detailAddress" id="sample6_detailAddress"  placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목(공백가능)"> 
					</td>
				</tr>
			</tbody></table>
		</article>
		<div class="btn-wrap large">
		<!-- 	<a href="javascript:void(0);" class="black-btn" id="fakeJoinBtn">회원가입</a> -->
			<button type="submit" class="black-btn"id="joinBtn">회원가입</button>
		</div>
		<div>
<input type="hidden" name="_csrf" value="cc5689a3-7cae-4304-8cae-43102270f4be">
</div></form></div>
</section>
<div class="modal__background" id="modalback" name="modalback">
<div id="modal" class="modal">
	<div class="modal_content" title="클릭시 창이 닫힙니다">
	<button id="close" class="close">x</button>
	<input type="text" id="smsnum" class="smsnum" placeholder="인증번호를 입력해 주세요" value="1234">
<!-- 	<input type="submit" id="smsmsend" class="smsmsend" value="인증번호 보내기"> -->
	<input type="submit" id="numsend" class="numsend" value="인증번호 인증">
	</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>



<!-- 유효성 검사 -->
<script>

<!-- 핸드폰 번호 인증 -->
/* 핸드폰 인증 -> 모달창 띄우기 */
let usernumber1 = "";
let ofcode = "";
 $(function() {
	  $('#telBtn').click(function(){ // 인증하기 -> 모달창 띄움 -> 인증번호 전송smsmsend
		/* 	alert("클릭"); */
	/* 		$(".modal").css("display", "block"); */
			$("#modalback").css("display", "block");
			$("#modal").css("display", "block");
			usernumber1 = $('#tel').val();
			
			$.ajax({ // ajax 처리 
				url : "/Lush/member/smspass.do",
				type : "post",
			 data : {usernumber1 :usernumber1}, // 사용자의 폰 번호로
				// async: false,
				dataType : "json",
				success : 
				function(  smsnum  ){
					ofcode = smsnum;
					alert("인증번호가 전송되었습니다!")
					
					
				}, // fuction
				error : function(){
					alert("서버요청실패");
				}
				})// ajax 
			
			
			
			
			
	   	})
			
	   	});
	

let newnum = "";
 $(function() {
	  $('#numsend').click(function(){ // 인증번호 전송 버튼 클릭 -> 창 바뀌면서 전송
		  $("#smsnum").attr("type", "text");
		  $("#smsmsend").attr("type", "hidden");
			$("#numsend").attr("type", "submit"); // 창이 바뀜
			
			newnum = $('#smsnum').val();
			
			if(newnum  == ofcode ){
				// readonly 
				alert("일치합니다");
				$(".modal").css("display", "none");
				$("#tel").attr("readonly", "true");
				$("#modalback").css("display", "none");
			}else{
				alert("일치하지 않습니다");
				$('#smsnum').focus();
			}
			
			
			
   	});
	    
	    
	});
		
	  


/* 유효성 검사 */


var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var n_RegExp = /^[가-힣]+$/; 

/* 비밀번호 유효성 */
let pass = "";

 $(function(){
	$('#password').focusout(function(){
		
		pass = $.trim($('#password').val()); 
		console.log(pass);
		 if( pass ==''){ // 아이디 공백 
	            alert("비밀번호를 입력해주세요.");
	            return false;
	        }
	        if(!RegExp.test( pass =='')){ 
	            alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");        
	            return false;
	        }
	})

 });

/*  이름 유효성 검사 */
let name = "";

 $(function(){
		$('#name').focusout(function(){
			
			name = $('#name').val();
			console.log(name);
			 if(name ==''){ // 이름 공백 
		            alert("이름을 입력해주세요.");
		            return false;
		        }
			 if(!n_RegExp.test(name)){ // 이름 특수 문자 사용 불가능 
		            alert("특수문자,영어,숫자는 사용할수 없습니다. 한글만 입력하여주세요.");
		            return false;
		        }
		})

	 });
	 
/* 휴대전화 유효성 검사  */	 
	 
let tel = "";
$(function(){
		$('#tel').focusout(function(){
			
			tel = $('#tel').val();
			 if(tel ==''){ // 번호 공백 
		            alert("번호를 입력해 주세요.");
		            return false;
		        }
			 if( tel.search("-") != -1 ){ // - 포함시
		            alert("- 를 제외한 숫자만 입력해 주세요.");
		            return false;
		        }
		})

	 });
	 
	 
/* 우편번호 유효성 검사 */

let zipcode = "";
	 $(function(){
		$('#sample6_postcode').focusout(function(){
			
			zipcode = $('#sample6_postcode').val();
			 if(zipcode ==''){ // 번호 공백 
		            alert("우편번호 검색을 클릭해 주세요.");
		            return false;
		        }
			 if( tel.search("-") != -1 ){ // - 포함시
		            alert("- 를 제외한 숫자만 입력해 주세요.");
		            return false;
		        }
		})

	 });


<!-- 이메일 인증 -->


let authcode = "";

$(function(){
	 $('#EmailBtn').click(function(){
		 let useremail = $('#fakeEmail').val();
		 console.log(useremail);
		 
		 if(useremail == null || useremail == ""){
			 
			 alert("이메일을 입력해 주세요");
			 $("#fakeEmail").focus();
			 return false;
			 
		 }
		/*  alert("버튼 클릭"); */
		 
		 if(useremail.match('@') ){
		/*  
		 let Email = $('#fakeEmail').val(); */
		 console.log(  useremail );
		 

		 $.ajax({
			url : "/Lush/member/idcheck.do",
			type : "GET",
			data : {useremail :useremail},
			async: false,
			dataType : "json",
			success : 
				function( certificationCode ){
				if(certificationCode != null ){
					alert('인증번호가 전송되었습니다!');
				/* 	$("#sendemail").css("display", "inline-block"); // 인증번호를 입력해주세요 띄우기  */
					console.log(certificationCode);
					authcode = certificationCode;
					console.log(authcode);
				}
			},
			error : function(){
				alert("서버요청실패");
			}
			})
			
		 }else{
			 alert("@를 포함해 주세요.");
			 return false;
		 }
			 
		})
});




<!-- 이메일 인증 확인 -->
$(function(){
	 $('#confirmEmailBtn').click(function(){
		
		/*  alert("버튼 클릭"); */
		 
		 let usercode = $('#authNumber').val();
		 
		if(authcode == usercode){
			alert("인증되었습니다!");
			$("#fakeEmail").attr("readonly", "true");
		}
		
		if(usercode == null || usercode ==""){
			alert("인증번호를 입력하세요!");
		}
		
		if(authcode != usercode){
			alert("일치하지 않습니다");
		}
		
			 
		})
});



<!-- 아이디 중복체크 / 유효성 검사 -->


var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var RegExp = /^[a-zA-Z0-9]{4,12}$/; 

	$('.input_id').focusout(function(){
		
		let userId = $('.input_id').val(); // input_id에 입력되는 값
		
		 if(userId == ''){ // 아이디 공백 
	            alert("ID를 입력해주세요.");
	            return false;
	        }
	        if(!RegExp.test(userId)){ //
	            alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");        
	            return false;
	        }
		
			
		console.log(userId);
		$.ajax({
			url : "/Lush/member/idcheck.do",
			type : "post",
			data : {userId: userId},
			dataType : 'json',
			success : function(result){
				if(result == 0){
					$("#idDupCheckBtn").html('사용불가');
					$("#idDupCheckBtn").css('color','red');
				} else{
					$("#idDupCheckBtn").html('사용가능');
					$("#idDupCheckBtn").css('color','green');
				} 
			},
			error : function(){
				alert("서버요청실패");
			}
		})
		 
	})


<!-- joinBtn 회원가입 버튼 누를 떄  -->

$(function(){
	 $('#joinBtn').click(function(){
	/* 	alert("회원가입 버튼 클릭!"); */
		<!-- 빈 값이 있다면 return false 후 그쪽으로 focus   -->
			<!-- 아이디 -->
			let userId = $('.input_id').val(); // input_id에 입력되는 값
			
			 if(userId == ''){ // 아이디 공백 
		            alert("ID를 입력해주세요.");
		            return false;
		        }
			 <!-- 비밀번호 -->
			var password = $.trim($('#password').val()); 
				 if( ppassword ==''){ // 아이디 공백 
			            alert("비밀번호를 입력해주세요.");
			            return false;
			        }
			 <!-- 이름 -->
				var usename = $('#name').val();
				 if(usename ==''){ // 이름 공백 
			            alert("이름을 입력해주세요.");
			            return false;
			        }
			<!-- 닉네임 -->
			var usenick = $('#nick').val();
			 if(usenick ==''){ // 이름 공백 
		            alert("닉네임을 입력해주세요.");
		            return false;
		        }
			 
	   <!--  -->
		})
});
</script>
<!-- 우편번호 검색  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
    
    
 /* postcode 에 값이 찰 때 readonly 로  */
 
 
/* $(function(){
	 $('#sample6_postcode').on('input',function(){
		if(  $('#sample6_postcode').val().empty '' ){
			$("#sample6_postcode").attr("readonly", "true");
		}
			 
	   <!--  -->
		})
}); */
</script>




<script>




</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/InfoChange_style.css" rel="stylesheet" type="text/css">
<title>회원정보 수정</title>
</head>
<body>
<!-- 

세션 값 확인 -> db값 가져와서 -> 화면에 보여주고 
-> 수정 각각 할 수 있게 


 -->
<section id="mypage-member" class="my-page" style="padding-top: 128px;">
	<div class="inner flex top">
		<!-- 마이페이지 좌측 메뉴 -->
		
		<!-- 마이페이지 우측 컨텐츠 영역 -->
		<article class="my-contents modify">
			<div class="mypage-top">
				<h2 class="mypage-title">회원정보 변경</h2>
			</div>
			<div class="modify-table">
				<form id="user" action="/Lush/member/changeinfo.do" method="post"><div class="table-wrap">
					<p class="require-notice"><span class="red">*</span>표시는 반드시 입력하셔야 하는 항목입니다.</p>
					<table class="no-border-table">
						<input id="userId" name="userId" type="hidden" value="726200"><colgroup>
							<col width="123px">
							<col width="auto">
						</colgroup>
						<tbody>
						<tr>
							<th><span class="req">*</span>이름</th>
							<td>
								<input id="userName" name="userName" disabled="disabled" type="text" value="<%= (String)request.getAttribute("name") %>"></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><input type="text" id="userNickName" name="userNickName" value="<%= (String)request.getAttribute("nick") %>"></td>
						</tr>
						<tr>
							<th><span class="req">*</span>이메일</th>
							<td>
								<input type="text" value="<%= (String)request.getAttribute("email") %>" readonly="" id="realemail" name="realemail" >
								<button type="button" class="sub-btn border-btn" id="emailChangeBtn">변경</button>
								<!-- <div class="input-wrap">
									<input type="checkbox" id="receiveEmail" name="receiveEmail" value="1">
									<label for="receiveEmail">정보/이벤트 메일 수신에 동의합니다.</label>
								</div> -->
							</td>
						</tr>
					<!-- 	<tr  id="emailhidden" style="display: none;">
							<th><span class="req">*</span>새 이메일</th>
							<td>
								<input type="text" value="the_hb@naver.com" readonly="">
								<button type="button" class="sub-btn border-btn" id="emailChangeBtn">변경</button>
								<div class="input-wrap">
									<input type="checkbox" id="receiveEmail" name="receiveEmail" value="1">
									<label for="receiveEmail">정보/이벤트 메일 수신에 동의합니다.</label>
								</div>
							</td>
						</tr> -->
						<tr class="EMAIL hidden" id="emailhidden" style="display: none;">
							<th id="email1">새 이메일</th>
							<td>
								<div class="input-wrap no-margin">
									<input type="text" id="fakeEmail"placeholder="새로운 이메일을 입력해 주세요">
									<input type="hidden" id="email" name="email" value="<%= (String)request.getAttribute("email") %> disabled="">
									<input type="hidden" id="emailAuthToken" value="">
									<!-- <div class="select-box">
										<a href="javascript:;" id="selectedEmail" class="selected-value">직접입력</a>
									
									</div> -->
								</div>
								<button type="button" id="emailAuthRequestBtn" class="sub-btn black-btn">이메일 인증</button>
							</td>
						</tr>
						<tr  id="emailhidden2" style="display: none;">
							<th>인증번호 입력</th>
							<td>
								<input type="text" id="authNumber" value="">
								<button type="button" class="sub-btn black-btn" id="confirmEmailBtn">메일인증 확인</button>
							</td>
						</tr>
						<tr>
							<th><span class="req">*</span>휴대전화 번호</th>
							<td>
								<input id="phoneNumber" name="phoneNumber" id="phoneNumber" readonly="readonly" type="text" value="<%= (String)request.getAttribute("tel") %>"><button type="button" class="sub-btn border-btn" data-ori-phone="010-3945-5334" id="phoneNumberChangeBtn">변경</button>
								<!-- <div class="input-wrap">
									<input type="checkbox" id="receiveSms" name="receiveSms" value="1">
									<label for="receiveSms">정보/이벤트 문자 수신에 동의합니다.</label>
								</div> -->
							</td>
						</tr>
						<tr class="auth-type AUTH hidden" id="numchange" style="display: none;">
							<!-- <th>인증방법 선택</th> -->
							<td>
								<!-- <div class="input-wrap">
									<input type="radio" id="a02" checked=""><label for="a02">휴대폰 본인인증</label>
								</div> -->
								<input type="text" id="newnum" value="" placeholder="- 없이 입력해 주세요">
								<button type="button" class="sub-btn black-btn" id="numconfirm">인증번호 전송</button>
								<div id="numchange2" style="display: none;" > 
								<input type="text" id="numcon" value="" placeholder="전송된 인증번호를 입력해 주세요">
								<button type="button" class="sub-btn black-btn" id="numconfirm2" style="display: none;">인증하기</button>
								
								</div>
							</td>
						</tr>
						<tr class="modify-address">
							<th><span class="req">*</span>주소</th>
							<input type="hidden" name="post" id="post" value="">
							<input type="hidden" name="newPost" id="newPost" value="">
							<td>
							<input type="text" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">
						<!-- <button type="button" class="border-btn" onclick="sample6_execDaumPostcode()">우편번호 검색</button> -->
						<button type="button" class="sub-btn border-btn" onclick="sample6_execDaumPostcode()">변경</button>
					<input type="text" name="sample6_address" id="sample6_address" value="<%= (String)request.getAttribute("add") %>" placeholder="주소"> 
						<input type="text" name="sample6_detailAddress" id="sample6_detailAddress"  placeholder="상세주소">
							<input type="text" id="sample6_extraAddress" placeholder="참고항목(공백가능)"> 
								<!-- <input type="text" name="address" id="address" value="" readonly="">
								<button type="button" class="sub-btn border-btn" onclick="openDaumPostcode();">변경</button>
								<input type="text" name="addressDetail" id="addressDetail" value=""> -->
							</td>
						</tr>
						<tr>
							<!-- <th>계정 연결정보</th>
							<td>
								<input type="text" value="카카오" disabled="">
							</td> -->
						</tr>
						<tr>
							<!-- <th>약관동의 현황</th>
							<td>
								<input type="checkbox" id="miAgreementFlag" name="miAgreementFlag" value="N">
								<label for="miAgreementFlag">(선택) 마케팅 제공 활용 동의<a href="/service/policy?policyType=6" class="link" target="_blank">전체보기</a></label>
							</td> -->
						</tr>
						</tbody>
					</table>
					<p class="require-notice">* 회원 정보 변경시 로그아웃 이후 정상적으로 반영됩니다.</p>
					<div class="btn-wrap large double">
						<button type="button" class="border-btn" onclick="rna.openLayerPopup('cancelUserChange')">취소</button>
						<button type="submit" class="black-btn" id="saveBtn">저장</button>
					</div>
				</div>
					<input type="hidden" id="receiveEmailDate" name="receiveEmailDate">
					<input type="hidden" id="receiveSMSDate" name="receiveSMSDate">
					<input type="hidden" id="miAgreementFlagDate" name="miAgreementFlagDate">
				<div>
<input type="hidden" name="_csrf" value="b426f3e4-befe-4b12-b8a9-16875a329522">
</div></form></div>
		</article>
	</div>
</section>


<script>
/* 새 이메일 눌렀을 때 -> 인증창 나오게 */
$(function(){
	 $('#emailChangeBtn').click(function(){
		
		 alert("버튼 클릭");
		 $("#emailhidden").css("display", "block"); 
		 $("#emailhidden2").css("display", "inline-block"); 
		 
		})
});


let authcode = "";
let useemail = "";

$(function(){
	 $('#emailAuthRequestBtn').click(function(){ // 버튼 클릭시 이메일 인증번호 전송하기
		
		 alert("버튼 클릭");
	 
		 useremail = $('#fakeEmail').val();
		 if( useremail == null || useremail == ""){
			 alert("메일 주소를 입력해 주세요!");
			 $("#fakeEmail").focus();
			 return false;
		 }
		 
		 if(useremail.match('@') ){
			 
			 let Email = $('#fakeEmail').val();
			 console.log(Email);
			 

			 $.ajax({
				url : "/Lush/member/idcheck.do",
				type : "GET",
				data : {userEmail : Email},
				async: false,
				dataType : "json",
				success : 
					function( certificationCode ){
					
					if(certificationCode != null ){
						alert('인증번호가 전송되었습니다!');
						
					// 인증번호를 입력해주세요 띄우기 
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


$(function(){
	 $('#confirmEmailBtn').click(function(){
		
		 alert("버튼 클릭");
		 
		 let usercode = $('#authNumber').val();
		 
		if(authcode == usercode){
			alert("인증되었습니다!");
			let realemail = $('#fakeEmail').val();
			 $("#emailhidden").css("display", "none"); 
			 $("#emailhidden2").css("display", "none"); 
		//	 이메일 -> 변경된 값으로 바꾸기 
			
			 $( '#realemail' ).attr( 'value', realemail);
		
		
		}
		
		if(usercode == null || usercode ==""){
			alert("인증번호를 입력하세요!");
		}
		
		if(authcode != usercode){
			alert("일치하지 않습니다");
		}
		
			 
		})
});

</script>

<script>
/* 핸드폰 인증 */
$(function(){
	 $('#phoneNumberChangeBtn').click(function(){
		
		 alert("버튼 클릭");
		 $("#numchange").css("display", "block"); 
		/*  $("#emailhidden2").css("display", "inline-block");  */
		 
		})
});




// 인증번호 인증하기 
let usernum = ""; // 새번호 
let sendnum = "";
$(function() {
	 $('#numconfirm').click(function(){	  // 번호 인증 클릭 시, 
		 
		 usernum  = $('#newnum').val(); // 새 번호 값 받아서 
		 // 밑에 번호 인증하는 것들 보이게 
		 $("#numchange2").css("display", "block"); 
		 
	 	console.log(usernum);
		 $.ajax({ // ajax 처리 
				url : "/Lush/member/smspass.do",
				type : "post",
				data : {usernum  : usernum },
				// async: false,
				dataType : "json",
				success : 
				function(  smsnum  ){ // sms 전송 문자 받으면,
					sendnum = smsnum;
					$('#numcon').focus();
					
					 $("#numconfirm2").css("display", "inline-block"); 
					
					
					/* if( smsnum == usernum){
						alert("인증되었습니다!");
						let realnum = $('#newnum').val();
						 $("#numchange").css("display", "none"); 
						 
					//	 이메일 -> 변경된 값으로 바꾸기 
						
						 $( '#phoneNumber' ).attr( 'value',  realnum);
						
					}else if( smsnum != usernum ){
						do{
							alert("번호가 일치하지 않습니다!");
							 $("#smsnum").focus();
						}while( susnum == usernum)
					 
					}// else if 
					 */
					
				}, // fuction
				error : function(){
					alert("서버요청실패");
				}
				})// ajax 
		 

			 
	   	});
		    
		    
		});
				 

// 인증번호 비교 
$(function(){
	 $('#numconfirm2').click(function(){
		numcon  = $('#numcon ').val(); 
		 
		 if(sendnum == numcon  ){
			 alert("인증되었습니다!");
			 // input 닫고 값 바꿔주기
			  
			 
			 $( '#phoneNumber' ).attr( 'value', usernum ) ;
			 $("#numchange").css("display", "none"); 
			 $("#numconfirm2").css("display", "none"); 
		 }
		
		})
});



</script>

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
</script>


</body>
</html>
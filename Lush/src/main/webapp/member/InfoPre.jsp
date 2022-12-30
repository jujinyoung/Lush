<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/InfoPre_style.css" rel="stylesheet" type="text/css">
<title>회원정보 변경 이전</title>
</head>
<body>

<section id="mypage-member" class="my-page" style="padding-top: 128px;">
    <div class="inner flex top">
        <!-- 마이페이지 좌측 메뉴 -->

        <!-- 마이페이지 우측 컨텐츠 영역 -->
        <article class="my-contents modify">
            <div class="mypage-top">
                <h2 class="mypage-title">회원정보 변경</h2>
            </div>
            <div class="auth-box">
                <p class="body1">회원님의 정보를 안전하게 보호하기 위해<br>계정을 재인증 해주세요.</p>
                <div class="btn-wrap">
                	<input type="text" id="phonenum" placeholder="- 를 제외한 숫자만 입력해 주세요" value="02-123-1234">
                    <button type="button" id="smsbutton" class="black-btn large-btn">휴대폰 인증</button>
                    </div>
            </div>
        </article>
    </div>
</section>

<div id="modal" class="modal">
	<div class="modal_content" title="클릭시 창이 닫힙니다">
	<button id="close" class="close">x</button>
	<input type="hidden" id="smsnum" class="smsnum" placeholder="인증번호를 입력해 주세요" value="1234">
	<input type="submit" id="smsmsend" class="smsmsend" value="인증번호 보내기">
	<input type="hidden" id="numsend" class="numsend" value="인증번호 인증">
	</div>
	</div>

<!-- * 
핸드폰 번호 입력 -> session id 값 불러와서 해당 id 와 전화번호가 일치하는지 판단 
-> 일치 -> 모달창 띄우기 -> 인증번호 보내기 버튼 보여주기 -> 버튼 누르면 -> 인증번호 보내기 -> 
인증번호 입력창 띄우기 -> 확인 눌러서 비교

-> 불일치 -> 핸드폰 번호가 일치하지 않습니다 팝업 띄우기 

 -->
<script>
$(function() {
    $('#close').click(function(){ // 모달창 x 
    	$("#modal").css("display", "none");
		 
   	});
    
    
});

let phonenum = "";

$(function() {
    $('#smsbutton').click(function(){ // 휴대폰 인증 클릭시
    	 alert("버튼 클릭");
    
    	 let phonenum = $('#phonenum').val();
		 console.log(phonenum );
		 
		 
		 $.ajax({ // ajax 처리 
				url : "/Lush/member/smspass.do",
				type : "GET",
				data : {phonenum : phonenum},
				async: false,
				dataType : "json",
				success : 
				function( result ){
					// 모달창 띄우기 
					 console.log(result );
					if( result == 0 ){
						
						alert(' 등록된 번호가 아닙니다!');
						$('#phonenum').focus();
						return false;
					}else if(result == 1){ // 정상적인 번호 
						$(".modal").css("display", "block");
					
					}// if 
				}, // fuction
				error : function(){
					alert("서버요청실패");
				}
				})// ajax 
		 
		 
		 
   	});
    
    
});

/*  인증번호 보내기 */
 
 $(function() {
	  $('#smsmsend').click(function(){ // 인증번호 보내기 
		  $("#smsnum").attr("type", "text");
		  $("#smsmsend").attr("type", "hidden");
			$("#numsend").attr("type", "submit");
			

			
	   	});
	    
	    
	});
			 
	  
	  
let usernum = "";
$(function() {
	 $('#numsend').click(function(){	  // 번호 인증 클릭 시, 
		 
		 usernum  = $('#smsnum').val();
	 	console.log(usernum);
		 $.ajax({ // ajax 처리 
				url : "/Lush/member/smspass.do",
				type : "post",
				// data : {phonenum : phonenum},
				// async: false,
				dataType : "json",
				success : 
				function(  smsnum  ){
					if( smsnum == usernum){
						alert("인증되었습니다!");
						/* $(location).attr('href', 'InfoChange.jsp'); */
						 let f = document.createElement('form');
						    f.setAttribute('method', 'get');
						    f.setAttribute('action', 'changeinfo.do');
						    document.body.appendChild(f);
						    f.submit();
					}else if( smsnum != usernum ){
						do{
							alert("번호가 일치하지 않습니다!");
							 $("#smsnum").focus();
						}while( susnum == usernum)
					 
					}// else if 
					
					
				}, // fuction
				error : function(){
					alert("서버요청실패");
				}
				})// ajax 
		 

			 
	   	});
		    
		    
		});
				 
		    
	  
	  
</script>





 <script>

 </script>

</body>
</html>
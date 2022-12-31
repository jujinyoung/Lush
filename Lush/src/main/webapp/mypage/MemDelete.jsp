<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/MemDelete_style.css" rel="stylesheet" type="text/css">
<title>러쉬 MYPAGE</title>
<link rel="icon" type="image/png" sizes="192x192"
	href="/Lush/images/ico/fabicon.png">
</head>
<body>
 <jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="mypage-member" class="my-page" style="padding-top: 128px;">
	<div class="inner flex top">
	<!-- 	<!-- 마이페이지 좌측 메뉴
		<article class="my-menu"> -->
		<jsp:include page="/mypage/mypageLeft.jsp"></jsp:include>
  <!--   <h2><a href="/mypage/index">마이페이지</a></h2>

    <div class="menu-box">
        <p class="body2">쇼핑정보</p>
        <ul>
            <li><a href="/mypage/order/1">주문/배송 조회</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">제품관리</p>
        <ul>
            <li><a href="/mypage/wishlist">찜 목록</a></li>
            <li><a href="/mypage/regular">정기배송 관리</a></li>
            <li><a href="/mypage/subscription">구독박스 관리</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">내 덕찌</p>
        <ul>
            <li><a href="/mypage/badge/2022">2022</a></li>
            <li><a href="/mypage/badge/2021">2021</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">스파</p>
        <ul>
            <li><a href="/mypage/order/2">스파 주문내역</a></li>
            <li><a href="/mypage/spaArrange">스파 예약현황</a></li>
            <li><a href="/mypage/spaManual">스파 이용안내</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">혜택관리</p>
        <ul>
            <li><a href="/mypage/benefit">혜택선물</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">고객센터</p>
        <ul>
            <li><a href="/mypage/noticeList">공지사항</a></li>
            <li><a href="/mypage/inquiry">1:1문의</a></li>
            <li><a href="/mypage/compliment">칭찬게시판</a></li>
            <li><a href="/mypage/faq">FAQ</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">회원정보</p>
        <ul>
            <li><a href="/mypage/user-modify">회원정보 변경</a></li>
            <li><a href="/mypage/user-leave">회원 탈퇴</a></li>
            <li><a href="/mypage/user-delivery">배송지 관리</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <a href="/mypage/plus-review" class="body2"><strong>나의 플러스 리뷰</strong></a>
    </div>
</article>
 -->

<!-- 마이페이지 좌측 메뉴 //-->

		<!-- 마이페이지 우측 컨텐츠 영역 -->
		<article class="my-contents withraw">
			<div class="mypage-top">
				<h2 class="mypage-title">회원 탈퇴</h2>
			</div>
			<div class="withraw-wrap">
				<p class="sub-title">1. 회원탈퇴 안내</p>
				<div class="guide">
					<p class="body1">
						러쉬코리아 탈퇴안내
						<br><br>
						불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
						<br><br>
						■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.<br>
						1. 회원 탈퇴 시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 관리 됩니다.<br>
						2. 탈퇴 시 회원님께서 보유하셨던 데이터는 삭제 됩니다<br>
					</p>
				</div>
				<p class="sub-title">2. 회원탈퇴 하기</p>
				<form id="leaveForm" action="/Lush/member/delete.do" method="post">
					<ul class="process">
						<li>
							<p class="th">탈퇴 사유</p>
							<div class="reason-box">
								<ul class="clear">
									<li>
										<input type="checkbox" id="r01" name="leaveReason" value="고객서비스(상담/포장 등) 불만"><label for="r01">고객서비스(상담,포장 등) 불만</label>
									</li>
									<li>
										<input type="checkbox" id="r02" name="leaveReason" value="배송 불만"><label for="r02">배송 불만</label>
									</li>
									<li>
										<input type="checkbox" id="r03" name="leaveReason" value="교환/환불/반품 불만"><label for="r03">교환/환불/반품 불만</label>
									</li>
									<li>
										<input type="checkbox" id="r04" name="leaveReason" value="방문 빈도가 낮음"><label for="r04">방문 빈도가 낮음</label>
									</li>
									<li>
										<input type="checkbox" id="r05" name="leaveReason" value="상품가격 불만"><label for="r05">상품가격 불만</label>
									</li>
									<li>
										<input type="checkbox" id="r06" name="leaveReason" value="개인정보 유출 우려"><label for="r06">개인정보 유출 우려</label>
									</li>
									<li>
										<input type="checkbox" id="r07" name="leaveReason" value="쇼핑몰의 신뢰도 불만"><label for="r07">쇼핑몰의 신뢰도 불만</label>
									</li>
								</ul>
							</div>
						</li>
						<li>
							<p class="th">남기실 말씀</p>
							<textarea id="leaveComment" name="leaveComment"></textarea>
						</li>
					</ul>
				<div><input type="hidden" name="_csrf" value="d2b5285f-d595-4142-a01e-1916a1e0d18f"></div></form>
				<div class="btn-wrap large double">
					<button type="button" class="border-btn" onclick="history.back();">이전으로</button>
					<button type="button" class="black-btn" id="userLeaveBtn">탈퇴</button>
				</div>
			</div>
		</article>
	</div>
</section>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
<script>


$(function(){
	 $('#userLeaveBtn').click(function(){
		 let f = document.createElement('form');
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', 'delete.do');
		    document.body.appendChild(f);
		    f.submit();
			 
		})
});




</script>
</body>
</html>
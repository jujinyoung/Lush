<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/mypageMain.css" type="text/css">
<%
      request.setCharacterEncoding("UTF-8");
      String contextPath = request.getContextPath();
      session.setAttribute("auth", "test1" );
%>


<!-- 마이페이지 좌측 메뉴 -->
<article class="my-menu">
	<h2>
		<a href="<%= contextPath %>/mypage/mypage.do" class="on">마이페이지</a>
	</h2>

	<div class="menu-box">
		<p class="body2">쇼핑정보</p>
		<ul>
			<li><a href="<%= contextPath %>/mypage/mypageorder.do">주문/배송 조회</a></li>
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
		<a href="/mypage/plus-review" class="body2"><strong>나의
				플러스 리뷰</strong></a>
	</div>
</article>

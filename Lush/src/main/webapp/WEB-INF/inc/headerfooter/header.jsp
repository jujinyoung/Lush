<%@ page import="member.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/Lush/css/header.css" type="text/css">
<%
      request.setCharacterEncoding("UTF-8");
      String contextPath = request.getContextPath();
	  User user = (User) request.getSession(false).getAttribute("authUser");
%>
<style>
a:visited, a:hover, a:active, a:focus {
	text-decoration: none;
}
</style>


<header id="header">
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PXRW4QX"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->


	<div class="top-banner" id="topBanner"
		style="background-color: #000000">
		<a href="/event/view/1068"><span style="font-size: 14.6667px;">말똥
				도넛 팝업스토어 OPEN! 방문 인증하고 선물 받기!</span></a>
	</div>

	<div class="header-wrap no-bor main-header">
		<div class="left-menu flex">
			<a href="/Lush/index.do" class="logo"><img
				src="/Lush/images/header/logo_christmas.gif" alt="lush 로고"></a>
			<nav>
				<ul class="flex left">
					<li class="open-menu"><a href="/Lush/categories/index.do?categoriesID=113"
						id="atag">제품</a>
						<div class="all-menu" id="all-menu">
							<div class="inner">
								<ul class="flex top">
									<li><a href="/Lush/categories/index.do?categoriesID=113" class="depth2"
										style="color:; font-size: 16px;">베스트</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=115"
												style="color:; font-size: 14px;">BEST 50</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=115143"
												style="color:; font-size: 14px;">주간 베스트</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=97"
												style="color:; font-size: 14px;">국내제조</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=195"
												style="color:; font-size: 14px;">네이키드</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=00201"
												style="color:; font-size: 14px;">러쉬 아트 큐레이션</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=88" class="depth2"
										style="color:; font-size: 16px;">신제품</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=224"
												style="color: #378b30; font-size: 14px;">크리스마스 기프트</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=231"
												style="color: #e74747; font-size: 14px;">크리스마스</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=225"
												style="color:; font-size: 14px;">배쓰 밤</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=202"
												style="color:; font-size: 14px;">캔들</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=2" class="depth2"
										style="color:; font-size: 16px;">배쓰</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=3"
												style="color:; font-size: 14px;">배쓰 밤</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=4"
												style="color:; font-size: 14px;">버블 바</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=5"
												style="color:; font-size: 14px;">배쓰 오일</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=6"
												style="color:; font-size: 14px;">펀</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=8" class="depth2"
										style="color: #000000; font-size: 16px;">샤워</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=9"
												style="color:; font-size: 14px;">솝</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=10"
												style="color:; font-size: 14px;">샤워 젤 & 젤리</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=123"
												style="color:; font-size: 14px;">샤워 밤</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=155"
												style="color:; font-size: 14px;">샤워 오일</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=11"
												style="color:; font-size: 14px;">보디 컨디셔너</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=12"
												style="color:; font-size: 14px;">스크럽 & 버터</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=14"
												style="color:; font-size: 14px;">펀</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=16" class="depth2"
										style="color: #000000; font-size: 16px;">보디</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=17"
												style="color:; font-size: 14px;">클렌저</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=18"
												style="color:; font-size: 14px;">로션</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=19"
												style="color:; font-size: 14px;">핸드 앤 풋</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=20"
												style="color:; font-size: 14px;">마사지 바</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=22"
												style="color:; font-size: 14px;">더스팅 파우더</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=26"
												style="color:; font-size: 14px;">쉐이빙 크림</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=37" class="depth2"
										style="color: #000000; font-size: 16px;">페이스</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=38"
												style="color:; font-size: 14px;">클렌저</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=41"
												style="color:; font-size: 14px;">페이스 마스크</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=39"
												style="color:; font-size: 14px;">토너</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=40"
												style="color:; font-size: 14px;">모이스춰라이저</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=42"
												style="color:; font-size: 14px;">립</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=43"
												style="color:; font-size: 14px;">쉐이빙 크림</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=29" class="depth2"
										style="color:; font-size: 16px;">헤어</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=30"
												style="color:; font-size: 14px;">샴푸 바</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=31"
												style="color:; font-size: 14px;">샴푸</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=32"
												style="color:; font-size: 14px;">드라이 샴푸</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=33"
												style="color:; font-size: 14px;">컨디셔너</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=34"
												style="color:; font-size: 14px;">트리트먼트</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=35"
												style="color:; font-size: 14px;">스타일링</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=49" class="depth2"
										style="color:; font-size: 16px;">메이크업</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=50"
												style="color:; font-size: 14px;">페이스 파우더</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=51"
												style="color:; font-size: 14px;">아이 메이크업</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=52"
												style="color:; font-size: 14px;">립</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=107"
												style="color:; font-size: 14px;">파운데이션</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=176"
												style="color:; font-size: 14px;">스킨 틴트</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=177"
												style="color:; font-size: 14px;">비건 브러쉬</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=56" class="depth2"
										style="color:; font-size: 16px;">퍼퓸</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=21"
												style="color:; font-size: 14px;">보디 스프레이</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=57"
												style="color:; font-size: 14px;">퍼퓸 라이브러리</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=58"
												style="color:; font-size: 14px;">코어 레인지</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=64"
												style="color:; font-size: 14px;">솔리드 퍼퓸</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=65"
												style="color:; font-size: 14px;">워시카드</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=66"
												style="color:; font-size: 14px;">퍼퓸 낫랩</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=69" class="depth2"
										style="color:; font-size: 16px;">기프트</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=144"
												style="color:; font-size: 14px;">기프트 베스트</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=117"
												style="color:; font-size: 14px;">1-3만원대</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=119"
												style="color:; font-size: 14px;">4-6만원대</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=121"
												style="color:; font-size: 14px;">7만원 이상</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=79"
												style="color:; font-size: 14px;">낫랩</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=81"
												style="color:; font-size: 14px;">스웨그</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=72"
												style="color:; font-size: 14px;">악세서리</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=71"
												style="color:; font-size: 14px;">북</a></li>
										</ul></li>
									<li><a href="/Lush/categories/index.do?categoriesID=214" class="depth2"
										style="color:; font-size: 16px;">비건</a>
										<ul class="depth3">
											<li><a href="/Lush/categories/index.do?categoriesID=215"
												style="color:; font-size: 14px;">배쓰</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=216"
												style="color:; font-size: 14px;">샤워</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=217"
												style="color:; font-size: 14px;">보디</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=218"
												style="color:; font-size: 14px;">페이스</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=219"
												style="color:; font-size: 14px;">헤어</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=220"
												style="color:; font-size: 14px;">메이크업</a></li>
											<li><a href="/Lush/categories/index.do?categoriesID=221"
												style="color:; font-size: 14px;">퍼퓸</a></li>
										</ul></li>
									<li><a href="javascript:void(0);" class="depth2"
										style="color: #000000; font-size: 16px;">신규서비스</a>
										<ul class="depth3">
											<li><a href="javascript:void(0);"
												style="color:; font-size: 14px;">선물하기</a></li>
										</ul></li>
								</ul>
							</div>
						</div></li>
					<li class="open-menu"><a href="/Lush/article/list.do"
						id="atag2">러쉬소개</a>

						<div class="all-menu type2" id="all-menu2">
							<div class="inner">
								<ul class="flex top">
									<li><a href="/service/introduction" class="depth2"
										style="color:; font-size: 16px;">러쉬 소개</a>
										<ul class="depth3">
											<li><a href="javascript:void(0);"
												style="color:; font-size: 14px;">러쉬역사</a></li>
											<li><a href="javascript:void(0);"
												style="color:; font-size: 14px;">이념과가치</a></li>
											<li><a href="javascript:void(0);"
												style="color:; font-size: 14px;">브랜드 정책</a></li>
											<li><a href="javascript:void(0);"
												style="color:; font-size: 14px;">러쉬로운 기부와 나눔</a></li>
											<li><a href="javascript:void(0);"
												style="color:; font-size: 14px;">러쉬로운 자원순환</a></li>
										</ul></li>
									<li><a href="/Lush/article/list.do" class="depth2"
										style="color:; font-size: 16px;">러쉬 이야기</a>
										<ul class="depth3">
											<li><a href="" style="color:; font-size: px;"></a></li>
										</ul></li>
									<li><a href="javascript:void(0);" class="depth2"
										style="color:; font-size: 16px;">채러티 팟</a>
										<ul class="depth3">
											<li><a href="" style="color:; font-size: px;"></a></li>
										</ul></li>
									<li><a href="javascript:void(0);" class="depth2"
										style="color:; font-size: 16px;">커뮤니티</a>
										<ul class="depth3">
											<li><a href="javascript:void(0);"
												style="color:; font-size: 14px;">젤러쉬</a></li>
											<li><a href="javascript:void(0);"
												style="color: 10; font-size: px;">덕찌</a></li>
										</ul></li>
									<li><a href="javascript:void(0);"
										class="depth2" style="color: #000000; font-size: 16px;">서명캠페인</a>
										<ul class="depth3">
											<li><a href="" style="color:; font-size: px;"></a></li>
										</ul></li>
									<li><a href="javascript:void(0);" class="depth2"
										style="color:; font-size: 16px;">기업선물</a>
										<ul class="depth3">
											<li><a href="" style="color:; font-size: px;"></a></li>
										</ul></li>
								</ul>
							</div>
						</div></li>
					<li><a href="/Lush/board/shop.do">매장안내</a></li>
					<li><a href="javascript:;">스파</a></li>
					<li><a href="/Lush/event/list.do">이벤트</a></li>
				</ul>
			</nav>
		</div>
		<div class="right-menu">
			<ul>
				<li><a href="/javascript:void(0);" class="short-live"><img
						src="/Lush/images/header/logo_live.png" alt="숏핑 라이브" width=""></a></li>
				<li><a href="javascript:;" class="search"><img
						src="/Lush/images/header/search.svg" alt="검색"></a></li>
				<li><a href="/Lush/mypage/mypageCart.do" class="basket"><img
						src="/Lush/images/header/bag.svg" alt="장바구니"><span
						class="basket-cnt" id="header_cart_quantity">0</span></a></li>
				<li class="open-menu" id="atag3"><a href="<%= contextPath %>/mypage/mypage.do"
					class="member"> <img src="/Lush/images/header/account.svg"
						alt="마이페이지">
				</a>
				<div class="small-menu" id="small-menu">
					<ul>
					<li>
						<c:choose>
							<c:when test="<%=user == null%>">
								<li><a href="/Lush/member/LoginMain.jsp">로그인</a></li>
								<li><a href="/Lush/member/SignUpPre.jsp">회원가입</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/Lush/member/logout.do">로그아웃</a></li>
								<li><a href="/Lush/mypage/mypage.do">마이페이지</a></li>
							</c:otherwise>
						</c:choose>

						<li><a href="/javascript:;">커뮤니티</a></li>
						<li><a href="/Lush/notice/list.do">고객센터</a></li>
						<li><a href="javascript:;">선물함<span id="commonGiftCount"></span></a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>

	<!-- 검색 영역 -->
	<div class="search-container">
		<div class="inner wide">
			<div class="search-box">
				<input type="text" id="mainSearchKeyword" name="mainSearchKeyword"
					placeholder=""
					onkeyup="if(window.event.keyCode==13){ $('#btn-main-search').trigger('click'); }">
				<button type="button" id="btn-main-search">
					<img src="/Lush/images/header/search.svg" width="40px"
						height="40px" alt="검색 버튼">
				</button>
			</div>
			<div class="search-sub flex top">
				<div class="search-popular">
					<h2>인기 검색어</h2>
					<div class="search-keyword">
						<a href="javascript:;">#더티바디</a> <a href="javascript:;">#핸드케어</a>
						<a href="javascript:;">#퍼퓸</a> <a href="javascript:;">#로션</a> <a
							href="javascript:;">#보디스프레이</a> <a href="javascript:;">#입욕제</a> <a
							href="javascript:;">#더티</a> <a href="javascript:;">#핸드크림</a> <a
							href="javascript:;">#케어</a> <a href="javascript:;">#버블바</a> <span>....</span>
					</div>
				</div>
				<div class="search-recently">
					<h2>최근 검색어</h2>
					<div class="search-recently-keyword">
						<a href="javascript:;">보디 인터갈락틱</a> <a href="javascript:;">보디</a>
						<a href="javascript:;">컨디셔너</a>
					</div>
				</div>
			</div>
			<button type="button" class="search-close-btn">
				<img src="/Lush/images/ico/ico_close_x.svg">
			</button>
		</div>
	</div>

</header>



<script type="text/javascript">
	(function(a, g, e, n, t) {
		a.enp = a.enp || function() {
			(a.enp.q = a.enp.q || []).push(arguments)
		};
		n = g.createElement(e);
		n.async = !0;
		n.defer = !0;
		n.src = "https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";
		t = g.getElementsByTagName(e)[0];
		t.parentNode.insertBefore(n, t)
	})(window, document, "script");
	enp('create', 'common', 'lush', {
		device : 'W'
	}); // W:웹, M: 모바일, B: 반응형
	enp('send', 'common', 'lush');
</script>

<script>
	$('#atag').hover(function() {
		$('#all-menu').css("display", "inline-block")
	}, (function() {
		$('#all-menu').css("display", "none")
	}));
	$('#all-menu').hover(function() {
		$('#all-menu').css("display", "inline-block")
	}, (function() {
		$('#all-menu').css("display", "none")
	}));

	$('#atag2').hover(function() {
		$('#all-menu2').css("display", "inline-block")
	}, (function() {
		$('#all-menu2').css("display", "none")
	}));
	$('#all-menu2').hover(function() {
		$('#all-menu2').css("display", "inline-block")
	}, (function() {
		$('#all-menu2').css("display", "none")
	}));

	$('#atag3').hover(function() {
		$('#small-menu').css("display", "inline-block")
	}, (function() {
		$('#small-menu').css("display", "none")
	}));
	$('#small-menu').hover(function() {
		$('#small-menu').css("display", "inline-block")
	}, (function() {
		$('#small-menu').css("display", "none")
	}));
</script>

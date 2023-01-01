<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>러쉬코리아</title>
<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
<link href="../inquiry/css/reset.css" type="text/css" rel="stylesheet">
<link href="../inquiry/css/layout.css" type="text/css" rel="stylesheet">
<link href="../inquiry/css/style.css" type="text/css" rel="stylesheet">
<style>

</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>

<section id="mypage-cs" class="my-page" style="padding-top:128px;">
	<div class="inner flex top">
		<!-- 마이페이지 좌측 메뉴 -->
		<article class="my-menu">
    <h2><a href="/mypage/index">마이페이지</a></h2>

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
            <li><a href="/Lush/notice/list.do">공지사항</a></li>
            <li><a href="/Lush/inquiry/list.do">1:1문의</a></li>
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


<!-- 마이페이지 좌측 메뉴 //-->

		<!-- 마이페이지 우측 컨텐츠 영역 -->
		<article class="my-contents notice">
			<div class="mypage-top">
				<h2 class="mypage-title">공지사항</h2>
			</div>
			<div>
				<div class="tab-cont">
					<!-- read page -->
					<div class="tab-inner on">
						<table class="list-table read">
							<colgroup>
								<col width="166px">
								<col width="auto">
							</colgroup>
							<thead>
							<tr>
								<th>제목</th>
								<td>
									<strong>${viewContent.rec_title}</strong>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>
									${viewContent.rec_writer }</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>
									${viewContent.rec_date }</td>
							</tr>
							<tr>
								<th>조회수</th>
								<td>
									${viewContent.rec_hits }</td>
							</tr>
							</thead>
							<tbody>
							<tr>
								<td colspan="2">
									<div class="board-contents">
										<p style="word-wrap: break-word">
										${fn:replace(viewContent.rec_content, newLineChar, "<br> ")}
  
									</div>
								</td>
							</tr>
							</tbody>
						</table>
						<div class="btn-wrap right medium">
							<a href="/Lush/notice/list2.do" class="border-btn">목록</a>
						</div>
					</div>
					<!-- read page //-->
				</div>
			</div>
		</article>
	</div>
</section>

<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

</body>
</html>
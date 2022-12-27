<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>러쉬코리아</title>
<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
<link href="css/reset.css" type="text/css" rel="stylesheet">
<link href="css/layout.css" type="text/css" rel="stylesheet">
<link href="css/style.css" type="text/css" rel="stylesheet">
<style>
.inquiry-read .read-table table td .inq-answer-date {color:#757575;display:block;margin-top:16px;}
</style>
</head>
<body>
<!--  <form id="searchParam" action="" method="get"> -->
<section id="mypage-inquiry" class="my-page">
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
            <li><a href="/mypage/noticeList">공지사항</a></li>
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
		<article class="my-contents inquiry">
			<div class="mypage-top">
				<h2 class="mypage-title">1:1 문의</h2>
			</div>
			<div class="inquiry-read">
				<div class="read-table">
					<p>LUSH에 궁금한 내용을 등록해 주세요. 담당자가 확인 후 빠르게 답변해 드리겠습니다.</p>
					<table class="list-table dark">
						<colgroup>
							<col width="208px">
							<col width="auto">
						</colgroup>
						<tbody>
							<tr>
								<th>카테고리</th>
								<td>
									<strong class="cate">
									<c:choose>
										<c:when test="${ viewContent.q_category eq 1}">상품</c:when>
										<c:when test="${ viewContent.q_category eq 2}">주문/결제</c:when>
										<c:when test="${ viewContent.q_category eq 3}">오프라인</c:when>
										<c:when test="${ viewContent.q_category eq 4}">배송</c:when>
										<c:when test="${ viewContent.q_category eq 5}">배송지연</c:when>
										<c:when test="${ viewContent.q_category eq 6}">교환/취소/반품</c:when>
										<c:when test="${ viewContent.q_category eq 7}">회원정보</c:when>
										<c:otherwise>기타</c:otherwise>
									</c:choose>
									</strong>
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<p class="body1">${viewContent.q_title}</p>
								</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>
									<p class="body1">${ viewContent.q_date }</p>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<div class="inq-cont">
									${ viewContent.q_content }
									</div>
									<!-- <div class="inq-image">
										</div> -->
								</td>
							</tr>
							
							<!-- 답변 -->
							 <c:choose>
							 <c:when test="${viewContent.q_answer eq null}">
							<tr style="display:none">
								<th><img src="../images/ico/user_x72.png"></th>
								<td>
									<div class="inq-answer">
										<span style="word-wrap: break-word"></span>
										<p class="inq-answer-date"></p>
									</div>
								</td>
							</tr></c:when>
							<c:otherwise>
							<tr>
								<th><img src="../images/ico/user_x72.png"></th>
								<td>
									<div class="inq-answer">
										<span style="word-wrap: break-word">${ viewContent.q_answer }</span>
										<p class="inq-answer-date"></p>
									</div>
								</td>
							</c:otherwise>
							</c:choose>
							</tbody>
					</table>
				</div>
				<div class="btn-wrap large center">
					<a href="/Lush/inquiry/list.do" class="black-btn">목록</a>
				</div>
			</div>
		</article></div>
		</section>
		<!-- </form> -->

</body>
</html>
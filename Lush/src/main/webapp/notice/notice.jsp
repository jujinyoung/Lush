<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러쉬 공지사항</title>
<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
<link href="../inquiry/css/reset.css" type="text/css" rel="stylesheet">
<link href="../inquiry/css/layout.css" type="text/css" rel="stylesheet">
<link href="../inquiry/css/style.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>

</style>
</head>
<body id="a">
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
		<article class="my-contents notice">
			<div class="mypage-top">
				<h2 class="mypage-title">공지사항</h2>
			</div>
			<div class="tab-table-wrap">
				<ul class="tab-btn left" id="tabList">
					<li id="default" ><a href="/Lush/notice/list.do" data-tab="1" class="tabmenu on">공지사항</a></li>
					<li><a href="/Lush/notice/list2.do" data-tab="2" class="tabmenu" >직원채용</a></li>
				</ul>

				<div class="tab-cont">
					<!-- 공지사항 페이지 -->
						<div class="tab-inner notice on" id="noticeList_1">
							<table class="list-table notice-table" id="tabcontent">
								<colgroup>
									<col width="100px">
									<col width="auto">
									<col width="130px">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>

				<c:choose>
					<c:when test="${ not empty notices }">

						<c:forEach items="${ notices }" var="dto">
							<c:choose>
								<c:when test="${dto.n_num eq 1}">
									<tr class="fix">
										<td>공지</td>
										<td><a
											href="/Lush/notice/view.do?n_nid=${dto.n_nid}">${dto.n_title}</a></td>
										<td>${dto.n_date}</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td>${dto.n_nid}</td>
										<td><a
											href="/Lush/notice/view.do?n_nid=${dto.n_nid}">${dto.n_title}</a></td>
										<td>${dto.n_date}</td>
									</tr>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</c:when>
				</c:choose>
								</tbody>

							</table>

						</div>
						<!-- 공지사항 페이지 //-->


					<!-- 직원채용 페이지 -->
					<div class="tab-inner recruit" id="noticeList_2">
						
						</div>
					<!-- 직원채용 페이지 //-->
				</div>
			</div>
		</article>
	</div>
</section>


<script>
/*$(function() {

	$('.tabmenu').click(function() {

		$('ul.tab-btn li a').removeClass("on");
		$(this).addClass("on");
 		$("table").remove("#tabcontent");
		$.ajax({
			type : 'GET',                 
			url : "/Lush/notice/list2.json",  
			data: 	JSON.stringify(jsonArray), 
			dataType : "json", 
			error : function() {         
				alert('통신실패!');
			},
			success : function(data) {
				 $("#noticeList_2 table.list-table").html("<thead><tr><th>번호</th><th>제목</th><th>날짜</th></tr></thead>");
                 var show = "";
				
				$.each(data, function(index, item){
					show += "<tbody><tr><td>"+item.rec_id+"</td>";
					show += "<td>"+item.rec_title+"</td>";
					show += "<td>날짜</td>";
				});
				$("#noticeList_2 table.list-table").append(show);
			}
		});
	});
	$('#default').click(function() {
		$(location).attr("href", "/Lush/notice/list.do");
	});          
});
*/
</script>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
</body>
</html>
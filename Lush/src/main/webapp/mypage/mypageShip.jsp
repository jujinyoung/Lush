<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2022. 12. 27. 오후 9:41:31</title>
<link rel="stylesheet" type="text/css" href="css/mypageShip.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

<!-- HEADER -->
<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<!-- HEADER // -->

	<section id="mypage-od" class="my-page" style="padding-top: 128px;">
		<div class="inner flex top">

			<!-- 마이페이지 좌측 컨텐츠 영역 -->
			<jsp:include page="/mypage/mypageLeft.jsp"></jsp:include>
			<!-- 마이페이지 좌측 컨텐츠 영역 //-->

			<!-- 마이페이지 우측 컨텐츠 영역 -->
			<article class="my-contents">
				<div class="mypage-top">
					<h2 class="mypage-title">배송지 관리</h2>
				</div>
				<div class="new-contents">
					<div class="destination">
						<div class="table-wrap">
							<div class="table-top">
								<p>※ 주문시 기본 배송지로 자동 설정됩니다.</p>
							</div>
							<table class="list-table border">
								<colgroup>
									<col width="136px">
									<col width="112px">
									<col width="auto">
									<col width="84px">
									<col width="120px">
									<col width="120px">
									<col width="120px">
								</colgroup>
								<thead>
									<tr>
										<th>설정</th>
										<th>배송지명</th>
										<th>주소</th>
										<th>받으실 분</th>
										<th>전화번호</th>
										<th>휴대전화번호</th>
										<th>수정/삭제</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>기본 배송지</td>
										<td>본가</td>
										<td class="left"><span class="user-delivery-address">서울
												양천구 목동서로 70 (목동신시가지아파트2단지)</span>224동 203호</td>
										<td>권재현</td>
										<td>-</td>
										<td>010-7188-7396</td>
										<td><a
											href="/mypage/user-delivery-form?userDeliveryId=110227">수정</a>
										</td>
									</tr>
									<tr>
										<td><button type="button"
												onclick="setDefaultAddr('110231');"
												class="border-btn small-btn">기본 배송지로 설정</button></td>
										<td>본가1</td>
										<td class="left"><span class="user-delivery-address">서울
												양천구 목동서로 70 (목동신시가지아파트2단지)</span>224동 203호</td>
										<td>권재현1</td>
										<td>-</td>
										<td>010-7188-7396</td>
										<td><a
											href="/mypage/user-delivery-form?userDeliveryId=110231">수정</a>
											<a href="javascript:void(0);"
											onclick="deleteAction('110231', '본가1')">삭제</a></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="7">
											<div class="btn-wrap xsmall right">
												<a href="/mypage/user-delivery-form" class="black-btn">배송지
													추가</a>
											</div>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</article>
			<!-- 마이페이지 우측 영역 // -->
			
		</div>
	</section>

	<!-- FOOTER -->
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
<!-- FOOTER // -->

<script>

</script>
</body>
</html>
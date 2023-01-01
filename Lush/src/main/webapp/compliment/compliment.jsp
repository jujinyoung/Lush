<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러쉬코리아</title>
<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
<link href="../inquiry/css/reset.css" type="text/css" rel="stylesheet">
<link href="../inquiry/css/layout.css" type="text/css" rel="stylesheet">
<link href="../inquiry/css/style.css" type="text/css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="mypage-compliment" class="my-page" style="padding-top:128px;">
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
            <li><a href="/mypage/badge/2023">2023</a></li>
            <li><a href="/mypage/badge/2022">2022</a></li>
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
		<article class="my-contents compliment">
			<div class="mypage-top">
				<h2 class="mypage-title">칭찬 게시판</h2>
				<p class="summary">

				</p>
			</div>
			<div class="comp-top">
				<form id="complimentSearchForm" method="get">
				<input type="hidden" name="page" value="0">
				<ul class="board-search-wrap">
					<li>
						<input type="radio" id="s1" name="where" value="STORE_NAME" checked>
						<label for="s1">매장명</label>
						<input type="radio" id="s2" name="where" value="STAFF_NAME" >
						<label for="s2">직원명</label>
					</li>
					<li>
						<input type="text" name="query" value="">
					</li>
					<li>
						<button type="submit" class="border-btn">검색</button>
					</li>
				</ul>
				<div class="btn-wrap medium right">
					<button type="button" class="open-button black-btn">등록하기</button>
				</div>
				</form>
			</div>

			<div class="comp-table">
				<table class="list-table toggle-box type2">
					<colgroup>
						<col width="90px">
						<col width="208px">
						<col width="288px">
						<col width="128px">
						<col width="auto">
						<col width="104px">
					</colgroup>
					<thead>
					<tr>
						<th>카테고리</th>
						<th>평점</th>
						<th>매장</th>
						<th>담당직원</th>
						<th>작성자</th>
						<th>날짜</th>
					</tr>
					</thead>
					<tbody>
					<!-- 칭찬하기 리스트  -->
						<tr>
								<td>매장추천</td>
								<td>
								<img src="/content/renewal/pc/images/ico/stars4.svg" height="11px" alt="별점 4점">
									</td>
								<td><a href="javascript:;" class="toggle-btn">가로수길</a></td>
								<td><p>-</p></td>
								<td>김*연</td>
								<td>2022-12-10</td>
							</tr>
							<tr class="toggle-hidden on">
								<td colspan="6">
									<div class="hidden-cont">
										<div>
											<ul class="question-box">
													<li>질문1</li>
													<li>
														<img src="/content/renewal/pc/images/ico/stars4.svg">
														</li>
													<li>매장에 방문했을 때, 직원들이 밝은 맞이 인사로 친절하게 다가왔나요?</li>
												</ul>
												<ul class="question-box">
													<li>질문2</li>
													<li>
														<img src="/content/renewal/pc/images/ico/stars5.svg">
														</li>
													<li>원하는 제품을 찾기 위해 직원의 질문은 적절했나요?</li>
												</ul>
												<ul class="question-box">
													<li>질문3</li>
													<li>
														<img src="/content/renewal/pc/images/ico/stars4.svg">
														</li>
													<li>고객님의 이야기를 경청해준 후 제품을 추천해 주었나요?</li>
												</ul>
												<ul class="question-box">
													<li>질문4</li>
													<li>
														<img src="/content/renewal/pc/images/ico/stars4.svg">
														</li>
													<li>다양한 제품 소개와 함께 테스터를 경험하셨나요?</li>
												</ul>
												<ul class="question-box">
													<li>질문5</li>
													<li>
														<img src="/content/renewal/pc/images/ico/stars5.svg">
														</li>
													<li>직원과의 시간은 만족스러웠나요?</li>
												</ul>
												<ul class="question-box">
													<li>질문6</li>
													<li>
														<img src="/content/renewal/pc/images/ico/stars4.svg">
														</li>
													<li>다음에 다시 이 매장을 방문하거나, 주변 사람들에게 추천할 의향이 있나요? </li>
												</ul>
												<ul class="question-box">
													<li>질문7</li>
													<li>
														</li>
													<li>직원과의 응대 과정을 상세히 남겨주시면, 동일한 서비스 제공을 위해 노력하겠습니다!</li>
												</ul>
												<div class="comp-contents">
														.</div>
												<ul class="question-box">
													<li>질문8</li>
													<li>
														<img src="/content/renewal/pc/images/ico/stars4.svg">
														</li>
													<li>오늘도 향기로운 하루 보내세요! :)</li>
												</ul>
												</div>
										<ul class="admin-answer flex">
											<li class="ico"><img src="/content/renewal/pc/images/dummy/user_x72.png" alt="관리자 아이콘" /></li>
											<li class="answer"><p>안녕하세요, 고객님<br>러쉬코리아 입니다.&nbsp;<br><br>소중한 평가를 남겨주셔서 감사합니다.&nbsp;<br>&nbsp;</p><div>앞으로도 계속 러쉬를 사랑하시는 고객 한 분 한 분에게 만족을 드릴 수 있는 러쉬코리아가 되도록 노력 하겠습니다.</div><div><br></div><div>이용해 주셔서 감사합니다.</div><div>오늘도 좋은 하루 보내세요!</div><div><br></div><div>러쉬코리아 드림</div><p>&nbsp;</p></li>
											<li>2022-12-12</li>
										</ul>
										</div>
								</td>
							</tr>
					</tbody>
			</table>

			</div>
		</article>
	</div>
</section>

<script>

	var praiseEvalList = new Array();

	
		praiseEvalList.push({
			index : 1
			,evalType : "GPA"
			,evalQust : "매장에 방문했을 때, 직원들이 밝은 맞이 인사로 친절하게 다가왔나요?"
		});
	
		praiseEvalList.push({
			index : 2
			,evalType : "GPA"
			,evalQust : "원하는 제품을 찾기 위해 직원의 질문은 적절했나요?"
		});
	
		praiseEvalList.push({
			index : 3
			,evalType : "GPA"
			,evalQust : "고객님의 이야기를 경청해준 후 제품을 추천해 주었나요?"
		});
	
		praiseEvalList.push({
			index : 4
			,evalType : "GPA"
			,evalQust : "다양한 제품 소개와 함께 테스터를 경험하셨나요?"
		});
	
		praiseEvalList.push({
			index : 5
			,evalType : "GPA"
			,evalQust : "직원과의 시간은 만족스러웠나요?"
		});
	
	praiseEvalList.push({
		index : 6
		,evalType : "GPA"
		,evalQust : "다음에 다시 이 매장을 방문하거나, 주변 사람들에게 추천할 의향이 있나요? "
	});
	
	praiseEvalList.push({
		index : 7
		,evalType : "WYS"
		,evalQust : "직원과의 응대 과정을 상세히 남겨주시면, 동일한 서비스 제공을 위해 노력하겠습니다!"
	});
	
	praiseEvalList.push({
		index : 8
		,evalType : "GPA"
		,evalQust : "오늘도 향기로운 하루 보내세요! :)"
	});
	

	$(document).ready(function() {

		$("#subjectTypeList > li").click(function() {
			console.log($(this))
			if ($(this).data("subjectId") == "STAFF") {
				$("#staffReq").show();
			} else {
				$("#staffReq").hide();
			}
		})

		var html = "";

		// 칭찬게시판 등록 팝업 질문 마크업 생성
		$.each(praiseEvalList, function(i, d) {

			if (d.evalType == "GPA") {
				html += '<tr class="q-tr">';
				html += '	<input type="hidden" name="evalType' + d.index + '" value="' + d.evalType + '">';
				html += '	<input type="hidden" name="evalQust' + d.index + '" value="' + d.evalQust + '">';
				html += '	<input type="hidden" name="evalGpa' + d.index + '" value="">';
				html += '	<th>질문' +  (i + 1) + '</th>';
				html += '	<td>';
				html += '		<p class="q-grade">' + d.evalQust + '</p>';
				html += '		<div class="grade-box">';
				html += '			<button type="button" class="star"></button>';
				html += '			<button type="button" class="star"></button>';
				html += '			<button type="button" class="star"></button>';
				html += '			<button type="button" class="star"></button>';
				html += '			<button type="button" class="star"></button>';
				html += '		</div>';
				html += '	</td>';
				html += '</tr>';
			} else {
				html += '<tr class="q-tr">';
				html += '	<input type="hidden" name="evalType' + d.index + '" value="' + d.evalType + '">';
				html += '	<input type="hidden" name="evalQust' + d.index + '" value="' + d.evalQust + '">';
				html += '	<th>질문' +  (i + 1) + '</th>';
				html += '	<td>';
				html += '		<p class="q-grade">' + d.evalQust + '</p>';
				html += '		<textarea name="evalWrite' + d.index + '" placeholder="내용을 입력하세요."></textarea>';
				html += '	</td>';
				html += '</tr>';
			}
		});
		$("#complimentQuestionBody").append(html);
	/*	$("#visitDate").datepicker();*/

		$('#visitDate').datepicker({
			dateFormat: "yy-mm-dd",
		//  changeMonth: true,
			maxDate: 0, // 오늘 이후 날짜 선택 불가
			onClose: function( selectedDate ) {
			}
		});

		// 별점 이벤트
		$(".grade-box button").on("click",function(){
			var stars = $(this).index();
			var gradeBox = $(this).closest(".grade-box")

			gradeBox.find("button").each(function(){
				if ( $(this).index() <= stars) {
					$(this).addClass("on");
				} else{
					$(this).removeClass("on");
				}
			});

			$(this).closest(".q-tr").find("[name*=evalGpa]").val(stars + 1);
		});
	});

	function insertComplimentBtn() {
		var $body = $("#complimentQuestionBody");
		var writeValidator = false;
		var gradeValidator = false;

		// 카테고리 세팅
		var subjectTypeText = $("#subjectTypeText").text();
		var $subjectType = $("#subjectTypeList > li:contains(" + subjectTypeText + ")");
		$body.find("[name=subjectType]").val($subjectType.data("subjectId"));

		// 매장 세팅
		var storeText = $("#storeText").text();
		var $storeInfo = $("#storeList > li:contains(" + storeText + ")");
		$body.find("[name=storeCode]").val($storeInfo.data("storeId"));
		$body.find("[name=storeName]").val($storeInfo.text());

		if (!$body.find("[name=subjectType]").val().trim()) {
			alert("카테고리를 선택하세요");
			return false;
		}

		if (!$body.find("[name=storeCode]").val().trim() || !$body.find("[name=storeName]").val().trim()) {
			alert("매장을 선택하세요");
			return false;
		}

		if (!$body.find("[name=visitDate]").val().trim()) {
			alert("방문일을 선택 하세요");
			return false;
		}

		if ($body.find("[name=subjectType]").val() == "STAFF") {

			if (!$body.find("[name=staffName]").val().trim()) {
				alert("담당직원명을 입력해주세요.");
				return false;
			}
		}

		if ($("[name*=evalWrite]").length > 0) {
			for (var i = 0; i < $("[name*=evalWrite]").length; i++) {

				if (!$("[name*=evalWrite]")[i].value.trim()) {
					writeValidator = true;
					break;
				}
			}

			if (writeValidator) {
				alert("질문에 답해주세요.");
				return false;
			}
		}

		if ($("div.grade-box").length > 0) {
			for (var i = 0; i < $("div.grade-box").length; i++) {

				if ($("div.grade-box:eq(" + i + ")").find("button.star.on").length == 0) {
					gradeValidator = true;
					break;
				}
			}

			if (gradeValidator) {
				alert("별점을 입력해 주세요.");
				return false;
			}
		}

		$("#complimentBtn").hide();
		// 등록
		$.post("/mypage/compliment/create",$("#complimentForm").serialize(),function(res) {

			if (res.isSuccess) {
				$("#complimentCompletePop button").click(function() {
					$("#complimentSearchForm").submit();

				});
				rna.openLayerPopup("complimentCompletePop");
			} else {
				alert(res.errorMessage);
			}
		})

	}

	function resetComplimentForm() {
		$("#subjectTypeList li:eq(0)").click();
		$("#storeList li:eq(0)").click();
		$("#complimentForm .star").removeClass("on");
		formReset('complimentForm');
	}

</script>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
<div class="dimmed" id="dimmedArea">
	<!-- 칭찬게시판 작성 -->
<div class="popup big comp-write" id="complimentPop">
    <div class="pop-head">
        <h2 class="big">칭찬게시판</h2>
    </div>
    <div class="pop-content">
        <form id="complimentForm" method="post" action="">
        <table class="no-border-table">
            <colgroup>
                <col width="122px">
                <col width="auto">
            </colgroup>
            <tbody id="complimentQuestionBody">
                <tr>
                    <th>카테고리</th>
                    <td>
                        <div class="select-box long">
                            <input type="hidden" name="subjectType" value="">
                            <a href="javascript:;" id="subjectTypeText" class="selected-value">선택해주세요</a>
                            <ul id="subjectTypeList" class="option-box">
                                <li>선택해주세요</li>
                                <li data-subject-id="STORE">매장추천</li>
                                <li data-subject-id="STAFF">직원칭찬</li>
                                </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>매장</th>
                    <td>
                        <div class="select-box long">
                            <input type="hidden" name="storeCode" value="">
                            <input type="hidden" name="storeName" value="">
                            <a href="javascript:;" id="storeText" class="selected-value">선택해주세요</a>
                            <ul id="storeList" class="option-box">
                                <li>선택해주세요</li>
                                <li data-store-id="0001">가로수길</li>
                                <li data-store-id="0002">강남역</li>
                                <li data-store-id="0003">경리단길</li>
                                <li data-store-id="0004">경리단길 스파</li>
                                <li data-store-id="0005">대학로</li>
                                <li data-store-id="0006">롯데광복</li>
                                <li data-store-id="0007">롯데광주</li>
                                <li data-store-id="0008">롯데구리</li>
                                <li data-store-id="0009">롯데김포공항</li>
                                <li data-store-id="0010">롯데노원</li>
                                <li data-store-id="0011">롯데대구</li>
                                <li data-store-id="0012">롯데대전</li>
                                <li data-store-id="0013">롯데동탄</li>
                                <li data-store-id="0014">롯데몰수지</li>
                                <li data-store-id="0015">롯데미아</li>
                                <li data-store-id="0016">롯데본점</li>
                                <li data-store-id="0017">롯데부산본점</li>
                                <li data-store-id="0018">롯데분당</li>
                                <li data-store-id="0019">롯데수원</li>
                                <li data-store-id="0020">롯데영등포</li>
                                <li data-store-id="0021">롯데울산</li>
                                <li data-store-id="0022">롯데월드몰</li>
                                <li data-store-id="0023">롯데일산</li>
                                <li data-store-id="0024">롯데잠실</li>
                                <li data-store-id="0025">롯데전주</li>
                                <li data-store-id="0026">롯데중동</li>
                                <li data-store-id="0027">롯데창원</li>
                                <li data-store-id="0028">롯데청량리</li>
                                <li data-store-id="0029">롯데평촌</li>
                                <li data-store-id="0030">롯데인천</li>
                                <li data-store-id="0031">명동역</li>
                                <li data-store-id="0032">스타필드 고양</li>
                                <li data-store-id="0033">스타필드 코엑스</li>
                                <li data-store-id="0034">스타필드 하남</li>
                                <li data-store-id="0035">스타필드 안성</li>
                                <li data-store-id="0036">타임스트림</li>
                                <li data-store-id="0037">신세계강남</li>
                                <li data-store-id="0038">신세계광주</li>
                                <li data-store-id="0039">신세계김해</li>
                                <li data-store-id="0040">신세계동대구</li>
                                <li data-store-id="0041">신세계마산</li>
                                <li data-store-id="0042">신세계본점</li>
                                <li data-store-id="0043">신세계센텀몰</li>
                                <li data-store-id="0044">신세계대전</li>
                                <li data-store-id="0045">신세계의정부</li>
                                <li data-store-id="0046">신세계천안아산</li>
                                <li data-store-id="0047">AK분당</li>
                                <li data-store-id="0048">AK수원</li>
                                <li data-store-id="0049">압구정 1호</li>
                                <li data-store-id="0050">압구정 스파</li>
                                <li data-store-id="0051">여의도 IFC</li>
                                <li data-store-id="0052">이태원역</li>
                                <li data-store-id="0053">타임스퀘어</li>
                                <li data-store-id="0054">갤러리아 타임월드</li>
                                <li data-store-id="0055">현대대구</li>
                                <li data-store-id="0056">현대디큐브</li>
                                <li data-store-id="0057">현대목동</li>
                                <li data-store-id="0058">현대미아</li>
                                <li data-store-id="0059">현대본점</li>
                                <li data-store-id="0060">현대송도</li>
                                <li data-store-id="0061">현대신촌</li>
                                <li data-store-id="0062">현대울산</li>
                                <li data-store-id="0063">현대중동</li>
                                <li data-store-id="0064">현대충청</li>
                                <li data-store-id="0065">현대판교</li>
                                <li data-store-id="0066">홍대</li>
                                <li data-store-id="0067">롯데강남</li>
                                </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>방문일</th>
                    <td><input type="text" id="visitDate" name="visitDate" class="calendar"></td>
                </tr>
                <tr>
                    <th><span class="req" id="staffReq" style="display: none;">*</span>담당직원</th>
                    <td><input type="text" id="staffName" name="staffName" value=""></td>
                </tr>
            </tbody>
        </table>
        </form>
    </div>
    <div class="btn-wrap vary">
        <button type="button" class="border-btn pop-close">취소</button>
        <button type="button" class="black-btn"   id="complimentBtn" onclick="insertComplimentBtn();">등록하기</button>
    </div>

    <button type="button" class="pop-close popup-close-btn">팝업닫기</button>
</div>

<!-- 칭찬게시판 게시글 등록확인-->
<div class="popup comp-complete" id="complimentCompletePop">
    <div class="pop-head">
        <h2 class="small center">게시글 등록</h2>
    </div>
    <div class="pop-content">
        <p class="body1">게시글이 등록되었습니다.</p>
    </div>
    <div class="btn-wrap basic">
        <button type="button" class="black-btn">확인</button>
    </div>
    <button type="button" class="pop-close popup-close-btn">팝업닫기</button>
</div>
</div>

<script>
$("button.open-button").click( function (){
	$("#dimmedArea").attr('class', 'dimmed on');
	$("#complimentPop").attr('style', "display:block;");
});

$("button.border-btn.pop-close").click(function(){
	$("#dimmedArea").attr('class', 'dimmed');
	$("#complimentPop").attr('style', "display:none;");

}); 

</script>
</body>
</html>
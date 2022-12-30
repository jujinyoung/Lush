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
.files td .file-btn span { display: inline-block; height: 26px; background: url(../../images/ico/camera_black.svg) no-repeat center left; padding-left: 40px; cursor: pointer;text-decoration: underline;color:#535353;}
</style>
</head>
<body>
 
<section id="mypage-inquiry-write" class="my-page">
<form id="qna" action="" method="post" enctype="application/x-www-form-urlencoded">
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
			<div class="inquiry-write">
				<div class="write-table">
					<p>LUSH에 궁금한 내용을 등록해 주세요. 담당자가 확인 후 빠르게 답변해 드리겠습니다.</p>
			
			<table class="list-table dark">
				<colgroup>
					<col width="208px">
					<col width="auto">
				</colgroup>
				<tbody>
					<tr>
						<th>카테고리</th>
						<td><select id="qnaGroup" name="q_category" title="셀렉트박스"
							class="select-box long">
								<option value="0" selected="selected">선택해주세요</option>
								<c:if test="${ not empty clist }">
									<c:forEach items="${clist}" var="dto">
										<option value="${ dto.qc_id }">${ dto.qc_cname }</option>
									</c:forEach>
								</c:if>
							</select> 
							 </td>
									</tr>
									<tr>
						<th>제목</th>
						<td><input id="subject" name="q_title"
							placeholder="제목을 입력하세요" type="text"
							oninput="handleOnInput(this, 30)" autocomplete="off" /></td>
					</tr>
					<tr>
					
						<th>작성자</th>
						<td><input id="userName" name="me_name" title="작성자"
							type="text" value="${param.me_name}" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea id="question" name="q_content" title="내용"
								rows="10" cols="30"></textarea></td>
					</tr>
<!-- 				<tr class="files">
							<th>첨부파일</th>
							<td>
								<div class="upload-box">
									<ul class="file-tree">
									</ul>
									<label for="inquiryWriteFiles" class="file-btn"><span>파일선택</span></label>
									<input type="file" id="inquiryWriteFiles" name="q_file" hidden="" class="upload" multiple="multiple">
								</div>
								<p class="file-notice">2MB이하 이미지파일(png, jpg)로 최대 5개까지 업로드 가능합니다.</p>
								<p class="file-notice">이미지 여러 개 등록 시 Ctrl 누른 상태로 등록이 가능합니다.</p>
							</td>
						</tr> -->
						</tbody>
			</table>
			
		<div class="btn-wrap large double">
			<button type="button" class="border-btn pop-open"
				data-class="no-write" onclick="location.href='/Lush/inquiry/list.do'">취소</button>
			<!-- <button type="button" class="black-btn" onclick="qnaValidate();">작성하기</button> -->
			<input type="submit" value="작성하기" style="width:232px; height:64px; line-height:62px; background: #222; color:#fff">
		</div></div>
			</div>
		</article></div>
		</form></section>
		



</body>
<script>
function qnaValidate() {

	if (!$("#qnaGroup").val()) {
		alert("카테고리를 선택해주세요.");
		return false;
	}

	if (!$("#subject").val().trim()) {
		alert("제목을 입력해주세요.");
		return false;
	}

	if (!$("#question").val().trim()) {
		alert("내용을 입력해주세요.");
		return false;
	}
}

/* function openLayerPopup(){
	
} */

function insertQna() {

	var formData = new FormData($("#qna")[0]);
	var url = "/Lush/inquiry/write.do";

	$.ajax({
		url : url,
		type : 'POST',
		data : formData,
		processData : false,
		contentType : false,
		enctype : 'multipart/form-data',
		success : function(response) {
			if (response.isSuccess) {
				rna.openLayerPopup("inquiryCompletePop");
			} else {
				alert(response.errorMessage);
			}
		},
		error : function(error) {
			alert(error);
		}
	});
}

</script>


<!-- 1:1문의 작성취소 팝업 -->
<div class="popup no-write" id="inquiryCancelPop">
    <div class="pop-head">
        <h2 class="small center">작성 취소</h2>
    </div>
    <div class="pop-content">
        <p class="body1">작성중인 내용은 저장되지 않습니다.<br/>취소하시겠습니까?</p>
    </div>
    <div class="btn-wrap basic double">
        <button type="button" class="border-btn pop-close" >취소</button>
        <button type="button" class="black-btn" onclick="location.href='/Lush/inquiry/inuqiry.do'">확인</button>
    </div>
    <button type="button" class="pop-close popup-close-btn">팝업닫기</button>
</div>

<!-- 1:1문의 문의접수 팝업 -->
<div class="popup accept" id="inquiryConfirmPop">
    <div class="pop-head">
        <h2 class="small center">문의접수</h2>
    </div>
    <div class="pop-content">
        <p class="body1">문의를 등록하시겠습니까?</p>
    </div>
    <div class="btn-wrap basic double">
        <button type="button" class="border-btn pop-close">취소</button>
        <button type="button" class="black-btn pop-change" onclick="insertQna();">등록</button>
    </div>
    <button type="button" class="pop-close popup-close-btn" name="">팝업닫기</button>
</div>c

<!-- 1:1문의 문의접수 팝업 -->
<div class="popup inquiry-complete" id="inquiryCompletePop">
    <div class="pop-head">
        <h2 class="small center">문의접수</h2>
    </div>
    <div class="pop-content">
        <p class="body1">완료되었습니다.</p>
    </div>
    <div class="btn-wrap basic">
        <button type="button" class="black-btn pop-close" onclick="location.href='/Lush/inquiry/list.do'">확인</button>
    </div>
    <button type="button" class="pop-close popup-close-btn" onclick="location.href='/Lush/inquiry/list.do'">팝업닫기</button>
</div>

</html>

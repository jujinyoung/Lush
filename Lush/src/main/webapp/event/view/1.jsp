<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    int eventStatus = request.getParameter("eventStatus")==null ? 1 :Integer.parseInt(request.getParameter("eventStatus"));
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/view_style.css" type="text/css">
    <link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <title>러쉬코리아</title>
</head>
<body>

<section>
    <!-- 이벤트 리스트 -->
    <article>
        <!-- inner -->
        <div class="inner">
            <div class="page-top">
                <h2 class="page-title">이벤트</h2>
            </div>
            <jsp:include page="/WEB-INF/inc/event/boardEvent.jsp">
                <jsp:param name="eventStatus" value="<%=eventStatus%>"/>
                <jsp:param name="searchCondition" value="<%=searchCondition%>"/>
                <jsp:param name="currentPage" value="${pageBlock.currentPage}"/>
                <jsp:param name="searchCondition" value="<%=searchCondition%>"/>
            </jsp:include>
            <jsp:include page="/WEB-INF/inc/event/eventTab.jsp">
                <jsp:param name="proceedRecords" value="${proceedRecords}"/>
                <jsp:param name="endRecords" value="${endRecords}"/>
                <jsp:param name="eventStatus" value="<%=eventStatus%>"/>
            </jsp:include>

            <div class="tab-cont">
                <!-- 이벤트 상세보기 -->
                <div class="tab-inner on">
                    <div class="board-read">
                        <ul class="board-read-top">
                            <li><h3>말똥도넛 러쉬 팝업스토어</h3></li>
                            <li><span class="body1">2022-12-16 17:00 ~ 2023-01-15 23:59</span></li>
                        </ul>
                        <!-- 텍스트 입력기 내용 삽입 -->
                        <div class="board-contents ">
                            <div class="board-img-wrap">
                                <div class="evt-section">
                                    <img src="../images/event/view/1.jpg" alt="">
<%--                                    나중에 로그인페이지로 이동추가 해야함--%>
                                    <button class="btn-login" title="로그인"></button>
<%--                                    댓글창으로 이동 추가해야함--%>
                                    <button class="btn-comment" title="댓글 남기기"></button>
<%--                                    선정자 발표 게시판 링크추가--%>
                                    <a class="btn-result" title="선정자 발표 게시판으로 이동"></a>
                                </div>

                                <div class="evt-noti">
                                    <h4 class="noti-tit">※이벤트 유의사항※</h4>
                                    <ul>
                                        <li>- 본 이벤트 참여 시 개인정보 수집 및 활용에 동의한 것으로 간주합니다. </li>
                                        <li>- 본사 사정에 따라 행사 내용이 변경 및 조기 종료될 수 있습니다. </li>
                                        <li>- 선물은 교환 및 환불이 불가합니다.</li>
                                        <li>- 선물 소진 시, 별도 안내 없이 다른 선물로 대체 출고 혹은 조기 종료될 수 있습니다.</li>
                                    </ul>
                                    <h4 class="noti-tit">※개인정보 수집 및 활용※</h4>
                                    <ul>
                                        <li>- 수집 목적 : 말똥 도넛 팝업 스토어 이벤트 참여 </li>
                                        <li>- 수집 항목 : 아이디, 성함, 전화번호, 주소 </li>
                                        <li>- 보관 기간 : 2024년 1월 15일 (월) </li>
                                    </ul>
                                    <p>수집 동의를 거부할 수 있으나, 동의 거부 시 이벤트 참여/안내에 제한이 있을 수 있습니다.</p>
                                </div>
                            </div>

                        </div>

                        <div class="btn-wrap right medium">
                            <a class="border-btn">목록</a>
                        </div>
                    </div>


                    <div class="reply" id="commentList">
                        <div class="review">
                            <div class="inner">
                                <div class="review-title flex">
                                    <h2>총 ${totalRecords}개의 댓글</h2>
<%--                                    로그인 처리 전--%>
<%--                                    <p>--%>
<%--                                        <a>로그인</a>을 하셔야 댓글을 등록할 수 있습니다.--%>
<%--                                    </p>--%>
<%--                                    로그인 처리 후--%>
                                    <button type="button" class="pop-open black-btn">댓글 작성</button>
                                </div>
                                <div class="review-wrap">
                                    <ul>
                                        <c:forEach var="review" items="${reviews}" varStatus="status">
                                            <li>
                                                <div class="review-top">
                                                    <span class="writer">
<%--                                                        나중에 덕찌 기능 완성시 개수 더하기--%>
                                                        <span class="ducczi-cnt">+0</span>
<%--                                                        로그인작업 완료시 추가--%>
                                                        <span>이름</span>
                                                    </span>
                                                    <span class="date">${review.eventReview.er_rdate}</span>
                                                </div>
                                                <c:choose>
<%--                                                    비밀댓글 여부이면서 아이디도 틀려야함 추후 수정--%>
                                                    <c:when test="${review.eventReview.er_secret eq '1'}">
                                                        <p class="subject">비밀 댓글입니다.</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="review-container flex top">
                                                            <div id="imageSize" class="review-contents cut">
                                                                <p>${review.eventReview.er_content}</p>
<%--                                                                아이디 체크 후 같으면--%>
                                                                <div class="review-btn">
                                                                    <button type="button" id="updateReview">수정</button>
                                                                    <button type="button" id="delReview">삭제</button>
                                                                    <input type="text" id="rid" value="${review.eventReview.er_id}" hidden>
                                                                </div>
                                                                <c:if test="${review.imgPath ne null}">
                                                                    <c:forEach var="images" items="${review.imgPath}">
                                                                        <img src="/Lush/upload/event/${images}" alt="리뷰 상세 이미지">
                                                                    </c:forEach>
                                                                    <button type="button" class="no-cut" style="display: block">더보기</button>
                                                                </c:if>
                                                            </div>
                                                            <div class="review-side">
                                                                <c:if test="${review.imgPath ne null}">
                                                                    <div class="review-thumbnail" style="display: block">
                                                                        <img src="/Lush/upload/event/${review.imgPath[0]}" alt="리뷰 상세 이미지">
                                                                        <span>+${fn:length(review.imgPath)}</span>
                                                                    </div>
                                                                </c:if>
                                                                <button type="button" class="minimum-btn" style="display: none">
                                                                    <img src="../images/ico/arrow_up_gray.svg" alt="닫기 버튼">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
<%--                                <jsp:include page="/WEB-INF/inc/event/paging.jsp">--%>
<%--                                    <jsp:param name="eventStatus" value="<%=eventStatus%>"/>--%>
<%--                                    <jsp:param name="searchCondition" value="<%=searchCondition%>"/>--%>
<%--                                    <jsp:param name="searchWord" value="<%=searchWord%>"/>--%>
<%--                                    <jsp:param name="url" value="/Lush/event/view.do?eventID=${eventID}&proceedRecords=${proceedRecords}&endRecords=${endRecords}&"/>--%>
<%--                                </jsp:include>--%>

                                <div class="paginate">
                                    <ul>
                                        <c:if test="${pageBlock.prev}">
                                            <li class="first"><a href="" onclick="page(${pageBlock.startOfPageBlock-1})"> &laquo; </a></li></c:if>
                                        <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
                                            <c:choose>
                                                <c:when test="${pageBlock.currentPage eq i}">
                                                    <li><a id="pagenum${i}" class="num on" onclick="page(${i})">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li><a id="pagenum${i}" onclick="page(${i})">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${pageBlock.next}">
                                            <li class="last"><a href="" onclick="page(${pageBlock.endOfPageBlock+1})"> &raquo; </a></li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </article>
</section>



<div class="dimmed" id="dimmedArea">
<%--    댓글작성 버튼 클릭시 --%>
    <div class="popup biggest reply-write" id="commentRegistPopup">
        <div class="pop-head">
            <h2 class="big">댓글 작성</h2>
        </div>
        <div class="pop-content" id="commentRegistForm">
            <form id="boardComment" action="/Lush/event/view.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="btnval" value="0">
                <input type="hidden" name="reviewID" value="0">
                <input type="hidden" name="eventID" value="${eventID}"/>
                <input type="hidden" name="eventStatus" value="<%=eventStatus%>">
                <input type="hidden" name="currentPage" value="${pageBlock.currentPage}">
                <input type="hidden" name="searchWord" value="<%=searchWord%>">
                <input type="hidden" name="proceedRecords" value="${proceedRecords}">
                <input type="hidden" name="endRecords" value="${endRecords}">
                <table class="list-table light">
                    <colgroup>
                        <col width="210px">
                        <col width="auto">
                    </colgroup>
                    <tbody>
                    <tr class="title">
                        <th>제목</th>
                        <td>
                            <input id="cmntStatusCode1" name="secret" type="checkbox" value="0"/>
                            <label for="cmntStatusCode1">
                                <span>비밀글</span>
                            </label>
                            <input type="hidden" name="_cmntStatusCode" value="on"/>
                        </td>
                    </tr>
                    <tr class="contents">
                        <th>내용</th>
                        <td>
                            <textarea id="cmntContent" name="cmntContent" placeholder="댓글 내용을 작성해주세요.
특수문자(<, >, |, = , &amp;lt, &amp;gt 등) 입력은 불가능합니다."></textarea>
                        </td>
                    </tr>
                        <tr class="files">
                            <th>첨부파일</th>
                            <td>
                                <div class="upload-box">
                                    <ul class="file-tree">
<%--                                        이미지 업로드시 li태그 생성--%>

                                    </ul>
                                    <label for="boardCommentFiles0" class="file-btn"><span>파일선택</span></label>
                                    <input type="file" id="boardCommentFiles0" name="boardCommentFiles0" hidden="" accept=".png, .jpg"/>
<%--                                    <input type="file" hidden=""  multiple="multiple" accept=".png, .jpg"/>--%>
                                </div>
                                <p class="file-notice">5MB이하 이미지파일(png, jpg)로 최대 5개까지 업로드 가능합니다.</p>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <div class="btn-wrap large double">
            <button type="reset" class="border-btn pop-change">취소</button>
            <button id="submit_eventReview" type="button" class="black-btn pop-change">작성하기</button>
        </div>
        <button type="button" class="popup-close-btn">팝업닫기</button>
    </div>
</div>

<script>
    let val = 0;
    $(document).on('click', '.review-title button.pop-open', function (){
        $('.dimmed').addClass('on');
        $('.dimmed #commentRegistPopup').show();
    });

    $('button.popup-close-btn').click(function (){
        $('input#cmntStatusCode1').val(0);
        $('textarea#cmntContent').val('');
        $('ul.file-tree li').remove();
        $('label.file-btn').remove();
        $('input[type="file"]').remove();
        $('.upload-box').append('<label for="boardCommentFiles' + val +'" class="file-btn"><span>파일선택</span></label>' +
            '<input type="file" id="boardCommentFiles' + val +'" name="boardCommentFiles' + val +'" hidden="" accept=".png, .jpg"/>');
        $('.dimmed').removeClass('on');
        $('.dimmed #commentRegistPopup').hide();
    });

    $('button[type="reset"].pop-change').click(function (){
        $('input#cmntStatusCode1').val(0);
        $('textarea#cmntContent').val('');
        $('ul.file-tree li').remove();
        $('label.file-btn').remove();
        $('input[type="file"]').remove();
        $('.upload-box').append('<label for="boardCommentFiles' + val +'" class="file-btn"><span>파일선택</span></label>' +
            '<input type="file" id="boardCommentFiles' + val +'" name="boardCommentFiles' + val +'" hidden="" accept=".png, .jpg"/>');
        $('.dimmed').removeClass('on');
        $('.dimmed #commentRegistPopup').hide();
    });

    $('#cmntStatusCode1').click(function (){
        if ($('#cmntStatusCode1').val() == 0){
            $('#cmntStatusCode1').val(1);
        }else{
            $('input#cmntStatusCode1').val(0);
        }
    });


    $(document).on('change','input[type="file"]',function (event){
        var n = $('.upload-box ul.file-tree li').length;
        if (n>=5){
            alert("이미지파일은 5개까지만 올릴 수 있습니다.")
        }else{
            $('.upload-box ul.file-tree').append('<li><div class="input-wrap"><input id="file' + val +'" type="text" readonly>' +
                '<button id="delFile" type="button" value="'+val+'"></button>' +
                '</div></li>');
            var files = $('input#boardCommentFiles'+ val)[0].files[0];
            $('#file'+val).val(files.name);
            val++;
            $('.upload-box label').hide();

            $('.upload-box').append('<label for="boardCommentFiles' + val +'" class="file-btn"><span>파일선택</span></label>' +
                '<input type="file" id="boardCommentFiles' + val +'" name="boardCommentFiles' + val +'" hidden="" accept=".png, .jpg"/>');
        }
    });

    $(document).on('click', 'button.no-cut', function (event){
        $(this).closest('li').addClass('on');
        $(this).closest('#imageSize').removeClass('cut');
        $(this).hide();
        $(this).closest('.review-contents').next().find('.review-thumbnail').hide();
        $(this).closest('.review-contents').next().find('.minimum-btn').css('display','inline-block');
    });

    $(document).on('click', 'button.minimum-btn img', function (){
        $(this).closest('button').hide();
        $(this).closest('button.minimum-btn').prev().show();
        $(this).closest('li').removeClass('on');
        $(this).closest('.review-side').prev().addClass('cut');
        $(this).closest('.review-side').prev().find('button.no-cut').show();
    });

    $(document).on('click','.file-tree li .input-wrap button',function (event) {
            $(this).closest('li').remove();
            $('input#boardCommentFiles'+ $(this).val() +'[type="file"]').remove();
            $('label[for="boardCommentFiles'+$(this).val()+'"]').remove();
    });

    $('button#submit_eventReview').click(function (){
        if ($('textarea#cmntContent').val() === ''){
            alert("내용을 입력해주세요.");
        }else{
            $('form#boardComment').submit();
        }

    });

    $(document).on('click','button#updateReview', function (event) {
        $('.dimmed').addClass('on');
        $('.dimmed #commentRegistPopup').show();
        $('form#boardComment input[name="reviewID"]').val($(this).next().next().val());
        $('form#boardComment input[name="btnval"]').val(1);
    });
    $(document).on('click','button#delReview', function (event) {
        $('form#boardComment input[name="reviewID"]').val($(this).next().val());
        $('form#boardComment input[name="btnval"]').val(2);
        $('form#boardComment').submit();
    });

</script>
<script>
    function page(num){
        $.ajax({
            url:"/Lush/event/view.json" ,
            dataType:"json",
            type:"GET",
            data: {
                currentPage : num,
                eventID : ${eventID}
            },
            cache:false ,
            success: function ( data,  textStatus, jqXHR ){
                $('.paginate ul li a').removeClass('num on');
                $('.paginate ul li a#pagenum'+num).addClass('num on');
                $('.review-wrap ul li').remove();
                $.each(JSON.parse(JSON.stringify(data)), function (index, item){
                   // console.log(index + ' : ' + item.eventReview.er_id);
                    $('.review-wrap ul').append('<li><div class="review-top"><span class="writer"><span class="ducczi-cnt">+0</span><span>이름</span></span>' +
                        '<span class="date">'+item.eventReview.er_rdate+'</span></div>');
                    if (item.eventReview.er_secret == 0){
                        $('.review-wrap ul li:nth-child('+(index+1)+')').append('<div class="review-container flex top"><div id="imageSize" class="review-contents cut">' +
                            '<p>'+item.eventReview.er_content+'</p>');

                        //로그인 비교 후 같으면 append
                        $('.review-wrap ul li:nth-child('+(index+1)+') .review-container div#imageSize').append('<div class="review-btn"><button type="button" id="updateReview">수정</button>' +
                            '<button type="button" id="delReview">삭제</button>' +
                            ' <input type="text" id="rid" value="'+item.eventReview.er_id+'" hidden></div>');

                        if (item.imgPath != null) {
                            for (var num in item.imgPath) {
                                $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container div#imageSize').append('<img src="/Lush/upload/event/' + item.imgPath[num] + '" alt="리뷰 상세 이미지">');
                            }
                            $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container div#imageSize').append('<button type="button" class="no-cut" style="display: block">더보기</button></div>');
                        }
                        $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container').append('<div class="review-side">');

                        if (item.imgPath != null){
                            $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container .review-side').append('<div class="review-thumbnail" style="display: block">' +
                                '<img src="/Lush/upload/event/' + item.imgPath[0] + '" alt="리뷰 상세 이미지"><span>+'+ item.imgPath.length + '</span></div>');
                        }


                        $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container .review-side').append('<button type="button" class="minimum-btn" style="display: none"><img src="../images/ico/arrow_up_gray.svg" alt="닫기 버튼"></button></div></div></li>');


                    }else{
                        $('.review-wrap ul li:nth-child('+(index+1)+')').append('<p class="subject">비밀 댓글입니다.</p></li>');
                    }


                });
            },
            error:function (){
                alert("에러~~~ ");
            }
        });
    }
</script>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int eventStatus = request.getParameter("eventStatus")==null ? 1 :Integer.parseInt(request.getParameter("eventStatus"));
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    int currentPage = request.getParameter("currentPage")==null ? 1 :Integer.parseInt(request.getParameter("currentPage"));
    String proceedRecords = request.getParameter("proceedRecords");
    String endRecords = request.getParameter("endRecords");

    String eventID = request.getParameter("eventID");
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
                <jsp:param name="currentPage" value="<%=currentPage%>"/>
                <jsp:param name="searchCondition" value="<%=searchCondition%>"/>
            </jsp:include>
            <jsp:include page="/WEB-INF/inc/event/eventTab.jsp">
                <jsp:param name="proceedRecords" value="<%=proceedRecords%>"/>
                <jsp:param name="endRecords" value="<%=endRecords%>"/>
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
                                    <h2>총 ?개의 댓글</h2>
<%--                                    로그인 처리 전--%>
<%--                                    <p>--%>
<%--                                        <a>로그인</a>을 하셔야 댓글을 등록할 수 있습니다.--%>
<%--                                    </p>--%>
<%--                                    로그인 처리 후--%>
                                    <button type="button" class="pop-open black-btn">댓글 작성</button>
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
<%--&lt;%&ndash;    <!-- 댓글작성 취소 팝업 -->&ndash;%&gt;--%>
<%--   ------- <div class="popup reply-cancel" id="commentCancelPopup">--%>
<%--        <div class="pop-head">--%>
<%--        </div>--%>
<%--        <div class="pop-content">--%>
<%--            <p class="body1">작성중인 내용은 저장되지 않습니다.<br/> 취소하시겠습니까?</p>--%>
<%--        </div>--%>
<%--        <div class="btn-wrap basic double">--%>
<%--            <button type="button" class="border-btn">취소</button>--%>
<%--            <button type="button" class="black-btn pop-close confirm">확인</button>--%>
<%--        </div>--%>
<%--        <button type="button" class="pop-close popup-close-btn">팝업닫기</button>--%>
<%--    </div>--%>

<%--&lt;%&ndash;    <!-- 댓글등록 팝업 -->&ndash;%&gt;--%>
<%--   -------- <div class="popup reply-ok" id="commentRegistSuccessPopup">--%>
<%--        <div class="pop-head">--%>
<%--        </div>--%>
<%--        <div class="pop-content">--%>
<%--            <p class="body1">댓글이 등록되었습니다.</p>--%>
<%--        </div>--%>
<%--        <div class="btn-wrap basic">--%>
<%--            <button type="button" class="black-btn pop-close" >확인</button>--%>
<%--        </div>--%>
<%--        <button type="button" class="pop-close popup-close-btn" name="">팝업닫기</button>--%>
<%--    </div>--%>

<%--    댓글작성 버튼 클릭시 --%>
    <div class="popup biggest reply-write" id="commentRegistPopup">
        <div class="pop-head">
            <h2 class="big">댓글 작성</h2>
        </div>
        <div class="pop-content" id="commentRegistForm">
            <form id="boardComment" action="/Lush/event/view.do" method="post" enctype="multipart/form-data"><input type="hidden" name="boardCommentId" value="0" />
                <input type="hidden" name="eventID" value="<%=eventID%>">
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
                                    <label for="boardCommentFiles" class="file-btn"><span>파일선택</span></label>
                                    <input type="file" id="boardCommentFiles" name="boardCommentFiles0" hidden="" accept=".png, .jpg"/>
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
    $('.review-title button.pop-open').click(function (){
        $('.dimmed').addClass('on');
        $('.dimmed #commentRegistPopup').show();
    });

    $('button.popup-close-btn').click(function (){
        $('.dimmed').removeClass('on');
        $('.dimmed #commentRegistPopup').hidden();
        // $('input#cmntStatusCode1').val(0);
        // $('textarea#cmntContent').val(';');
        // $('.upload-box ul.file-tree li').detach();
    });

    // $('button.pop-change').click(function (){
    //     $('.dimmed').removeClass('on');
    //     $('.dimmed #commentRegistPopup').hidden();
    //     // $('#cmntStatusCode1').val(0);
    //     // $('#cmntContent').val('');
    //     // $('.file-tree li').detach();
    // });

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
            $('.upload-box ul.file-tree').append('<li><div class="input-wrap"><input id="file' + n +'" type="text" readonly>' +
                '<button id="delFile" type="button" onclick="delFileFunc()"></button>' +
                '</div></li>');

            var files = $('input[type="file"]')[n].files;
            // alert(files[0].name);
            // for (var i=0; files.length; i++){
            $('#file'+n).val(files[0].name);
            // }
            $('.upload-box label').hide();

            $('.upload-box').append('<label for="boardCommentFiles' + n +'" class="file-btn"><span>파일선택</span></label>' +
                '<input type="file" id="boardCommentFiles' + n +'" name="boardCommentFiles' + (n+1) +'" hidden="" accept=".png, .jpg"/>');
        }
    });

    // $(document).ready(function () {
    //     $("#boardCommentFiles").change(function (event) {
    //         var n = $('.upload-box ul.file-tree li').length;
    //         if (n>=5){
    //             alert("이미지파일은 5개까지만 올릴 수 있습니다.")
    //         }else{
    //             $('.upload-box ul.file-tree').append('<li><div class="input-wrap"><input id="file' + n +'" type="text" readonly>' +
    //                 '<button id="delFile" type="button" onclick="delFileFunc()"></button>' +
    //                 '</div></li>');
    //
    //             var files = $('input#boardCommentFiles')[0].files;
    //             // alert(files[0].name);
    //             // for (var i=0; files.length; i++){
    //                 $('#file'+n).val(files[0].name);
    //             // }
    //             $('.upload-box label').hide();
    //
    //             $('.upload-box').append('<label for="boardCommentFiles" class="file-btn"><span>파일선택</span></label>' +
    //                 '<input type="file" id="boardCommentFiles" name="boardCommentFiles' + n +'" hidden="" accept=".png, .jpg"/>');
    //         }
    //     });//  click
    //
    // }); // ready

    function delFileFunc(){
        alert('gd');
        $(this).unwrap();
        // $(this).closest('li').detach();
    }

    $('button#submit_eventReview').click(function (){
        $('form#boardComment').submit();
    });
</script>
</body>
</html>
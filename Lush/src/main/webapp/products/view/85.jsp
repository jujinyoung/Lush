<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String pid = request.getParameter("productID");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/view_style.css" type="text/css">
    <link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
    <title>러쉬</title>
</head>
<body>

<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>

<section id="detail" style="padding-top: 128px;">

  <h1 class="blind">허벌리즘 100g/250g_프레쉬 클렌저</h1>
  <article class="detail-top">
    <div class="inner wide flex left top">
      <div class="prd-img-area">
        <div class="swiper-container prd-big swiper-container-initialized swiper-container-horizontal">
          <div class="swiper-wrapper" style="transform: translate3d(-2304px, 0px, 0px);">
            <div class="swiper-slide" style="width: 768px;"><img src="../images/products/85/85_1.png" alt="허벌리즘 100g/250g"></div>
            <div class="swiper-slide" style="width: 768px;"><img src="../images/products/85/85_2.png" alt="허벌리즘 100g/250g_1"></div>
            <div class="swiper-slide swiper-slide-prev" style="width: 768px;"><img src="../images/products/85/85_3.png" alt="허벌리즘 100g/250g_2"></div>
            <div class="swiper-slide swiper-slide-active" style="width: 768px;"><img src="../images/products/85/85_4.jpg" alt="허벌리즘 100g/250g"></div>
          </div>
          <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
        </div>

        <div class="swiper-container prd-thumb swiper-container-initialized swiper-container-horizontal swiper-container-free-mode swiper-container-thumbs">
          <div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px);">
            <div class="swiper-slide swiper-slide-visible swiper-slide-active" style="margin-right: 24px;"><img src="../images/products/85/85_1.png" alt="허벌리즘 100g/250g"></div>
            <div class="swiper-slide swiper-slide-visible swiper-slide-next" style="margin-right: 24px;"><img src="../images/products/85/85_2.png" alt="허벌리즘 100g/250g_1"></div>
            <div class="swiper-slide swiper-slide-visible" style="margin-right: 24px;"><img src="../images/products/85/85_3.png" alt="허벌리즘 100g/250g_2"></div>
            <div class="swiper-slide swiper-slide-visible swiper-slide-thumb-active" style="margin-right: 24px;"><img src="../images/products/85/85_4.jpg" alt="허벌리즘 100g/250g"></div>
          </div>
        </div>
      </div>
      <div class="prd-info-area">
        <ul class="info-top flex">
          <li><a href="javascript:;" class="body1" id="reviewTab">${totalRecords} 개의 후기 보기</a></li>
          <li><button type="button" id="sh-link" class="share-button">공유하기</button></li>
        </ul>
        <div class="prd-info-wrap">
          <img src="../images/products/85.png" alt="허벌리즘 100g/250g" class="product-images">
          <h2 class="product-name">허벌리즘 100g/250g</h2>
          <p class="category subtitle">프레쉬 클렌저</p>
          <ul class="hash-box flex center top">
            <li>#클렌저 #부드러운아침세안</li>
          </ul>
          <form id="cartForm" class="" action="/Lush/order/orderview.do" method="post">
            <input type="hidden" name="fromwhere" value=1>
            <c:forEach var="p" items="${productSangses}">
              <input type="hidden" class="${p.psid}" division="${p.weight}">
              <input type="hidden" class="${p.amount}" amount="${p.psid}">
            </c:forEach>

            <div id="cart-item">
            </div>
            <div class="option-wrap flex center top">
              <div class="option item-option-info" role="radiogroup">
                <div class="option-box">
                  <div class="option-box-type1">
                  </div>
                  <div class="option-box-type2">
                    <div class="option-wrap flex center top option-group">
                      <span class="opt-name">용량</span>
                      <div class="option" role="radiogroup">
                        <button type="button" class="btn_option 100g" role="radio" aria-checked="false">
                          100g</button>
                        <button type="button" class="btn_option 250g" role="radio" aria-checked="false">
                          250g</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <ul class="append-area added-options">
            </ul>
            <ul class="append-area added-items">
            </ul>
            <ul class="total-price-wrap">
              <li><span>총 합계 금액</span> <strong>￦ <div class="total-item-price">0</div></strong></li>
            </ul>
            <div class="prd-info-buttons  standard-group">
              <button type="button" class="like" onclick="javascript:itemViewAddToWishList()">좋아요</button>
              <button type="button" class="basket pop-open">장바구니</button>
              <button type="button" class="black-btn buy">바로구매</button>

            </div>

          </form>


        </div>
      </div>
    </div>
  </article>

  <article class="prd-detail" id="review">
    <div class="inner wide">
      <ul class="tab-btn white">
        <li><a href="javascript:;" class="on">제품정보</a></li>
        <li><a href="javascript:;">제품후기</a></li>
        <li><a href="javascript:;">배송/반품/교환 안내</a></li>
        <li><a href="javascript:;">상품필수정보</a></li>
      </ul>

      <div class="tab-cont">
        <!-- 제품 정보 탭 -->
        <div class="tab-inner on">
          <!-- 제품 배너 영역 (공통)-->
          <!-- 비디오 영역 (공통)-->
          <div class="prd-video">
            <iframe width="100%" height="568" src="https://www.youtube.com/embed/_FLFR7gBU34?playlist=_FLFR7gBU34&autoplay=1&mute=1&loop=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </div>
          <!-- 제품명 영역 (공통) -->
          <div class="prd-nametag">
            <p class="body1">프레쉬 클렌저</p>
            <h3 class="name-tag">허벌리즘 100g/250g</h3>
            <p class="body1">
              Herbalism</p>
            </p>
          </div>

          <!-- 후기 에디터 영역 -->
          <div class="prd-recommend">  <ul class="flex">   <li> <img src="../images/ico/stars5.svg" alt="별점5점" class="star-rate"> <h3 class="rec-title">벌써 세 통째 <br>사용하고 있어요! </h3><p class="staff-review">*러쉬코리아 직원 해피피플이 작성한 리뷰입니다</p><p>특히 아침 세안에 사용하면 더욱 개운한 클렌저예요.<br> 아몬드와 쌀겨가 피부를 부드럽게 정돈해주고, <br>사용 후에는 촉촉함이 남아 남은 스킨 케어 루틴에도<br>도움이 돼요. 매력적인 향기는 덤이죠!<br><span>by. 텐더</span></p> </li><li><img src="http://img.lush.co.kr/product/body/herbalism_review.jpg" alt="추천이미지"></li></ul></div><!-- 이 향기는요 영역 -->
          <!-- 비슷하지만 달라요 영역 -->
          <ul class="prd-type">   <li class="checked">       <p class="type-name"><span>프레쉬 클렌저</span></p>   <p>  얼굴과 몸에 영양을 선사하는 클렌징 제품으로<br> 거품 없이도 깨끗한 클렌징을 도와줍니다.<br>   </p></li><li>       <p class="type-name"><span>프레쉬 페이스 마스크</span></p>       <p>   영양이 풍부한 원재료를 듬뿍 담은 꾸덕한 제형의<br>  워시 오프 팩으로 촉촉한 피부로 가꾸는 데 도움을 줍니다.<br>   </p></li></ul><!-- 제품 상세 영역 -->
          <div class="prd-desc">   <h3>카모마일의 편안함!</h3><p class="body1">부드러운 피부에 도움을 주는 쌀겨와 아몬드를 듬뿍 담았습니다. <br>식초의 영양과 캐모마일의 편안함, 그리고 로즈 앱솔루트의 만남은 피부를 고르게 가꾸는 데 도움을 줍니다. <br>Tip. 식물의 힘이 느껴지는 똑똑한 클렌저를 만나보세요. </p></div><div class="prd-banner"><img alt="상세배너" src="http://img.lush.co.kr/product/body/herbalism_re_img.jpg"></div><!-- 스파 요약 -->
          <!-- 퍼퓸박스 영역 -->
          <!-- 사용방법 영역 -->
          <div class="prd-guide">
            <ul class="flex bottom">
              <li><h3>사용 방법</h3>
                <p class="body1">손바닥에 한 움큼 덜어내어 살짝 물을 묻혀 으깨주세요.<br> 부드럽게 마사지한 뒤 미온수로 깨끗이 씻어내 줍니다.<br>*얼굴뿐 아니라 보디 케어에 사용할 수 있습니다.</p>
                <div class="hashtag">
                  <a href="javascript:;"><span>#블랫팟의환생</span></a>
                  <a href="javascript:;"><span>#러쉬클렌저</span></a>
                  <a href="javascript:;"><span>#Herbalism</span></a>
                  <a href="javascript:;"><span>#허벌리즘</span></a>
                  <a href="javascript:;"><span>#허브클렌저</span></a>
                </div>
              </li>
              <li><img src="http://img.lush.co.kr/product/body/herbalism_use.jpg" alt="사용방법 이미지"></li>
            </ul>
          </div>
          <!-- 제품 성분 영역 -->
          <div class="prd-ingredient">
            <h3>제품 성분</h3>
            <ul class="flex top">
              <li>
                <img src="../images/products/85/20220223094031L.png" alt="카올린">
                <a href="javascript:;">카올린</a>
                <p class="body1 effect">깨끗한 클렌징에 도움</p>
              </li>
              <li>
                <img src="../images/products/85/20220223110957L.png" alt="스위트 아몬드">
                <a href="javascript:;">스위트 아몬드</a>
                <p class="body1 effect">부드럽고 촉촉한 피부에 도움</p>
              </li>
              <li>
                <img src="../images/products/85/20220223111541L(1).png" alt="카모마일">
                <a href="javascript:;">카모마일</a>
                <p class="body1 effect">편안한 허브 향기</p>
              </li>
            </ul>
            <div class="all-ingre">
              <p>
                <strong>대표성분</strong>
                카올린,스위트 아몬드,카모마일</p>
              <!-- 전 성분 표기 -->
              <div class="prd-ingredient"> <div class="all-ingre"><p><strong>전 성분 표기&nbsp;</strong>스위트아몬드씨가루,카올린,글리세린,현미초, 쌀겨,정제수,치자추출물,향료,<br>다마스크장미꽃추출물, 마트리카리아꽃오일,살비아오일,쐐기풀잎가루, 로즈마리잎,클로로필</p></div><br></div><script>
              $(".prd-ingredient:eq(1)").css("margin-top", "0px");
            </script>
            </div>
          </div>
          <div class="prd-tip">
            <h2>Good to Know</h2>
            <ul class="flex top">
              <li class="vegan  selected">
                <img src="../images/ico/ico_checked.png" alt="선택됨" class="checked-mark">
                <div class="prd-mark-wrap">
                  <img src="../images/ico/ico_tip_vegan.png" alt="비건마크" class="tip-mark">
                </div>
                <p class="body1">
                  동물성 원료를<br/>전혀 포함하지 않은<br/>영국 비건 협회 인증 제품
                </p>
              </li>
              <li class="sp  selected">
                <img src="../images/ico/ico_checked.png" alt="선택됨" class="checked-mark">
                <div class="prd-mark-wrap">
                  <img src="../images/ico/ico_tip_sp.png" alt="SP마크" class="tip-mark">
                </div>
                <p class="body1">
                  자연에서 얻은<br/>원재료로 스스로<br/>보존이 가능한 제품
                </p>
              </li>
              <li class="approved ">
                <img src="../images/ico/ico_checked.png" alt="선택됨" class="checked-mark">
                <div class="prd-mark-wrap">
                  <img src="../images/ico/ico_tip_approved.png" alt="approved마크" class="tip-mark">
                </div>
                <p class="body1">
                  꿀,라놀린(양털 추출물)을 제외<br/>한 동물성 원료를 포함하지 않은<br/>영국 베지테리언 협회 인증 제품
                </p>
              </li>
              <li class="vegans ">
                <img src="../images/ico/ico_checked.png" alt="선택됨" class="checked-mark">
                <div class="prd-mark-wrap">
                  <img src="../images/ico/ico_tip_vegan_text.png" alt="suitable for vegans" class="tip-mark">
                </div>
                <p class="body1">
                  동물성 원료를<br/>포함하지 않은 제품으로<br/>비건에게 적합함
                </p>
              </li>
              <li class="vegetarians ">
                <img src="../images/ico/ico_checked.png" alt="선택됨" class="checked-mark">
                <div class="prd-mark-wrap">
                  <img src="../images/ico/ico_tip_vegetarians_text.png" alt="suitable for vegetarians" class="tip-mark">
                </div>
                <p class="body1">
                  꿀,라놀린(양털 추출물)을 제외<br/>한 동물성 원료를 포함하지 않은<br/>제품으로 베지테리언에게 적합함
                </p>
              </li>
            </ul>
          </div>
          <!-- 기프트 구성품/구성품수 목록/정보 -->
          <!-- 낫렙으로 포장해 보세요 -->
          <!-- 낫렙 사이즈 영역 -->
          <!-- 활용방법 영역 -->
          <!-- 취급시 주의사항 영역 -->
          <!-- Q&A 영역 -->
          <div class="prd-qa">       <h3>Q&amp;A</h3><ul><li><p class="prd-question">구매한 제품의 색이 이미지와 달라요!</p><p class="prd-answer">러쉬의 제품에 담긴 신선한 원료는 수확시기에 따라 수분감, 당도, 산도 등이 달라 동일한 제품이라도 <br>질감이나 색상이 다를 수 있답니다!</p></li><li><p class="prd-question">사용기한을 알고 싶어요!</p><p class="prd-answer"> 자연에서 얻은 건강한 원재료를 듬뿍 담고 있는 프레쉬 클렌저는 제조일로부터 3개월 동안 사용하실 수 있습니다. <br>제품 검수와 배송을 거쳐 수령 후 사용기한은 최소 1달 이상입니다. <br>디지털 매장의 경우, 입/출고가 빈번하여 제조 일자와 사용기한의 표기가 어렵습니다. <br>고객센터로 문의하시면 현재 판매되는 제품의 제조 일자와 사용기한을 안내해 드릴게요!</p> </li></ul> </div><!-- Lush Spa 매장 정보 -->
          <div class="prd-article">
            <ul class="flex">
              <li><img src="../images/products/85/200205_article_freshmask_01_153137.jpg" alt="프레쉬 & 핸드메이드 정책"></li>
              <li>
                <p class="article-cate subtitle">프레쉬 & 핸드메이드 정책</p>
                <h3></h3>
                <a href="/board/article/22112" class="border-btn">자세히 보기</a>
              </li>
            </ul>
          </div>
        </div>
        <!-- 제품 정보 탭 //-->
        <!-- 제품 후기 탭 -->
        <div class="tab-inner">
          <div class="review">
            <div class="inner">
              <div class="review-title flex">
                <h2>총 <span class="item-review-count">${totalRecords}</span>개의 후기</h2>
                <button type="button" class="pop-open black-btn">제품후기 작성</button>
              </div>
              <div class="review-photo">
                <div class="swiper-container">
                  <div class="swiper-wrapper">
                    <c:forEach items="${reviewTopImages}" var="topImage" varStatus="status">
                      <a href="javascript:;" class="swiper-slide" style="width: 184px; margin-right: 24px;">
                        <img src="/Lush/upload/products/${topImage}" alt="리뷰이미지" width="184" height="184" class="swiper-slide"></a>
                    </c:forEach>
                  </div>
                  <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                </div>

                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev swiper-button-disabled"></div>
              </div>
              <div id="review-list">
                <div class="review-wrap">
                  <ul>
                    <c:if test="${productReviewImages != null}">
                      <c:forEach items="${productReviewImages}" var="review">
                        <li>
                          <div class="review-top">
                            <img src="../images/ico/stars${review.productReview.pdr_grade}.svg" class="rate">
                            <span class="writer">
                              <span>${review.member.name}</span>
                            </span>
                            <span class="date">${review.productReview.pdr_date}</span>
                          </div>

                          <p class="subject"></p>

                          <div class="review-container flex top">
                            <div id="imageSize" class="review-contents cut">
                              <p>${review.productReview.pdr_content}</p>

<%--                              <c:if test="${review.member.mid} eq 세션으로받은id값">--%>
                                <div class="review-btn">
                                  <button type="button" id="updateReview">수정</button>
                                  <button type="button" id="delReview">삭제</button>
                                  <input type="text" id="rid" value="${review.productReview.pdr_id}" hidden>
                                </div>
<%--                              </c:if>--%>

                              <c:if test="${review.imgPath ne null}">
                                <c:forEach var="images" items="${review.imgPath}">
                                  <img src="/Lush/upload/products/${images}" alt="리뷰 이미지" style="width: 400px;">
                                </c:forEach>
                                <button type="button" class="no-cut" style="display: block">더보기</button>
                              </c:if>

                            </div>
                            <div class="review-side">

                              <c:if test="${review.imgPath ne null}">
                                <div class="review-thumbnail" style="display: block">
                                  <img src="/Lush/upload/products/${review.imgPath[0]}" alt="리뷰 이미지">
                                  <span>+${fn:length(review.imgPath)}</span>
                                </div>
                              </c:if>

                              <button type="button" class="minimum-btn" style="display: none">
                                <img src="../images/ico/arrow_up_gray.svg" alt="닫기 버튼">
                              </button>
                            </div>
                          </div>
                        </li>
                      </c:forEach>
                    </c:if>
                  </ul>
                </div>
                <div class="paginate">
                  <ul>
                    <c:if test="${pageBlock.prev}">
                      <li class="first"><a href="javascript:;" onclick="page(${pageBlock.startOfPageBlock-1})"> &laquo; </a></li></c:if>
                    <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
                      <c:choose>
                        <c:when test="${pageBlock.currentPage eq i}">
                          <li><a id="pagenum${i}" class="num on" onclick="page(${i})">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                          <li><a href="javascript:;" id="pagenum${i}" onclick="page(${i})">${i}</a></li>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                    <c:if test="${pageBlock.next}">
                      <li class="last"><a href="javascript:;" onclick="page(${pageBlock.endOfPageBlock+1})"> &raquo; </a></li>
                    </c:if>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 제품 후기 탭 //-->

        <!-- 배송/반품/교환 탭 -->
        <div class="tab-inner">
          <div class="multi-info" style="border-bottom: none">
            <p><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;"><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">﻿</span>■배송비: 기본배송료는 2,500원 입니다. (도서, 산간, 오지 일부지역은 배송비가 추가될 수 있습니다)&nbsp;</span></p><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">■택배사: 우체국 택배를 이용합니다.</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">■배송가능지역: 국내 배송 가능 / 해외 배송은 불가합니다.&nbsp;</span></div><div><br></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">■홈페이지에서 구매한 경우</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">- 러쉬 코리아 홈페이지에서 구매한 제품은 홈페이지를 통해서만 교환이 가능합니다.</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">- 고객님의 변심에 의한 반품인 경우 상품 및 서비스를 공급 받은 날로부터 7일 이내 가능하며, 미 개봉 제품만 가능합니다.</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">- 고객센터(1644-2357)로 반품 접수를 받고 있으며, 지정 택배사를 이용하여 상품 회수 후 교환/반품 여부에 관한 안내가 이루어집니다.</span></div><div><br></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">* 고객변심으로 인한 교환시 초도 택배 비용을 포함한 반품 택배 비용이 부과됩니다.</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">* 상품결함으로 인한 교환의 경우 러쉬코리아에서 택배비용을 부담합니다.</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">* 택배비용은 무통장 입금을 통해서만 결제 가능합니다.</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">* 교환 상품에 스마트 샘플 또는 깜짝 선물이 있는 경우, 함께 반품하여야 교환이 진행됩니다.</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">* 프레쉬 마스크를 포함하여 냉장배송을 받은 제품은 교환이 불가합니다.</span></div><div><br></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">■휴대폰 소액 결제 시 꼭 참고해주세요.&nbsp;</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">휴대폰 소액 결제는 익월 결제 취소가 불가한 통신사 정책으로 인해, 당월 (1일~31일)에 한한 결제 건만 취소/환불할 수 있습니다.&nbsp;</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">또한 부분 결제 취소 불가하오니 주문 시 유의 바랍니다.&nbsp;</span></div><div><br></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">■고객 센터&nbsp;</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">- 주말과 공휴일을 제외한 매일 운영시간 내 응답 가능합니다.&nbsp;</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">- 이메일 webmaster@lush.co.kr</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">- 상담 전화 : 13:00~ 16:00 ( 1644-2357 )</span></div><div><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">- 상담 톡 : 10:00~ 16:00 ( https://pf.kakao.com/_VEbUM/chat )</span></div><p><span style="font-family: 나눔고딕코딩, NanumGothicCoding, sans-serif; font-size: 9pt;">&nbsp;</span></p></div>
        </div>
        <!-- 배송/반품/교환 탭 //-->

        <!-- 제품고시 탭 -->
        <div class="tab-inner">
          <table class="multi-info notify">
            <colgroup>
              <col width="210px">
              <col width="auto">
            </colgroup>
            <tr>
              <th>용량/중량</th>
              <td>100g, 250g</td>
            </tr>
            <tr>
              <th>제품 주요 사양</th>
              <td>모든 피부용</td>
            </tr>
            <tr>
              <th>사용기한</th>
              <td>이 제품의 최적의 사용 기한은 제조일자로부터 3개월입니다. 당사의 쇼핑몰에서는 제조일자가 가장 빠른 상품부터 출고되고 있습니다. 입출고가 빈번하여 온라인상에 상세 제조일자 기재가 어려운 점 양해 바랍니다. 수령하신 상품에 부착된 라벨을 통하여 제조일자 년/월/일의 순으로 기재되어 개별 확인이 가능하며, 글로벌 가이드에 맞추어 최소 1개월 이상 사용 가능한 제품으로 출고되는 점 참고 부탁드립니다. 추가 문의는 고객센터 1644-2357로 문의하시면 상세히 안내드리겠습니다.</td>
            </tr>
            <tr>
              <th>사용방법</th>
              <td>손바닥에 소량을 덜어내어 물로 충분히 개어주세요. 피부에 마사지하듯 문지른 후 미온수로 헹구어내면 한층 깨끗하고 부드러워진 피부를 경험할 수 있답니다.</td>
            </tr>
            <tr>
              <th>제조사</th>
              <td>본 제품은 영국 러쉬 본사의 기술 제휴를 받고 주요 원료를 수입하여, 동일한 제조 공법으로 만든 제품입니다. - 제조업자: ㈜ 러쉬코리아 충청북도 진천군 신척산단4로 93 - 책임판매업자: ㈜ 러쉬코리아 서울특별시 강남구 학동로 336 www.lush.co.kr</td>
            </tr>
            <tr>
              <th>제조국</th>
              <td>한국</td>
            </tr>
            <tr>
              <th>주요성분</th>
              <td>상세페이지 참조</td>
            </tr>
            <tr>
              <th>식품의약품안전청 심사 필 유무</th>
              <td>식품의약품안전처 심사 대상 아님</td>
            </tr>
            <tr>
              <th>사용상 주의사항</th>
              <td>1. 화장품 사용 시 또는 직사광선에 의하여 사용부위가 붉은 반점, 부어오름, 가려움증 등의 이상 증상이나 부작용 우려 등이 있는 경우 전문의 등과 상담할 것 2. 상처가 있는 부위 등에는 사용을 자제할 것 3. 보관 및 취급상의 주의사항 가) 어린이의 손이 닿지 않는 곳에 보관할 것 나) 직사광선을 피해서 보관할 것 4. 알갱이가 눈에 들어갔을 때에는 물로 씻어내고, 이상이 있는 경우에는 전문의와 상담할 것</td>
            </tr>
            <tr>
              <th>품질보증기준</th>
              <td>공정거래위원회 고시 소비자분쟁해결기준에 의거 교환 또는 보상 받을 수 있습니다</td>
            </tr>
            <tr>
              <th>소비자상담 전화번호</th>
              <td>1644-2357</td>
            </tr>
          </table>
        </div>
        <!-- 제품고시 탭 //-->
      </div>

      <!-- 관련상품 -->
      <div class="prd-relation detail-relation" id="itemRelationsArea">
      </div>
      <!-- 관련상품 //-->
    </div>
  </article>
</section>

<div class="dimmed">


  <!-- 찜 팝업 -->
<%--  <div class="popup zzim" id="op-layer-wishlist">--%>
<%--    <div class="pop-head"></div>--%>
<%--    <div class="pop-content">--%>
<%--      <p class="body1">상품이 찜리스트에 담겼습니다.<br/>바로 확인하시겠습니까?</p>--%>
<%--    </div>--%>
<%--    <div class="btn-wrap basic double">--%>
<%--      <button type="button" class="border-btn pop-close" onclick="Shop.closeCartWishlistLayer()">계속 쇼핑하기</button>--%>
<%--      <button type="button" class="black-btn pop-close" onclick="location.href='/mypage/wishlist'">확인하기</button>--%>
<%--    </div>--%>
<%--    <button type="button" id="closeBtn" class="pop-close popup-close-btn" name="">팝업닫기</button>--%>
<%--  </div>--%>

  <!-- 장바구니 담김 팝업 -->
  <div class="popup cart" id="op-layer-cart">
    <div class="pop-head"></div>
    <div class="pop-content">
      <p class="body1">제품이 장바구니에 담겼습니다.<br/>바로 확인하시겠습니까?</p>
    </div>
    <div class="btn-wrap basic double">
      <button type="button" class="border-btn pop-close">계속 쇼핑하기</button>
      <button type="button" class="black-btn"  onclick="location.href='/Lush/mypage/mypageCart.do'">확인하기</button>
    </div>
    <button type="button" id="closeBtn" class="pop-close popup-close-btn" name="">팝업닫기</button>
  </div>


<%--  <!-- 플러스 리뷰 팝업 -->--%>
<%--  <div class="popup biggest review-plus">--%>
<%--    <div class="pop-head">--%>
<%--      <h2 class="big">플러스 리뷰</h2>--%>
<%--    </div>--%>
<%--    <div id="review-plus-detail" class="pop-content">--%>
<%--    </div>--%>
<%--    <button type="button" id="closeBtn" class="pop-close popup-close-btn" name="">팝업닫기</button>--%>
<%--  </div>--%>

  <!-- 리뷰작성 팝업 -->
  <div class="popup biggest review-write" id="reviewWritePop">
    <div class="pop-head">
      <h2 class="big">제품후기 작성</h2>
    </div>
    <form id="itemReview" action="/Lush/products/view.do" method="post" enctype="multipart/form-data"><input type="hidden" name="itemId" value="85">
      <input type="hidden" name="btnval" value="0">
      <input type="hidden" name="productID" value="<%=pid%>">
      <input type="hidden" class="rating_point" name="score" value="0" id="score" title="별점정보">
      <input id="reviewID" name="reviewID" type="hidden" value="0"/>
      <div class="pop-content">
        <table class="list-table light">
          <colgroup>
            <col width="210px">
            <col width="auto">
          </colgroup>
          <tbody>
          <tr>
            <th>평가</th>
            <td>
              <div class="grade-box">
                <button type="button" data-avg="1" class="star">평점1</button>
                <button type="button" data-avg="2" class="star">평점2</button>
                <button type="button" data-avg="3" class="star">평점3</button>
                <button type="button" data-avg="4" class="star">평점4</button>
                <button type="button" data-avg="5" class="star">평점5</button>
              </div>
            </td>
          </tr>
          <tr class="contents">
            <th>내용</th>
            <td>
							<textarea id="content" name="content" title="평가 내용" placeholder="후기 내용을 작성해주세요.
특수문자(<, >, |, = , &amp;lt, &amp;gt 등) 입력은 불가능합니다." class="required _filter _emoji" rows="6" cols="30">
</textarea></td>
          </tr>
          <tr class="files">
            <th>첨부파일</th>
            <td>
              <div class="upload-box">
                <ul class="file-tree">
                </ul>
                <div id='div_file'>
                  <label for="reviewFiles0" class="file-btn"><span id="lbl_0">파일선택</span></label>
                  <input type="file" id="reviewFiles0" name="reviewFiles0" hidden="" accept=".png, .jpg"/>
                </div>
                <!--
                <label for="itemReviewImageFiles" class="file-btn"><span>파일선택</span></label>
                <input type="file" id="itemReviewImageFiles" name="reviewFiles[]" title="리뷰이미지" hidden="" class="upload" data-page-type="subscription-review"/>
                -->
              </div>
              <p class="file-notice">2MB이하 이미지파일(png, jpg)로 최대 5개까지 업로드 가능합니다.</p>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="btn-wrap double large">
        <button type="button" class="border-btn pop-change" data-class="reply-cancel">취소</button>
        <button type="button"  id="submit_productReview" class="black-btn">작성하기</button>
      </div>
      <div>
        <input type="hidden" name="_csrf" value="7c8e2ebb-9f95-4c0f-abbf-43aa84e391f5" />
      </div></form>
  </div>
</div>

<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

<script>

  $(document).on('click', 'ul.tab-btn.white li', function (event){
    const num = $(this).index()+1;
    $('ul.tab-btn.white li a').removeClass('on');
    $('.tab-cont .tab-inner').removeClass('on');
    $(this).find('a').addClass('on');
    $('.tab-cont .tab-inner:nth-child('+num+')').addClass('on');
  });


  $(document).on('click', '.prd-info-wrap .option-wrap .option button', function (event){
    const weight = $(this).text().trim();

    let totalprice = parseInt($('.total-item-price').text());
    if($(this).attr('aria-checked') == 'false' ){
      let price = 51000;
      if (weight == '100g'){
        price = 22000;
      }
      $(this).attr('aria-checked', 'true');

      let psid = 0;
      $('form#cartForm :input').each(function (index){
        if($(this).attr('division') == weight.substring(0, weight.length-1)){
          psid = $(this).attr('class');
        }
      });

      $('ul.append-area.added-options').append('<li class="'+weight+'"><div class="price"><input type="hidden" name="pid" value="<%=pid%>"><input type="hidden" name="psid" value="'+ psid + '">' +
              '<strong class="prd-price item-name"><input type="hidden" name="optionPrice" value="0">'+weight+'</strong>' +
              '<strong class="prd-price">￦'+ price +  '원</strong>' +
              '<div class="quantity-box"><button type="button" class="q-minus minus" title="삭제"><img src="../images/ico/ico_minus_gray.svg" width="12px" height="auto" alt="수량감소"></button>' +
              '<input type="text" maxlength="3" class="quantity option-quantity" name="amount" value="1">' +
              '<button type="button" class="q-plus plus" title="추가"><img src="../images/ico/ico_plus_black.svg" width="12px" height="auto" alt="수량증가"></button></div>' +
              '<button type="button" class="opt-del-btn"><img src="../images/ico/ico_opt_del.svg" width="32px"></button></div></li>');
      $('.total-item-price').text(totalprice+price);
    }else {
      $(this).attr('aria-checked', 'false');
      let priceStr = $('ul.append-area li.'+ weight + ' .price .prd-price:nth-child(4)').text();
      const price = parseInt(priceStr.substring(1, priceStr.length-1));
      const amount = parseInt($('ul.append-area li.'+ weight + ' .price .quantity-box input').val());

      $('.total-item-price').text(totalprice - (price*amount));

      $('ul.append-area.added-options li.'+weight+'').remove();
    }
  });

  $(document).on('click', 'button.q-minus', function (event) {
    let totalprice = parseInt($('.total-item-price').text());
    let amount = parseInt($(this).next().val());
    if (amount != 1){
      $(this).next().val(--amount);
      let priceStr = $(this).closest('.quantity-box').prev().text();
      const price = totalprice - parseInt(priceStr.substring(1, priceStr.length-1));
      $('.total-item-price').text(price);
    }
  });

  $(document).on('click', 'button.q-plus', function (event) {
    const psid = $(this).closest('.quantity-box').prev().prev().prev().val();
    let amount = 0;
    $('form#cartForm :input').each(function (index){
      if($(this).attr('amount') == psid){
        amount = $(this).attr('class');
      }
    });

    let totalprice = parseInt($('.total-item-price').text());
    let count = parseInt($(this).prev().val());
    if (count >= 20){
      alert('최대 구매 가능 수량은 20개입니다.');
    }else if(count >= amount){
      alert('해당 제품의 재고는 '+amount+'개 입니다.');
    }else{
      $(this).prev().val(++count);
      let priceStr = $(this).closest('.quantity-box').prev().text();
      const price = totalprice + parseInt(priceStr.substring(1, priceStr.length-1));
      $('.total-item-price').text(price);
    }
  });

  $(document).on('click', 'button.opt-del-btn', function (event){
    const weight = $(this).prev().prev().prev().text();
    let totalprice = parseInt($('.total-item-price').text());
    let priceStr = $('ul.append-area li.'+ weight + ' .price .prd-price:nth-child(4)').text();
    const price = parseInt(priceStr.substring(1, priceStr.length-1));
    const amount = parseInt($('ul.append-area li.'+ weight + ' .price .quantity-box input').val());
    $('.total-item-price').text(totalprice - (price*amount));

    $('.prd-info-wrap .option-wrap .option button.'+ weight + '').attr('aria-checked', 'false');
    $(this).closest('li').remove();
  });

  $(document).on('click', 'button.basket.pop-open', function (event){
    if($('.total-item-price').text()=='0'){
      alert('상품 필수옵션을 선택해 주세요.');
    }else{
      let pid1 = new Array();
      $('input[name="pid"]').each(function (index, item){
        pid1.push($(item).val());
      });

      let psid1 = new Array();
      $('input[name="psid"]').each(function (index, item){
        psid1.push($(item).val());
      });

      let amount1 = new Array();
      $('input[name="amount"]').each(function (index, item){
        amount1.push($(item).val());
      });

      console.log(pid1)
      console.log(psid1)
      console.log(amount1)

      $.ajax({
        url:"/Lush/products/cart.json",
        dataType:"text",
        type:"POST",
        data: {
          pid : pid1,
          psid : psid1,
          amount : amount1
        },
        cache:false ,
        success: function ( data,  textStatus, jqXHR ){

        },
        error:function (){
          alert("에러~~~ ");
        }
      });

      $('.dimmed').addClass('on');
      $('.popup.cart#op-layer-cart').css('display', 'block');
    }
  });

  $(document).on('click', 'button.pop-close', function (event){
    $('.dimmed').removeClass('on');
    $(this).closest('.popup').css('display', 'none');
  });

  $(document).on('click', 'button.black-btn.buy', function (event){
    if($('.total-item-price').text()=='0'){
      alert('상품 필수옵션을 선택해 주세요.');
    }else{
      $('form#cartForm').submit();
    }
  });
</script>
<script>
  // 리뷰
  let val = 0;
  $(document).on('click', '.review-title button.pop-open', function (){
    $('.dimmed').addClass('on');
    $('.dimmed #reviewWritePop').show();
  });

  $('button.popup-close-btn').click(function (){
    $('.grade-box button').removeClass('on');
    $('textarea#content').val('');
    $('ul.file-tree li').remove();
    $('label.file-btn').remove();
    $('input[type="file"]').remove();
    $('.upload-box').append('<label for="reviewFiles' + val +'" class="file-btn"><span>파일선택</span></label>' +
            '<input type="file" id="reviewFiles' + val +'" name="reviewFiles' + val +'" hidden="" accept=".png, .jpg"/>');
    $('.dimmed').removeClass('on');
    $('.dimmed #commentRegistPopup').hide();
  });

  $('button.pop-change.border-btn').click(function (){
    $('.grade-box button').removeClass('on');
    $('textarea#content').val('');
    $('ul.file-tree li').remove();
    $('label.file-btn').remove();
    $('input[type="file"]').remove();
    $('.upload-box').append('<label for="reviewFiles' + val +'" class="file-btn"><span>파일선택</span></label>' +
            '<input type="file" id="reviewFiles' + val +'" name="reviewFiles' + val +'" hidden="" accept=".png, .jpg"/>');
    $('.dimmed').removeClass('on');
    $('.dimmed #commentRegistPopup').hide();
  });

  $(document).on('click', '.grade-box button', function (){
      $(this).prevAll().addClass('on');
      $(this).addClass('on');
      $(this).nextAll().removeClass('on');
      $('form#itemReview input#score').val($(this).attr('data-avg'));
  });

  $(document).on('change','input[type="file"]',function (event){
    var n = $('.upload-box ul.file-tree li').length;
    if (n>=5){
      alert("이미지파일은 5개까지만 올릴 수 있습니다.")
    }else{
      $('.upload-box ul.file-tree').append('<li><div class="input-wrap"><input id="file' + val +'" type="text" readonly>' +
              '<button id="delFile" type="button" value="'+val+'"></button>' +
              '</div></li>');
      var files = $('input#reviewFiles'+ val)[0].files[0];
      $('#file'+val).val(files.name);
      val++;
      $('.upload-box label').hide();

      $('.upload-box').append('<label for="reviewFiles' + val +'" class="file-btn"><span>파일선택</span></label>' +
              '<input type="file" id="reviewFiles' + val +'" name="reviewFiles' + val +'" hidden="" accept=".png, .jpg"/>');
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
    $('input#reviewFiles'+ $(this).val() +'[type="file"]').remove();
    $('label[for="reviewFiles'+$(this).val()+'"]').remove();
  });

  $('button#submit_productReview').click(function (){
    if ($('form#itemReview input#score').val() == 0){
      alert("평점을 입력해주세요.");
    }else if($('textarea#content').val() === ''){
      alert("내용을 입력해주세요.");
    }else{
      $('form#itemReview').submit();
    }

  });

  $(document).on('click','button#updateReview', function (event) {
    $('.dimmed').addClass('on');
    $('.dimmed #reviewWritePop').show();
    // <input type="text" id="rid" value="'+item.eventReview.er_id+'" hidden>
    $('form#itemReview input[name="reviewID"]').val($(this).next().next().val());
    $('form#itemReview input[name="btnval"]').val(1);
  });
  $(document).on('click','button#delReview', function (event) {
    $('form#itemReview input[name="reviewID"]').val($(this).next().val());
    console.log($(this).next().val());
    $('form#itemReview input[name="btnval"]').val(2);
    $('form#itemReview').submit();
  });
</script>
<script>
  function page(num){
    $.ajax({
      url:"/Lush/products/review.json" ,
      dataType:"json",
      type:"GET",
      data: {
        currentPage : num,
        productID : <%=pid%>
      },
      cache:false ,
      success: function ( data,  textStatus, jqXHR ){
        $('.paginate ul li a').removeClass('num on');
        $('.paginate ul li a#pagenum'+num).addClass('num on');
        $('.review-wrap ul li').remove();
        $.each(JSON.parse(JSON.stringify(data)), function (index, item){
          // console.log(index + ' : ' + item.eventReview.er_id);
          $('.review-wrap ul').append('<li><div class="review-top">' +
                  '<span class="writer"><img src="../images/ico/stars'+ item.productReview.pdr_grade +'.svg"><span>'+ item.member.name +'</span></span>' +
                  '<span class="date">'+item.productReview.pdr_date+'</span></div><p class="subject"></p>');

          $('.review-wrap ul li:nth-child('+(index+1)+')').append('<div class="review-container flex top"><div id="imageSize" class="review-contents cut">' +
                  '<p>'+item.productReview.pdr_content+'</p>');

          //로그인 비교 후 같으면 append
          $('.review-wrap ul li:nth-child('+(index+1)+') .review-container div#imageSize').append('<div class="review-btn"><button type="button" id="updateReview">수정</button>' +
                  '<button type="button" id="delReview">삭제</button>' +
                  ' <input type="text" id="rid" value="'+item.productReview.pdr_id+'" hidden></div>');

            if (item.imgPath != null) {
              for (var num in item.imgPath) {
                $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container div#imageSize').append('<img src="/Lush/upload/products/' + item.imgPath[num] + '" alt="리뷰 상세 이미지">');
              }
              $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container div#imageSize').append('<button type="button" class="no-cut" style="display: block">더보기</button></div>');
            }
            $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container').append('<div class="review-side">');

            if (item.imgPath != null){
              $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container .review-side').append('<div class="review-thumbnail" style="display: block">' +
                      '<img src="/Lush/upload/products/' + item.imgPath[0] + '" alt="리뷰 상세 이미지"><span>+'+ item.imgPath.length + '</span></div>');
            }
            $('.review-wrap ul li:nth-child(' + (index+1) + ') .review-container .review-side').append('<button type="button" class="minimum-btn" style="display: none"><img src="../images/ico/arrow_up_gray.svg" alt="닫기 버튼"></button></div></div></li>');
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
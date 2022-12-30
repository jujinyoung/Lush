<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
  String categoriesID = request.getParameter("categoriesID");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/index_style.css" type="text/css">
  <link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <title>러쉬</title>
</head>
<body>
<section id="list">
  <!-- 서브페이지 탑배너 -->
  <article class="top-visual">
    <div class="flex center">
      <c:set var="categoriesID" value="<%=categoriesID%>"></c:set>
      <c:forEach var="top" items="${categoriesTops}">
        <c:if test="${top.categories.pc_id eq categoriesID}">
          <c:choose>
            <c:when test="${top.categories.pc_cate2 == '전체'}">
              <h2 class="category-title">${top.categories.pc_cate1}</h2>
            </c:when>
            <c:otherwise>
              <h2 class="category-title">${top.categories.pc_cate2}</h2>
            </c:otherwise>
          </c:choose>
          <p class="category-sub">찬란히 빛나는 물결에 부드럽게 몸을 맡겨 보세요</p>
        </c:if>
      </c:forEach>
    </div>
    <img src="../images/categories/<%=categoriesID%>.jpg" alt="배쓰 밤">
  </article>
  <!-- 서브페이지 탑배너 //-->
  <form id="itemParam" action="/Lush/categories/index.do" method="get">
    <input type="hidden" name="categoriesID" value="<%=categoriesID%>">
    <input type="hidden" name="selectStatus" value="2">
  </form><!-- 제품리스트 -->
  <article class="prd-list">
    <div class="inner">
      <div class="list-top flex">
        <!-- 리스트 상단 제품 카테고리 -->
        <ul class="prd-sort">
          <c:forEach var="top" items="${categoriesTops}">
            <c:choose>
              <c:when test="${top.categories.pc_id eq categoriesID}">
                <li><a class="on" href="/Lush/categories/index.do?categoriesID=${top.categories.pc_id}">${top.categories.pc_cate2} (${top.categories2Record})</a></li>
              </c:when>
              <c:otherwise>
                <li><a href="/Lush/categories/index.do?categoriesID=${top.categories.pc_id}">${top.categories.pc_cate2} (${top.categories2Record})</a></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </ul>

        <!-- 리스트 상단 필터 -->
        <div class="select-box short">
          <a href="javascript:;" class="selected-value">인기순</a>
          <ul id="listFilter" class="option-box">
            <li id="recommend">추천순</li>
            <li id="hits">인기순</li>
            <li id="low-price">낮은 가격순</li>
            <li id="high-price">높은 가격순</li>
            <li id="review">리뷰많은순</li>
          </ul>
        </div>
        <!-- 리스트 상단 필터 //-->
      </div>

      <c:choose>
        <c:when test="${not empty productDetails}">
          <div class="list">
            <c:set var="aaa" value="${fn:length(productDetails) div 4}"></c:set>
            <fmt:parseNumber var="wrapHeight" value="${aaa + (1-aaa)%1}" integerOnly="true" />
            <ul class="list-wrap" style="position: relative; width: 1224px; height: ${wrapHeight *464}px;">
              <c:forEach var="product" items="${productDetails}" varStatus="status">
                <fmt:parseNumber var="height" value="${status.index div 4}" integerOnly="true"/>
                <c:choose>
                  <c:when test="${product.productSangse.amount eq 0}">
                    <li class="list-item sold-out" style="position: absolute; left: ${status.index mod 4 * 312}px; top: ${height *464}px;">
                  </c:when>
                  <c:otherwise>
                    <li class="list-item" style="position: absolute; left: ${status.index mod 4 * 312}px; top: ${height *464}px;">
                  </c:otherwise>
                </c:choose>
                <div class="item">
                  <a href="/Lush/products/view.do?productID=${product.product.pd_id}" class="prd-img-box">
                    <img src="../images/products/${product.product.pd_id}.png" class="prd-img" alt="${product.product.pd_name}">
                  </a>
                  <div class="tag-box flex center">
                    <c:choose>
                      <c:when test="${product.productSangse.amount eq 0}">
                        <a href="javascript:;" class="sold-out">품절</a>
                      </c:when>
                      <c:otherwise>
                        <c:if test="${product.product.pd_vegan eq 1}">
                          <a href="javascript:;">
                            <image src="../images/categories/vegan.png" alt="비건" />
                          </a>
                        </c:if>
                        <c:if test="${product.product.pd_event eq 1}">
                          <a href="javascript:;">
                            <image src="../images/categories/event.png" alt="크리스마스" />
                          </a>
                        </c:if>
                        <c:if test="${product.product.pd_domestic eq '한국'}">
                          <a href="javascript:;">
                            <image src="../images/categories/domestic.png" alt="국내제조" />
                          </a>
                        </c:if>
                        <c:if test="${product.dateIsCheck}">
                          <a href="javascript:;">
                            <image src="../images/categories/new.png" alt="신규제품" />
                          </a>
                        </c:if>
                      </c:otherwise>
                    </c:choose>
                  </div>
                  <a href="/Lush/products/view.do?productID=${product.product.pd_id}" class="name">${product.product.pd_name}</a>
                  <a href="/Lush/products/view.do?productID=${product.product.pd_id}" class="cate">${product.product.pd_cate3}</a>
                  <a href="/Lush/products/view.do?productID=${product.product.pd_id}" class="price">￦ ${product.productSangse.price}</a>
                  <div class="item-mask"></div>
                </div>
                <div class="buttons">
                  <button type="button" name="likeBtn" class="like">좋아요</button>
                  <button type="button" name="cartBtn" class="basket">장바구니 담기</button>
                </div>
                </li>
              </c:forEach>
            </ul>
          </div>

          <div class="paginate">
            <ul>
              <c:if test="${pageBlock.prev}">
                <li class="first"><a href="/Lush/categories/index.do?categoriesID=<%=categoriesID%>&selectStatus=${selectStatus}&currentPage=${pageBlock.startOfPageBlock-1}"> &laquo; </a></li></c:if>
              <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
                <c:choose>
                  <c:when test="${pageBlock.currentPage eq i}">
                    <li><a href="#" class="num on">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="/Lush/categories/index.do?categoriesID=<%=categoriesID%>&selectStatus=${selectStatus}&currentPage=${i}">${i}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${pageBlock.next}">
                <li class="last"><a href="/Lush/categories/index.do?categoriesID=<%=categoriesID%>&selectStatus=${selectStatus}&currentPage=${pageBlock.endOfPageBlock+1}"> &raquo; </a></li>
              </c:if>
            </ul>
          </div>
        </c:when>
        <c:otherwise>
          <div class="empty big">
            <p>등록된 제품이 없습니다.</p>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </article>

</section>

<script>
  $('.list-top .select-box').on('click', function (event){
    if($(this).hasClass("on") == true){
      $(this).removeClass('on');
    }else{
      $(this).addClass('on');
    }
  });

  $('ul#listFilter li').on('click', function (event){
      let value = 2;
      if($(this).attr('id') === 'recommend'){
        value = 1;
      }else if($(this).attr('id') === 'hits'){
        value = 2;
      }else if($(this).attr('id') === 'low-price'){
        value = 3;
      }else if($(this).attr('id') === 'high-price'){
        value = 4;
      }else if($(this).attr('id') === 'review'){
        value = 5;
      }
      $('form#itemParam input[name="selectStatus"]').val(value);
      $('form#itemParam').submit();
  });

  $(document).ready(function (){
    var a = ${selectStatus}
    var selectValue = $('ul#listFilter li:nth-child('+a+')').text();
    $('.list-top .select-box .selected-value').text(selectValue);
  });


</script>
</body>
</html>
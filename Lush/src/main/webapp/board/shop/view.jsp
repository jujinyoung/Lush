<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
    int proceedRecords = (int) request.getAttribute("proceedRecords");
    int endRecords = (int) request.getAttribute("endRecords");
    int spId = (int) request.getAttribute("spId");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>러쉬코리아</title>
	<link rel="stylesheet" href="../css/shop_style.css" type="text/css">
	<link rel="icon" type="image/png" sizes="192x192" href="../../images/ico/fabicon.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
	
	<section id="shop-list" style="padding-top: 128px;">
		<article class="top-visual">
			<div class="flex center">
				<h2 class="category-title">매장안내</h2>
					<p class="sub"></p>
			</div>
			<img src="../../images/shop/shop_benner.jpg" alt="매장안내">
		</article>
		<article>
			<div class="inner">
				<form id="lushBoardSearchParam" action="/Lush/board/shop.do" method="get">
		        	<div class="board-search-wrap">
			            <input id="where1" name="searchCondition" checked="checked" type="radio" value="1">
			            <label for="where1">매장명</label>
			            <input id="where2" name="searchCondition" type="radio" value="2">
			            <label for="where2">주소</label>
			            <input name="searchWord" type="text" placeholder="검색 단어를 입력해 주세요." value="<%=searchWord%>">
			            <input id="Pid" name="Pid" type="hidden" value="1">
			            <button type="submit" class="black-btn">검색</button>
		        	</div>
	    		</form>
	    		<div class="tab-cont">
	    			<div class="tab-inner on">
	   	 				<div class="board-read">
	   	 					<div class="board-contents">
	   	 						<div class="board-img-wrap">
	   	 							<div class="shop-detail">
	   	 								<article class="shop-wrap">
	   	 									<div class="inner">
	   	 										<div class="shop-contents">
	   	 											<div class="shop-img-wrap">
   	 													<img src="../../images/shop/shop_<%= spId %>.jpg" alt="매장 상세 사진">
	   	 											</div>
	   	 											<div class="shop-summary">
	   	 												<c:forEach items="${ shops }" var="dto">
	   	 													<h3><c:out value="${ dto.sp_name }"/></h3>
	   	 												</c:forEach>
	   	 											</div>
	   	 											<table class="list-table">
									                    <colgroup>
									                        <col width="208px">
									                        <col width="auto">
									                    </colgroup>
									                    <tbody>
									                    	<c:choose>
					   											<c:when test="${ not empty shops }">
					   												<tr>
											                            <th>운영시간</th>
											                            <td>
											                            	<c:forEach items="${ shops }" var="dto">
														                        <p>${ dto.sp_bhour1 }</p>
														                        <p>${ dto.sp_bhour2 }</p>
											                            	</c:forEach>
											                            </td>
											                        </tr>
											                        <tr>
											                        	<c:forEach items="${ shops }" var="dto">
												                            <th>전화</th>
												                            <td>${ dto.sp_tel }</td>
												                        </c:forEach>
											                        </tr>
											                        <tr>
											                            <th>주소</th>
											                            <td>
											                            	<c:forEach items="${ shops }" var="dto">
												                                <p>${ dto.sp_adr_k }</p>
												                                <c:choose>
													                                <c:when test="${not empty dto.sp_adr_e }">
														                                <p>${ dto.sp_adr_e }</p><a href="${ dto.sp_map }" class="go-map" target="_blank">지도보기</a>
													                                </c:when>
													                                <c:otherwise>
													                                	<p>&nbsp;</p>
													                                </c:otherwise>
												                                </c:choose>
											                                </c:forEach>
											                            </td>
											                        </tr>
											                        <tr>
											                            <th>SNS</th>
											                            <td>
											                            	<c:forEach items="${ shops }" var="dto">
												                                <c:choose>
													                                <c:when test="${not empty dto.sp_sns }">
														                                <p>${ dto.sp_sns }</p>
													                                </c:when>
													                                <c:otherwise>
													                                	<p>&nbsp;</p>
													                                </c:otherwise>
												                                </c:choose>
												                            </c:forEach>
											                            </td>
											                        </tr>
											                        <tr>
											                            <th>소개</th>
											                            <td>
											                            	<c:forEach items="${ shops }" var="dto">
												                                <c:choose>
													                                <c:when test="${not empty dto.sp_info }">
														                                <p>${ dto.sp_info }</p>
													                                </c:when>
													                                <c:otherwise>
													                                	<p>&nbsp;</p>
													                                </c:otherwise>
												                                </c:choose>
												                            </c:forEach>
											                            </td>
											                        </tr>
					   											</c:when>
					   											<c:otherwise>
										             				<tr>
											                            <th>데이터가 없습니다.</th>
											                        </tr>
										          				</c:otherwise>
					   										</c:choose>
									                    </tbody>
									                </table>
	   	 										</div>
	   	 									</div>
	   	 								</article>
	   	 								<article class="shop-notice">
	   	 									<div class="inner">
	   	 										<div class="shop-notice-banner">
   	 												<img src="../../images/shop/shop_notice_banner.png" alt="손을 씻고 싶을 때 언제든 매장을 들러주세요.">
   	 												<p class="comment">손을 씻고 싶을 때 언제든 매장을 들러주세요.</p>
	   	 										</div>
	   	 									</div>
	   	 								</article>
	   	 							</div>
	   	 						</div>
	   	 						<div class="btn-wrap right medium" style="margin-top: 0px;">
	   	 							<a href="javascript:goList();" class="border-btn">목록</a>
	   	 						</div>
   	 						</div>
 	 					</div>
	       			</div>
				</div>
			</div>
		</article>
	</section>
	
	<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
	
	<script>
		function goList() {
			$('#lushBoardSearchParam').submit();
		}
	</script>
</body>
</html>
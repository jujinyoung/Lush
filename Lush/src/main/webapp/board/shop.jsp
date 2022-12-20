<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/inc/include.jspf" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>러쉬 매장안내</title>
	<link rel="stylesheet" href="css/shop_style.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<section id="shop-list" style="padding-top: 128px;">
		<article class="top-visual">
			<div class="flex center">
				<h2 class="category-title">SHOP INFORMATION</h2>
					<p class="sub"></p>
			</div>
			<img src="https://www.lush.co.kr/upload/shop/20220215110847L.jpg" alt="매장안내">
		</article>
		<article>
			<form action="/board/shop" method="get">
	        	<div class="board-search-wrap">
		            <input id="shop_name" name="shopname" checked="checked" type="radio" value="CONT_SUBJECT">
		            <label for="shop_name">매장명</label>
		            <input id="shop_adr" name="shopadr" type="radio" value="CONTENT_PC">
		            <label for="shop_adr">주소</label>
		            <input name="search" type="text" placeholder="검색 단어를 입력해 주세요.">
		            <button type="submit" class="black-btn">검색</button>
	        	</div>
	        	<div><input type="hidden" name="_csrf" value=""></div>
    		</form>
    		<div class="article-list">
                        <div class="inner">
                        <ul class="list-thumb">
                                <li>
                                    <a href="javascript:goView('/board/shop/1000756');" class="article-thumb">
                                        <img src="/upload/shop/20221108131842L.jpg" alt="롯데백화점 강남점">
                                    </a>
                                    <a href="javascript:goView('/board/shop/1000756');" class="article-title">롯데백화점 강남점</a>
                                </li>
                                <li>
                                    <a href="javascript:goView('/board/shop/2679');" class="article-thumb">
                                        <img src="/upload/shop/20220803141015L.jpg" alt="스타필드 안성점">
                                    </a>
                                    <a href="javascript:goView('/board/shop/2679');" class="article-title">스타필드 안성점</a>
                                </li>
                                <li>
                                    <a href="javascript:goView('/board/shop/2678');" class="article-thumb">
                                        <img src="/upload/shop/20220722180807L.jpg" alt="신세계백화점 대전점">
                                    </a>
                                    <a href="javascript:goView('/board/shop/2678');" class="article-title">신세계백화점 대전점</a>
                                </li>
                                <li>
                                    <a href="javascript:goView('/board/shop/2677');" class="article-thumb">
                                        <img src="/upload/shop/20220722180705L.jpg" alt="롯데백화점 동탄점">
                                    </a>
                                    <a href="javascript:goView('/board/shop/2677');" class="article-title">롯데백화점 동탄점</a>
                                </li>
                                <li>
                                    <a href="javascript:goView('/board/shop/2676');" class="article-thumb">
                                        <img src="/upload/shop/20220722180400L.jpg" alt="현대백화점 압구정 본점">
                                    </a>
                                    <a href="javascript:goView('/board/shop/2676');" class="article-title">현대백화점 압구정 본점</a>
                                </li>
                                <li>
                                    <a href="javascript:goView('/board/shop/2675');" class="article-thumb">
                                        <img src="/upload/shop/20220725152252L.jpg" alt="롯데백화점 영등포점">
                                    </a>
                                    <a href="javascript:goView('/board/shop/2675');" class="article-title">롯데백화점 영등포점</a>
                                </li>
                                </ul>
                            
 



<div class="paginate">
	<ul>
		

		

		

		
			

			

			

			
				
					
						
							<li><a href="javascript:;" class="num on">1</a></li>
						
						
					
				
					
						
						
							<li><a href="/board/shop?page=2" class="num">2</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=3" class="num">3</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=4" class="num">4</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=5" class="num">5</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=6" class="num">6</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=7" class="num">7</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=8" class="num">8</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=9" class="num">9</a></li>
						
					
				
					
						
						
							<li><a href="/board/shop?page=10" class="num">10</a></li>
						
					
				
			

			

			
		

		
			<li class="next"><a href="/board/shop?page=2"><img src="/content/renewal/pc/images/ico/page_next.svg" alt="다음 페이지로"></a></li>
			<li class="last"><a href="/board/shop?page=12"><img src="/content/renewal/pc/images/ico/page_last.svg" alt="마지막 페이지로"></a></li>
		
		
</ul></div></div>
                    </div>
		</article>
	</section>
	
</body>
</html>
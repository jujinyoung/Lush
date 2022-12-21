<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러쉬코리아</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>

a:hover, a:focus, a:visited, a:active {
    text-decoration: none;
}

script{
	display: none;
}


footer{
	display: block;
	position: relative;
	background: #000;
	margin-top: 160px;
}

footer .core{
	width: 100%;
	height: 140px;
	background: #f2f2f2;
	text-align: center;
	padding: 15px 0;
}

footer .core ul {
	max-width: 1070px;
	margin: 0 auto;
}

footer .footer-left .input-wrap input{
	border:none;
	width: 392px;
	height: 32px;
	line-height: 32px;
	background: #222;
	color: #949494;
	font-size: 14px;
	padding: 0 30px 0 70px;
}

button, input[type="button"], input[type="submit"], input[type="reset"], input[type="file"] {
    -webkit-appearance: button;
    border-radius: 0;
    outline: none;
    cursor: pointer;
    border: none;
    background: none;
    font-size: 1em;
}

footer *{
	color: #fff;
}

footer .footer-left .input-wrap button {
    position: absolute;
    right: 7px;
    top: 0;
    background: #222;
    color: #fff;
    width: 30px;
    height: 32px;
    line-height: 32px;
    border: none;
    cursor: pointer;
    font-size: 14px;
}

footer .footer-wrap{
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding: 64px 0 64px 0;
}

footer .footer-left .link {
    display: inline-block;
    margin-left: 6px;
    border-bottom: 1px solid #fff;
}

footer .footer-left{
	margin-right: 220px;
}

footer .footer-left > p {
    margin: 12px 0 56px 0;
    letter-spacing: -0.39px;
    font-weight: 300;
    line-height: 22px;
}



footer .footer-right .notice li a {
    font-size: 14px;
    line-height: 22px;
    letter-spacing: -0.39px;
    font-weight: 300;
}

footer .footer-right .notice li a span{
	display: inline-block;
    margin-right: 5px;
    font-weight: 300;
}

footer .footer-right .notice li a .footer-ico {
    position: absolute;
    margin: 5px 0 0 4px;
}

footer .footer-right .footer-menu a {
    font-weight: 300;
}

footer .footer-right .footer-menu li strong {
    font-weight: 400;
    color: #fbe85e;
}

footer .footer-right .info .bar {
    margin: 0 6px;
}

footer .footer-right .info *, footer .footer-right .copyright {
    font-size: 14px;
    color: #a7a7a7;
    line-height: 22px;
    letter-spacing: -0.39px;
    font-weight: 300;
}

footer .footer-left .cscenter li strong {
    font-weight: 500;
}

footer .footer-left .cscenter li * {
    display: block;
    font-weight: 300;
}

footer .quick-menu ul li .quick-times {
    background: #222 url(../images/lushtimes/btn_times.png) no-repeat center center;
}

footer .quick-menu ul li a, footer .quick-menu ul li button {
    width: 56px;
    height: 56px;
    box-shadow: 0px 4px 4px rgb(0 0 0 / 25%);
    display: inline-block;
    position: relative;
    text-align: center;
    font-size: 0;
    text-indent: -9999px;
    border-radius: 50%;
}

footer .quick-menu ul li .quick-top {
    background: #222 url(../images/ico/ico_footer_top.svg) no-repeat center center;
}

footer .quick-menu ul li a, footer .quick-menu ul li button {
    width: 56px;
    height: 56px;
    box-shadow: 0px 4px 4px rgb(0 0 0 / 25%);
    display: inline-block;
    position: relative;
    text-align: center;
    font-size: 0;
    text-indent: -9999px;
    border-radius: 50%;
}

.flex {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

ol, ul, dl {
	list-style: none;
}

ul {
    list-style-type: disc;
}

li{
	list-style: none;
}

a{
	text-decoration: none;
	color: #222;
}

img{
	border:0;
	vertical-align: middle;
	overflow-clip-margin: content-box;
	overflow: clip;
}

input{
	-webkit-border-radius:0;
	vertical-align: middle;
	writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: fieldtext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: field;
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}

button {
    appearance: auto;
    writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    box-sizing: border-box;
    background-color: buttonface;
    margin: 0em;
    padding: 1px 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonborder;
    border-image: initial;
}

input[type="email" i]{
	padding: 1px 2px;
}

input, textarea, select{
	letter-spacing: normal;
}

*{
	box-sizing: border-box !important;
}
*{
	-webkit-text-size-adjust: none;
	text-shadow: none !important;
}

body{
	font-size: 16px;
	font-family: 'NotoSans';
	color: #222;
	font-weight: 400;
}

.body1 {
    font-size: 16px;
    line-height: 24px;
}

.body2 {
    font-size: 14px;
    line-height: 20px;
}

b, strong {
    font-weight: 700;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select{
	margin:0;
	padding: 0;
	font-family: 'NotoSans', dotum, '돋움';
	color: #222;	
}

footer .footer-right .notice li a .footer-ico {
    position: absolute;
    margin: 5px 0 0 4px;
}

footer .quick-menu ul li .quick-times {
    background: #222 url(../images/lushtimes/btn_times.png) no-repeat center center;
}

footer .quick-menu ul li .quick-kakao {
    background: #fae100 url(../images/ico/ico_footer_kakao.svg) no-repeat top 15px center;
    background-size: 32px auto;
    transition: all .15s;
}

footer .quick-menu ul li .quick-top {
    background: #222 url(../images/ico/ico_footer_top.svg) no-repeat center center;
}	

footer .quick-menu ul li a, footer .quick-menu ul li button {
    width: 56px;
    height: 56px;
    box-shadow: 0px 4px 4px rgb(0 0 0 / 25%);
    display: inline-block;
    position: relative;
    text-align: center;
    font-size: 0;
    text-indent: -9999px;
    border-radius: 50%;
}

footer .core ul img {
    width: 136px;
}

a[href^="tel"] {
    font-style: normal;
}

html {
    -webkit-user-select: none;
    -webkit-touch-callout: none;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

</style>
</head>
<body>

<!-- <h3>footer.jsp</h3> -->

<footer id="footer">
	<div class="core">
		<ul class="flex">
			<li><a href="javascript:;" style="cursor: default;"><img src="/upload/mainCoreValue/20211018160815M.png" alt="" /></a></li>
			<li><a href="javascript:;" style="cursor: default;"><img src="/upload/mainCoreValue/20211018160705M.png" alt="" /></a></li>
			<li><a href="javascript:;" style="cursor: default;"><img src="/upload/mainCoreValue/20211018160646M.png" alt="" /></a></li>
			<li><a href="javascript:;" style="cursor: default;"><img src="/upload/mainCoreValue/20211018160449M.png" alt="" /></a></li>
			<li><a href="javascript:;" style="cursor: default;"><img src="/upload/mainCoreValue/20211018160436M.png" alt="" /></a></li>
			<li><a href="javascript:;" style="cursor: default;"><img src="/upload/mainCoreValue/20211018160328M.png" alt="" /></a></li>
		</ul>
	</div>
	<div class="footer-wrap">
		<div class="footer-left">
			<div class="input-wrap">
				<input type="email" id="footerEmail" name placeholder="이메일 주소를 입력해주세요">
				<button type="button" id="footerEmailBtn">구독</button>
			</div>
			<p class="body2">
				"매주 월요일 오후, 구독자님을 위한 제품과 브랜드 이야기를 전해 드립니다. "
				<br>
				"구독은 언제든지 해지하실 수 있습니다. "
				<a href="/email-subscrib-preview" class="link">미리보기</a>
			</p>
			<ul class="cscenter">
				<li>
					<strong class="body1">고객센터</strong>
					<a href="tel:16442357" class="tel">
						<strong>1644-2357</strong>
					</a>
					<a href="mailto:webmaster@lush.co.kr" class="email">webmaster@lush.co.kr</a>
					<p class="body2">
						<span>
							"상담전화 13:00 ~ 16:00(평일) "
							<br>
							"상담톡 10:00 ~ 16:00(평일) "
						</span>
					</p>
				</li>
				<li>
					<strong class="body1">기업선물</strong>
					<a href="tel:07047138543" class="tel">
						<strong>070-4713-8543</strong>
					</a>
					<a href="mailto:order@lush.co.kr" class="email">order@lush.co.kr</a>
				</li>
			</ul>
			<ul class="sns">
				<li><a href="https://twitter.com/LUSHKOREA" target="_blank"><img src="/content/renewal/mobile/images/ico/ico_twitter.png" alt="러쉬 트위터 바로가기" style="width:40px" /></a></li>
				<li><a href="https://www.instagram.com/lushkorea" target="_blank"><img src="/content/renewal/mobile/images/ico/ico_insta.svg" alt="러쉬 인스타그램 바로가기" ></a></li>
				<li><a href="https://www.youtube.com/user/LUSHKOREA1" target="_blank"><img src="/content/renewal/mobile/images/ico/ico_youtube.svg" alt="러쉬 유튜브 바로가기"></a></li>
				<li><a href="https://pf.kakao.com/_VEbUM" target="_blank"><img src="/content/renewal/mobile/images/ico/ico_kakao.svg" alt="러쉬 카카오플러스 바로가기"></a></li>
				<li><a href="https://m.post.naver.com/lushkr1" target="_blank"><img src="/content/renewal/mobile/images/ico/ico_naver.svg" alt="러쉬 네이버 바로가기"></a></li>
			</ul>
		</div>
		<div class="footer-right">
			<p class="body1">공지 사항</p>
			<ul class="notice">
				<li>
					<a href="/mypage/view/1931">
					<span>2022-12-21</span>
					"[공지] 연말 택배 물량 증가 배송 지연 안내"
					<img src="/content/renewal/pc/images/ico/ico_new.svg" alt="새글 아이콘" class="footer-ico" />
					</a>
				</li>
				<li>
					<a href="/mypage/view/1929">
					<span>2022-11-22</span>
					"네이버페이 결제 시, 덕찌 발급 재개 안내"
					<img src="/content/renewal/pc/images/ico/ico_new.svg" alt="새글 아이콘" class="footer-ico" />
					</a>
				</li>
			</ul>
			<ul class="footer-menu">
				<li><a href="/service/introduction">러쉬소개</a></li>
				<li><a href="/service/policy?policyType=2" target="_blank"><strong>개인정보처리방침</strong></a></li>
				<li><a href="/mypage/faq">FAQ</a></li>
				<li><a href="/service/badge">커뮤니티</a></li>
				<li><a href="/service/policy?policyType=4" target="_blank">영상정보관리지침</a></li>
				<li><a href="/mypage/inquiry">1:1문의</a></li>
				<li><a href="/mypage/noticeList?noticeType=2">채용안내</a></li>
				<li><a href="/service/policy?policyType=3" target="_blank">이용약관</a></li>
			</ul>
			<ul class="info">
				<li class="address">
					서울 강남구 학동로 336 (메이트리 빌딩(matree B/D))&nbsp;1층 주식회사 러쉬코리아
				</li>
				<li>
					"사이트 운영자: 주식회사 러쉬코리아"
					<span class="bar">|</span>
					" 대표회사: 우미령"
				</li>
				<li>
					"사업자 등록번호: 201-81-77964"
					<a href="javascript:window.open('https://www.ftc.go.kr/bizCommPop.do?wrkr_no=2018177964&apv_perm_no=', '', 'width=1024, height=800');">사업자정보확인</a>
				</li>
				<li>
					"통신판매업 신고번호: 2022-서울강남-02857"
					<span class="bar">|</span>
					" 개인정보보호책임자: 신상훈"
				</li>
			</ul>
			<p class="copyright">COPYRIGHT © LUSHKOREA.CO.LTD.ALL RIGHTS RESERVED.</p>
		</div>
	</div>
	<div class="quick-menu">
		<ul>
			<!-- 20220725 러쉬타임즈 메뉴 추가 -->
			<li>
				<a href="/service/lushtimes_2022_winter" class="quick-times" target="_blank">러쉬 타임즈</a>
			</li>
			<!-- 20220725 러쉬타임즈 메뉴 추가 // -->
			<li>
				<a href="javascript:window.open('/common/kakao-chat', 'kakao-chat', 'width=1024, height=800');" class="quick-kakao">카카오플러스</a>
			</li>
			<li>
				<button type="button" class="quick-top">상단으로 이동</button>
			</li>
		</ul>
	</div>
	<!-- 220520 네이버페이 스크립트 추가 -->
	<script type="text/javascript">wcs_do();</script>
	<!-- 220520 네이버페이 스크립트 추가 // -->
	<script type="text/javascript">
		(function(w, d, a) {
			w.__beusablerumclient__ = {
				load : function(src) {
					var b = d.createElement("script");
					b.src = src;
					b.async = true;
					b.type = "text/javascript";
					d.getElementsByTagName("head")[0].appendChild(b);
				}
			};
			w.__beusablerumclient__.load(a + "?url="
					+ encodeURIComponent(d.URL));
		})(window, document, "//rum.beusable.net/load/b170409e144350u776");
	</script>
	<!-- ACE_Trader_Script -->
	<script type="text/javascript" src="//static.tagmanager.toast.com/tag/view/1328"></script>
	<script type="text/javascript">
		window.ne_tgm_q = window.ne_tgm_q || [];
		window.ne_tgm_q.push({
			tagType : 'visit',
			device : 'mobile'/*web, mobile, tablet*/,
			uniqValue : '',
			pageEncoding : 'utf-8'
		});
	</script>
	<!-- ACE_Trader_Script // -->
	<!-- AceCounter Mobile WebSite Gathering Script V.8.0.2019080601 -->
	<script type="text/javascript">
		var _AceGID = (function() {
			var Inf = [ 'www.lush.co.kr', 'www.lush.co.kr', 'AZ3A75429', 'AM',
					'0', 'NaPm,Ncisy', 'ALL', '0' ];
			var _CI = (!_AceGID) ? [] : _AceGID.val;
			var _N = 0;
			if (_CI.join('.').indexOf(Inf[3]) < 0) {
				_CI.push(Inf);
				_N = _CI.length;
			}
			return {
				o : _N,
				val : _CI
			};
		})();
		var _AceCounter = (function() {
			var G = _AceGID;
			var _sc = document.createElement('script');
			var _sm = document.getElementsByTagName('script')[0];
			if (G.o != 0) {
				var _A = G.val[G.o - 1];
				var _G = (_A[0]).substr(0, _A[0].indexOf('.'));
				var _C = (_A[7] != '0') ? (_A[2]) : _A[3];
				var _U = (_A[5]).replace(/\,/g, '_');
				_sc.src = 'https:' + '//cr.acecounter.com/Mobile/AceCounter_'
						+ _C + '.js?gc=' + _A[2] + '&py=' + _A[1] + '&up=' + _U
						+ '&rd=' + (new Date().getTime());
				_sm.parentNode.insertBefore(_sc, _sm);
				return _sc.src;
			}
		})();
	</script>
	<!-- AceCounter Mobile Gathering Script // -->
	<!-- Enliple Tracker -->
	<script type="text/javascript">
		(function(a, g, e, n, t) {
			a.enp = a.enp || function() {
				(a.enp.q = a.enp.q || []).push(arguments)
			};
			n = g.createElement(e);
			n.async = !0;
			n.defer = !0;
			n.src = "https://cdn.megadata.co.kr/dist/prod/enp_tracker_self_hosted.min.js";
			t = g.getElementsByTagName(e)[0];
			t.parentNode.insertBefore(n, t)
		})(window, document, "script");
		enp('create', 'common', 'lush', {
			device : 'W'
		}); // W:웹, M: 모바일, B: 반응형
		enp('send', 'common', 'lush');
	</script>
	<!-- Enliple Tracker // -->
	<!-- kakao pixel -->
	<script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script type="text/javascript">
		kakaoPixel('3559746209571848102').pageView();
	</script>
	<!-- kakao pixel // -->
</footer>

<script>

</script>
</body>
</html>
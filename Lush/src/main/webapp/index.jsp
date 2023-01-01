<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="inquiry/css/reset.css" type="text/css">
    <link rel="stylesheet" href="inquiry/css/layout.css" type="text/css">
    <link rel="stylesheet" href="inquiry/css/style.css" type="text/css">

    <link rel="icon" type="image/png" sizes="192x192" href="images/ico/fabicon.png">
    <title>러쉬코리아</title>
</head>
<body>

<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<%--<link rel="stylesheet" href="css/mediaelementplayer.css" type="text/css">--%>
<script src="js/aos.js"></script>
<script src="js/simpleParallax.js"></script>
<link rel="stylesheet" href="css/aos.css" type="text/css">
<link rel="stylesheet" href="css/main.css" type="text/css">

<section id="main" style="padding-top: 128px;">
    <article class="main-banner">
        <div class="inner clip">
            <div class="swiper-container main-slider">
                <div class="swiper-wrapper">
                    <a href="javascript:;" class="swiper-slide on" style="margin-right: 24px;">
                        <img src="images/main/20221230125648L.png" alt="러쉬 캔들<br>론칭!">
                        <div class="banner-txt">
                            <p data-swiper-parallax="-200"  data-swiper-parallax-opacity="0.25" style="color: #000000">러쉬 캔들<br>론칭!</p>
                            <span data-swiper-parallax="-300"  data-swiper-parallax-opacity="0.25">[NEW] 새롭게 출시된 캔들 3종 보러 가기!<br></span>
                        </div>
                    </a>
                    <a href="javascript:;" class="swiper-slide on" style="margin-right: 24px;">
                        <img src="images/main/20221222221643L.png" alt="ㅤ">
                        <div class="banner-txt">
                            <p data-swiper-parallax="-200"  data-swiper-parallax-opacity="0.25" style="color: #000000">ㅤ</p>
                            <span data-swiper-parallax="-300"  data-swiper-parallax-opacity="0.25">&nbsp;</span>
                        </div>
                    </a>
                    <a href="javascript:;" class="swiper-slide on" style="margin-right: 24px;">
                        <img src="images/main/20221214143149L.png" alt="말똥도넛 팝업<br>OPEN!">
                        <div class="banner-txt">
                            <p data-swiper-parallax="-200"  data-swiper-parallax-opacity="0.25" style="color: #000000">말똥도넛 팝업<br>OPEN!</p>
                            <span data-swiper-parallax="-300"  data-swiper-parallax-opacity="0.25">[EVENT] 말똥도넛에서 러쉬를 만나보세요!<br></span>
                        </div>
                    </a>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </article>
    <article class="review">
        <div class="inner clip">
            <div class="swiper-container">
                <ul class="swiper-wrapper">
                    <c:forEach var="review" items="${mainReviews}">
                        <li class="swiper-slide" data-aos="fade-left" data-aos-delay="100" data-aos-duration="1000" style="width: 288px; margin-right: 24px;">
                            <div class="stars"><img src="images/ico/stars${review.productReview.pdr_grade}.svg" alt="별5개"></div>
                            <p class="title" style="font-size: 24px">${review.product.pd_name}</p>
                            <div class="buttons">
                                <button type="button"><img src="images/ico/favourites.svg" alt="좋아요 버튼"></button>
                                <button type="button"><img src="images/ico/bag.svg" alt="장바구니 버튼"></button>
                            </div>
                            <a href="javascript:;" class="prd-link">
                                <figure class="size1">
                                    <img src="/Lush/upload/products/${review.productReviewImages.pri_image}" class="review-image">
                                    <img src="/Lush/upload/products/${review.productReviewImages.pri_image}" class="this-prd">
                                </figure>
                                <p class="review-text">
                                    ${review.productReview.pdr_content}</p>
                                <p class="this-prd-name">
                                    <strong></strong>
                                    <span>${review.product.pd_name}</span>
                                </p>
                            </a>
                            <div class="user">
                                <span>${review.member.name}</span>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
                <div class="swiper-pagination sub"></div>
            </div>
        </div>
    </article>
    <article class="recommend">
        <div class="inner wide flex left">
            <div class="hashtags">
                <div class="hashtags-wrap">
                    <a href="javascript:;" class="hash"><span>#캔들 론칭</span></a>
                    <a href="javascript:;" class="hash"><span>#선물은 러쉬</span></a>
                    <a href="javascript:;" class="hash"><span>#촉촉보습</span></a>
                </div>
                <img src="images/main/20221230101709L.png" class="hash-bg">
            </div>

            <div class="rec-product" data-aos="fade-left" data-aos-duration="1000">
                <h2><span>NEW</span></h2>
                <p class="summary">새로운 향기의 신선함을 경험해 보세요!</p>

                <div class="swiper-container">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <a href="javascript:;" class="prd-image">
                                <img src="images/main/20221219124734L.png">
                            </a>
                            <div class="buttons">
                                <button type="button"><img src="images/ico/favourites.svg" alt="좋아요 버튼"></button>
                                <button type="button"><img src="images/ico/bag.svg" alt="장바구니 버튼"></button>
                            </div>
                            <a href="javascript:;" class="prd-name subtitle">슬리피 캔들</a>
                            <div class="hash-box">
                                <a href="javascript:;" class="cate"></a>
                            </div>
                            <a href="javascript:;" class="prd-price">&#8361;35,000</a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;" class="prd-image">
                                <img src="images/main/20221219124759L.png">
                            </a>
                            <div class="buttons">
                                <button type="button"><img src="images/ico/favourites.svg" alt="좋아요 버튼"></button>
                                <button type="button"><img src="images/ico/bag.svg" alt="장바구니 버튼"></button>
                            </div>
                            <a href="javascript:;" class="prd-name subtitle">더 올리브 브랜치 캔들</a>
                            <div class="hash-box">
                                <a href="javascript:;" class="cate"></a>
                            </div>
                            <a href="javascript:;" class="prd-price">&#8361;35,000</a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;" class="prd-image">
                                <img src="images/main/20221219124703L.png">
                            </a>
                            <div class="buttons">
                                <button type="button"><img src="images/ico/favourites.svg" alt="좋아요 버튼"></button>
                                <button type="button"><img src="images/ico/bag.svg" alt="장바구니 버튼"></button>
                            </div>
                            <a href="javascript:;" class="prd-name subtitle">오렌지 블러썸 캔들</a>
                            <div class="hash-box">
                                <a href="javascript:;" class="cate"></a>
                            </div>
                            <a href="javascript:;" class="prd-price">&#8361;35,000</a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;" class="prd-image">
                                <img src="images/main/20221213132436L.png">
                            </a>
                            <div class="buttons">
                                <button type="button"><img src="images/ico/favourites.svg" alt="좋아요 버튼"></button>
                                <button type="button"><img src="images/ico/bag.svg" alt="장바구니 버튼"></button>
                            </div>
                            <a href="javascript:;" class="prd-name subtitle">골드 래빗</a>
                            <div class="hash-box">
                                <a href="javascript:;" class="cate"></a>
                            </div>
                            <a href="javascript:;" class="prd-price">&#8361;19,000</a>
                        </li>
                        <li class="swiper-slide">
                            <a href="javascript:;" class="prd-image">
                                <img src="images/main/20221228114421L.png">
                            </a>
                            <div class="buttons">
                                <button type="button"><img src="images/ico/favourites.svg" alt="좋아요 버튼"></button>
                                <button type="button"><img src="images/ico/bag.svg" alt="장바구니 버튼"></button>
                            </div>
                            <a href="javascript:;" class="prd-name subtitle">호피 뉴 이어</a>
                            <div class="hash-box">
                                <a href="javascript:;" class="cate"></a>
                            </div>
                            <a href="javascript:;" class="prd-price">&#8361;43,000</a>
                        </li>
                    </ul>
                    <div class="swiper-pagination sub"></div>
                </div>
            </div>
        </div>
    </article>
    <article class="campaign">
        <div class="inner flex left">
            <a href="javascript:;" class="campaign-box" data-aos-offset="0"  data-aos="fade-up" data-aos-delay="300" data-aos-duration="1800">
                <h2 class="campaign-name" data-aos="fade-up" data-aos-duration="1200">공지사항</h2>
                <img src="images/main/20221226172202L.png" class="campaign-image" alt="공지사항">
                <p class="campaign-subtitle">연말 택배 물량 증가 배송 지연 안내</p>
            </a>
            <a href="javascript:;" class="campaign-box" data-aos-offset="0" data-aos="fade-up" data-aos-delay="000" data-aos-duration="1800">
                <h2 class="campaign-name" data-aos="fade-up" data-aos-duration="1200">지금 진행중인 캠페인<br></h2>
                <img src="images/main/20221209173243L.png" class="campaign-image" alt="지금 진행중인 캠페인<br>">
                <p class="campaign-subtitle">해피 크리에이터가 실미도에 모인 이유는!?</p>
            </a>
        </div>
    </article>
    <article class="event">
        <div class="inner">
            <div class="grid case2">
                <div class="stamp stamp1">
                    <h2><a href="javascript:;">지금 놓치면 안될<br/>사랑스러운 이벤트</a></h2>
                </div>
                <div class="grid-sizer"></div>
                <div class="grid-item ">
                    <img src="images/main/20221222221855L.png" alt="러쉬 향기 결산.zip">
                    <a href="javascript:;" class="event-box">
                        <p class="event-name">러쉬 향기 결산.zip</p>
                        <p class="date">
                            2022-12-26 ~ 2023-01-01</p>
                    </a>
                </div>
                <div class="grid-item long">
                    <img src="images/main/20221214143306L.png" alt="말똥도넛 러쉬 팝업스토어">
                    <a href="javascript:;" class="event-box">
                        <p class="event-name">말똥도넛 러쉬 팝업스토어</p>
                        <p class="date">
                            2022-12-16 ~ 2023-01-15</p>
                    </a>
                </div>
            </div>
        </div>
    </article>
    <article class="video" data-aos="fade-up" data-aos-duration="1800">
        <div class="inner flex center">
            <video id="mainVod" poster="/upload/mainVideo/" width="600" height="404" controls loop preload="none" playsinline>
                <source src="https://youtu.be/BP8b_7ktLdg"/>
            </video>
            <div class="video-text" data-aos="fade-up"data-aos-duration="1500">
                <h2>2022 연말 결산 어워즈<br></h2>
                <p class="subtitle">2022년 가장 많이 사랑받았던 제품과 신인 루키템, MD픽 제품까지!<br>신선한 직원 리뷰를 영상에서 바로 확인해 보세요!</p>
            </div>
        </div>
    </article>
    <article class="wide-banner">
        <div class="inner wide">
            <div class="swiper-container perfume-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;" class="flex left" >
                            <div class="wide-img-wrap" data-aos="fade-up"  data-aos-duration="1800">
                                <img src="images/main/20221230132338L.png" alt="쉐이드<br>퍼퓸">
                            </div>
                            <div class="spa-text" data-aos="fade-up" data-aos-duration="1500">
                                <h2>쉐이드<br>퍼퓸</h2>
                                <p class="subtitle">강렬한 첫 향기와 은은한 잔 향기가 매력적인 퍼퓸이에요! 따뜻하고 편안한 우디 계열의 향수를 좋아하신다면 사랑에 빠지고 말걸요?<br></p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;" class="flex left" >
                            <div class="wide-img-wrap">
                                <img src="images/main/20221230133501L.png" alt="카마<br>솔리드 퍼퓸">
                            </div>
                            <div class="spa-text" data-aos="fade-up" data-aos-duration="1500">
                                <h2>카마<br>솔리드 퍼퓸</h2>
                                <p class="subtitle">오렌지와 파촐리가 어우러진 놀라운 향기! 오묘한 향기와 숲에서 나는 자연의 향기가 섞인 듯한 이국적인 매력이 느껴져요.</p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;" class="flex left" >
                            <div class="wide-img-wrap">
                                <img src="images/main/20221230133053L.png" alt="빅<br>보디 스프레이">
                            </div>
                            <div class="spa-text" data-aos="fade-up" data-aos-duration="1500">
                                <h2>빅<br>보디 스프레이</h2>
                                <p class="subtitle">섬세하면서도 우아한 네롤리 오일로 기분 좋은 하루를 보내보세요! 은은한 싱그러움이 몸과 마음을 달래줄 거예요.</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="swiper-pagination perfume-btn" data-aos="fade-up"   data-aos-duration="2000"></div>
            </div>
        </div>
    </article>
    <article class="wide-banner">
        <div class="inner wide">
            <div class="swiper-container spa-swiper">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <a href="javascript:;" class="flex left" >
                            <div class="wide-img-wrap" data-aos="fade-up"  data-aos-duration="1800">
                                <img src="images/main/20221107101346L.png" alt="더 에너자이저<br>" />
                            </div>
                            <div class="spa-text"  data-aos="fade-up" data-aos-duration="1500">
                                <h2>더 에너자이저<br></h2>
                                <p class="subtitle">음악의 일부가 된듯한 짜릿함!<br>드럼 스틱과 스트레칭 밴드를 활용하여 리듬에 맞춰 몸과 마음의 에너지를 끌어올리는 마사지입니다.</p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;" class="flex left" >
                            <div class="wide-img-wrap">
                                <img src="images/main/20220801215852L.png" alt="더 굿 아워" />
                            </div>
                            <div class="spa-text"  data-aos="fade-up" data-aos-duration="1500">
                                <h2>더 굿 아워</h2>
                                <p class="subtitle">견고한 압의 마사지로 온몸의 생기를
                                    불어 넣어 지친 근육의 뻐근함을
                                    해방시켜 드립니다.</p>
                            </div>
                        </a>
                    </div>
                    <div class="swiper-slide">
                        <a href="javascript:;" class="flex left" >
                            <div class="wide-img-wrap">
                                <img src="images/main/20220729152707L.png" alt="프레쉬 페이셜" />
                            </div>
                            <div class="spa-text"  data-aos="fade-up" data-aos-duration="1500">
                                <h2>프레쉬 페이셜</h2>
                                <p class="subtitle">짧고 효과적인 생기 부스터를 경험해 보세요.
                                    피부의 니즈와 컨티션에 꼭 맞춘
                                    당신만의 재료를 팔레트에 쌓아올립니다.</p>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="swiper-pagination spa-btn" data-aos="fade-up" data-aos-duration="2000"></div>
            </div>
        </div>
    </article>
</section>

<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

<script>
    $(function() {

        /*메인 인터렉션*/
        AOS.init();
        window.addEventListener('load', AOS.refresh)

        /* 메인 해쉬박스 패럴렉스 */
        var image = document.getElementsByClassName('hash-bg');
        new simpleParallax(image, {
            delay: .6,
            transition: 'cubic-bezier(0,0,0,1)'
        });
        var swiper1 = new Swiper('.main-banner .swiper-container', {
            slidesPerView: 'auto',
            spaceBetween: 24,
            autoplay: {
                delay:3000,
                disableOnInteraction:false,
            },
            loop: true,
            pagination: {
                el: '.main-banner .swiper-pagination',
                type: 'bullets',
                clickable: true,
            },
            speed : 1000,
            parallax: true,
        });
        var swiper2 = new Swiper('.review .swiper-container', {
            slidesPerView: '4',
            spaceBetween: 24,
            loop: false,
            pagination: {
                el: '.review .swiper-pagination',
                type: 'bullets',
                clickable: true,
            },
            on: {
                slideChange: function() {
                    idxx = this.activeIndex;
                    $(".review .swiper-wrapper .swiper-slide").each(function(){
                        var thisId = $(this).index();
                        if (thisId > idxx + 3) {
                            $(this).removeClass("recover").addClass("opacity")
                        } else {
                            $(this).removeClass("opacity").addClass("recover");
                        }
                    });
                }
            },
            watchOverflow : true,

        });

        var swiper3 = new Swiper('.recommend .swiper-container', {
            slidesPerView: '3',
            spaceBetween: 24,
            loop: false,
            pagination: {
                el: '.recommend .swiper-pagination',
                type: 'bullets',
                clickable: true,
            },
            speed : 1000,
            watchOverflow : true
        });
        var swiper4 = new Swiper('.spa-swiper', {
            slidesPerView: '1',
            spaceBetween: 24,
            loop: false,
            pagination: {
                el: '.spa-btn',
                type: 'bullets',
                clickable: true,
            },
            speed : 1000,
            watchOverflow : true
        });
        var swiper5 = new Swiper('.perfume-swiper', {
            slidesPerView: '1',
            spaceBetween: 24,
            loop: false,
            pagination: {
                el: '.perfume-btn',
                type: 'bullets',
                clickable: true,
            },
            speed : 1000,
            watchOverflow : true
        });

        $(".grid-item").imagesLoaded( function() {
            $(".grid.case1").masonry({
                stamp: '.stamp',
                itemSelector: '.grid-item',
                columnWidth: 107.9,
                horizontalOrder: true,
                fitWidth: true,
                originLeft: true,
                percentPosition: true
            });
            AOS.refresh();
        });

        // https://github.com/mediaelement/mediaelement/blob/master/docs/api.md
        $('#mainVod').mediaelementplayer({
            pluginPath: "/content/modules/mediaelement/build/",
            success: function(mediaElement, originalNode, instance) {
                // do things
            }
        });

        $(".main-banner .swiper-container").hover(function(){
            (this).swiper.autoplay.stop();
        },function(){
            (this).swiper.autoplay.start();
        });
    })
</script>
</body>
</html>
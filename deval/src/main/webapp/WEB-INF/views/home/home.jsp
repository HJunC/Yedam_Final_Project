<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!-- Fullwidth Slider -->
<div class="home-section fullwidth-slider-fade bg-dark light-content" id="home">

    <!-- Slide Item -->
    <section class="home-section bg-scroll bg-dark-alfa-30 light-content" data-background="${resources}/images/full-width-images/section-bg-19.jpg">
        <div class="container fixed-height-medium d-flex align-items-center">

            <!-- Hero Content -->
            <div class="home-content">
                <h1 class="hs-line-4 mb-30 mb-xs-10 owl-animate-1">개발자들을 위한 공간</h1>
                <h2 class="hs-line-7 mb-60 mb-xs-20 owl-animate-2 owl-delay-450">Developers Vally</h2>
                <div class="local-scroll mb-20 mb-xs-0 owl-animate-3 owl-delay-700">
                    <a href="#" class="btn btn-mod btn-w btn-medium btn-round mx-md-1">Learn More</a>
                </div>
            </div>
            <!-- End Hero Content -->

        </div>
    </section>
    <!-- End Slide Item -->

    <!-- Slide Item -->
    <section class="home-section bg-scroll bg-dark-alfa-50 light-content" data-background="${resources}/images/full-width-images/section-bg-14.jpg">
        <div class="container fixed-height-medium d-flex align-items-center">

            <!-- Hero Content -->
            <div class="home-content">
                <h1 class="hs-line-4 mb-30 mb-xs-10 owl-animate-1">Get the new experience with${member.memberId}</h1>
                <h2 class="hs-line-7 mb-60 mb-xs-20 owl-animate-2 owl-delay-500">Creative Design Agency</h2>
                <div class="local-scroll mb-20 mb-xs-0 owl-animate-3 owl-delay-750">
                    <a href="#about" class="btn btn-mod btn-w btn-medium btn-round mx-md-1">See More</a>
                    <a href="https://www.youtube.com/watch?v=jTea_8Fk5Ns" class="btn btn-mod btn-w btn-medium btn-round mx-md-1 lightbox mfp-iframe">Play Reel</a>
                </div>
            </div>
            <!-- End Hero Content -->

        </div>
    </section>
    <!-- End Slide Item -->

    <!-- Slide Item -->
    <section class="home-section bg-scroll bg-dark-alfa-70 light-content" data-background="${resources}/images/full-width-images/section-bg-21.jpg">
        <div class="container fixed-height-medium d-flex align-items-center">

            <!-- Hero Content -->
            <div class="home-content">
                <h1 class="hs-line-4 mb-30 mb-xs-10 owl-animate-1">Create Your Dream</h1>
                <h2 class="hs-line-7 mb-60 mb-xs-20 owl-animate-2 owl-delay-500">With Amazing Design</h2>
                <div class="local-scroll mb-20 mb-xs-0 owl-animate-3 owl-delay-750">
                    <a href="pages-pricing-1-dark.html" class="btn btn-mod btn-w btn-medium btn-round mx-md-1">Get Pricing</a>
                </div>
            </div>
            <!-- End Hero Content -->

        </div>
    </section>
    <!-- End Slide Item -->

</div>
<!-- End Fullwidth Slider -->

<style>
    .notice-box {
        margin-bottom: 80px;
        width: 100%;
        height: 52px;
        border-radius: 8px;
        background-color: #545353;
        overflow: hidden;
    }
    .notice-box ul { width: 100%; }
    .notice-box li {
        padding: 0 16px;
        height: 52px;
    }
    .notice-box a {text-decoration-line: none;}

    .list-box li {}
    .list-box a {text-decoration-line: none;}
    .list-box:nth-child(2n-1) {padding-right: 40px}
    .list-box:nth-child(2n) {padding-left: 40px}
</style>

<section class="page-section bg-dark light-content" style="padding-top: 52px;">
    <div class="container relative">

        <div class="notice-box d-flex">
            <i class="fa fa-bullhorn d-flex justify-content-center align-items-center" style="width: 52px; height: 52px;"></i>
            <ul class="board/boardSelect.do?boardNo=clearlist">
                <c:forEach items="${noticeList}" var="item">
                    <li class="d-flex justify-content-between align-items-center">
                        <a href="boardNo${item.boardNo}">${item.title}</a>
                        <span style="color: #919191">2022-03-20</span>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <div class="row">

            <!-- Col -->
            <div class="col-sm-6 mb-40 list-box">

                <div class="text">
                    <div class="blog-page-title d-flex justify-content-between align-center" style="margin-bottom: 16px;">
                        <h5 class="mb-1"><i class="fa fa-comment"></i>&nbsp;&nbsp;코드 공유</h5>
                        <a href="${pageContext.request.contextPath}/board/free.do" class="mb-1">더보기 <i class="fa fa-angle-right"></i></a>
                    </div>
                    <ul class="clearlist">
                        <c:forEach items="${codeList}" var="item">
                            <li class="d-flex justify-content-between">
                                <a href="code/codeSelectOne.do?boardNo=${item.boardNo}">${item.title}</a>
                                <span style="color: #919191; padding-right: 8px;"><i class="fa fa-eye"></i>&nbsp;&nbsp;${item.hit}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
            <!-- End Col -->

            <!-- Col -->
            <div class="col-sm-6 mb-40 list-box">

                <div class="text">
                    <div class="blog-page-title d-flex justify-content-between align-center" style="margin-bottom: 16px;">
                        <h5 class="mb-1"><i class="fa fa-microchip"></i>&nbsp;&nbsp;최신기술</h5>
                        <a href="${pageContext.request.contextPath}/board/technical.do" class="mb-1">더보기 <i class="fa fa-angle-right"></i></a>
                    </div>
                    <ul class="clearlist">
                        <c:forEach items="${techList}" var="item">
                            <li class="d-flex justify-content-between">
                                <a href="board/technicSelect.do?boardNo=${item.boardNo}">${item.title}</a>
                                <span style="color: #919191; padding-right: 8px;"><i class="fa fa-eye"></i>&nbsp;&nbsp;${item.hit}</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
            <!-- End Col -->

        </div>

    </div>
</section>
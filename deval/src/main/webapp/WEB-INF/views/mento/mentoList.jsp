<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토리스트 페이지</title>
</head>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources"/>
<body>
 <main id="main">    
            
                <!-- Home Section -->
                <section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="images/full-width-images/section-bg-19.jpg" id="home">
                    <div class="container relative pt-70">
                    
                        <div class="row">
                            
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">실력있는 멘토들을 소개합니다</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                        특정레벨이상의 멘토들을 선정했습니다 골라주세요
                                    </p>
                                </div>
                            </div>
                            
                        </div>
                    
                    </div>
                </section>
                <!-- End Home Section -->
                
                
                <!-- Section -->
                <section class="page-section bg-dark light-content">
                    <div class="container relative">
                        
                        <!-- Shop options -->
                        <div class="clearfix mb-40">
                            
                            <div class="float-sm-start mt-10 mb-sm-20">
                                N언어의 멘토들은 현재 ??명입니다
                            </div>
                            
                            <div class="float-sm-end">
                                  <div>원하시는 언어가 있으신가요</div>
                                <form method="post" action="#" class="form">
                                    <select class="input-md round">
                                        <option>언어1</option>
                                        <option>언어2</option>
                                        <option>언어33</option>
                                    </select>
                                </form>
                            </div>
                            
                        </div>
                        <!-- End Shop options -->
                        
                        <div class="row">
                    
                            <!-- Shop Item -->
                            <div class="col-sm-6 col-md-3 mb-60 mb-xs-40">
                                
                                <div class="post-prev-img">
                                    <!-- 사진출력 -->
                                    <a href="#"><img src="${resources }/images/mento/exHong.PNG" alt="" /></a>
                                </div>
                                
                                <div class="post-prev-title align-center">
                                	<!-- 멘토 이름이 들어가는 곳 -->
                                    <a href="shop-single-dark.html">홍길동(멘토1)</a>
                                </div>

                                <div class="post-prev-text align-center">
                                    <strong>멘토 소개글이 대충있는 곳</strong>
                                </div>
                                
                                <div class="post-prev-more align-center">
                                    <a href="#" class="btn btn-mod btn-w btn-round"><i class="fa fa-search"></i> 멘토상세보기</a>
                                </div>
                                
                            </div>
                            <!-- End Shop Item -->
                            
                            <!-- Shop Item -->
                            <div class="col-sm-6 col-md-3 mb-60 mb-xs-40">
                                
                                <div class="post-prev-img">
                                    <a href="shop-single-dark.html"><img src="images/shop/shop-prev/shop-prev-2.jpg" alt="" /></a>
                                </div>
                                
                                <div class="post-prev-title align-center">
                                    <a href="shop-single-dark.html">Only & Sons Pique Polo Shirt</a>
                                </div>

                                <div class="post-prev-text align-center">
                                    <strong>$28.99</strong>
                                </div>
                                
                                <div class="post-prev-more align-center">
                                    <a href="#" class="btn btn-mod btn-w btn-round"><i class="fa fa-shopping-cart"></i> 멘토상세보기</a>
                                </div>
                                
                            </div>
                            <!-- End Shop Item -->
                            
                            <!-- Shop Item -->
                            <div class="col-sm-6 col-md-3 mb-60 mb-xs-40">
                                
                                <div class="post-prev-img">
                                    <a href="shop-single-dark.html"><img src="images/shop/shop-prev/shop-prev-3.jpg" alt="" /></a>
                                </div>
                                
                                <div class="post-prev-title align-center">
                                    <a href="shop-single-dark.html">Longline Long Sleeve</a>
                                </div>

                                <div class="post-prev-text align-center">
                                    <strong>$39.99</strong>
                                </div>
                                
                                <div class="post-prev-more align-center">
                                    <a href="#" class="btn btn-mod btn-w btn-round"><i class="fa fa-shopping-cart"></i> 멘토상세보기</a>
                                </div>
                                
                            </div>
                            <!-- End Shop Item -->
                            
                            <!-- Shop Item -->
                            <div class="col-sm-6 col-md-3 mb-60 mb-xs-40">
                                
                                <div class="post-prev-img">
                                    <a href="shop-single-dark.html"><img src="images/shop/shop-prev/shop-prev-4.jpg" alt="" /></a>
                                </div>
                                
                                <div class="post-prev-title align-center">
                                    <a href="shop-single-dark.html">Polo Shirt With Floral Sleeves</a>
                                </div>

                                <div class="post-prev-text align-center">
                                    <strong>$85.99</strong>
                                </div>
                                
                                <div class="post-prev-more align-center">
                                    <a href="#" class="btn btn-mod btn-w btn-round"><i class="fa fa-shopping-cart"></i> 자세히 보기</a>
                                </div>
                                
                            </div>
                            <!-- End Shop Item -->
                            
                        </div>
                        
                        <!-- Pagination -->
                        <div class="pagination mt-30 mt-xs-10">
                            <a href=""><i class="fa fa-chevron-left"></i></a>
                            <a href="" class="active">1</a>
                            <a href="">2</a>
                            <a href="">3</a>
                            <a class="no-active">...</a>
                            <a href="">9</a>
                            <a href=""><i class="fa fa-chevron-right"></i></a>
                        </div>
                        <!-- End Pagination -->
                                
                    </div>
                </section>
                <!-- End Section -->                
                
            </main>
</body>
</html>
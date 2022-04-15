<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="resources" value="${pageContext.request.contextPath }/resources"/>
<c:set var="satis" value="${stisfied*20}" />
<fmt:parseNumber var="stis" integerOnly="true" value="${satis}"/>
<link rel="stylesheet" href="${resources}/css/custom/team-project-style.css">
<main id="main">    
            
                <!-- Home Section -->
                <section class="home-section parallax-5" data-background="" id="home">
                    <div class="container min-height-100vh d-flex align-items-center pt-100 pb-100" style="background-image: url('${resources}/images/mento/mentoMain2.PNG');background-size : 100%; background-repeat: no-repeat;">
                        
                        <!-- Hero Content -->
                        <div class="home-content text-start">
                            <div class="row">
                                <div class="col-md-9 col-lg-7">
                                    <h1 class="hs-line-3 mb-30 mb-xs-20 wow fadeInUpShort" data-wow-delay=".1s">열정교육!</h1>
                            
                                    <h2 class="hs-line-5 mb-60 mb-xs-40 wow fadeInUpShort" data-wow-delay=".2s">
                                        교육의 차별화!
                                        Mento service!
                                        <span class="sr-only"></span>
                                        <span data-period="2800" data-type='[ " 1대1 멘토링!", "입맛대로 골라먹는 언어", "다양한경험의 멘토들"]' class="typewrite" aria-hidden="true"><span class="wrap"></span></span>
                                    </h2>
                                   	
                                    </div>
                                </div>
                            </div>
                        <!-- End Hero Content -->
                        
                        </div>
                </section>
                <!-- End Home Section -->
                
                
                <!-- About Section -->
                <section class="page-section bg-dark light-content" id="about">
                    <div class="container relative">
                        
                        <div class="mb-120 mb-sm-50 mb-xs-20">
                            <div class="row section-text">
                            
                                <div class="col-md-12 col-lg-4 mb-md-50 mb-xs-30">
                                    <div class="lead-alt wow linesAnimIn" data-splitting="lines">
                                        멘토링서비스 소개말
                                    </div>
                                </div>
                                
                                <div class="col-md-6 col-lg-4 mb-sm-50 mb-xs-30 wow linesAnimIn" data-splitting="lines">
                                	우리는 차별화를 뒀습니다! 특정 레벨이상 강사!
                                </div>
								<div class="col-md-6 col-lg-4 mb-sm-50 mb-xs-30 wow linesAnimIn" data-splitting="lines">
                                	1대1 교육시스템으로 확실한 교육을 받아보세요~
                                </div>
                            </div>
                        </div>
                        
                        <!-- Counters -->
                        <div class="count-wrapper">
                            <div class="row">
                                
                                <!-- Counter Item -->
                                <div class="col-md-6 col-lg-3 mb-md-30">
                                    <div class="count-item">
                                        <div class="count-bg wow scalexIn"></div>
                                        <div class="relative wow fadeIn" data-wow-delay="1s">
                                            <div class="count-number">
                                               ${stis}
                                            </div>
                                            <div class="count-descr">
                                                <i class="fa fa-laugh-beam"></i>
                                                <span class="count-title">만족율</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Counter Item -->
                                
                                <!-- Counter Item -->
                                <div class="col-md-6 col-lg-3 mb-md-30">
                                    <div class="count-item">
                                        <div class="count-bg wow scalexIn"></div>
                                        <div class="relative wow fadeIn" data-wow-delay="1.1s">
                                            <div class="count-number">
                                                ${langCount}
                                            </div>
                                            <div class="count-descr">
                                                <i class="fa fa-book-open"></i>
                                                <span class="count-title">언어종류</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Counter Item -->
                                
                                <!-- Counter Item -->
                                <div class="col-md-6 col-lg-3 mb-md-30">
                                    <div class="count-item">
                                        <div class="count-bg wow scalexIn"></div>
                                        <div class="relative wow fadeIn" data-wow-delay="1.2s">
                                            <div class="count-number">
                                               	${mentoCount}
                                            </div>
                                            <div class="count-descr">
                                                <i class="fa fa-chalkboard-teacher"></i>
                                                <span class="count-title">멘토</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Counter Item -->
                                
                                <!-- Counter Item -->
                                <div class="col-md-6 col-lg-3 mb-md-30">
                                    <div class="count-item">
                                        <div class="count-bg wow scalexIn"></div>
                                        <div class="relative wow fadeIn" data-wow-delay="1.3s">
                                            <div class="count-number">
                                                ${servCount}
                                            </div>
                                            <div class="count-descr">
                                                <i class="fa fa-hands-helping"></i>
                                                <span class="count-title">매칭</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Counter Item -->
                                
                            </div>
                        </div>
                        <!-- End Counters -->
                                            
                    </div>
                </section>
                <!-- End About Section -->
                
                <!-- Language Section -->
                <div style="width:700px; margin:auto;">
                <div>
                	<h3 class="mb-30">배우고 싶은 프로그래밍 언어가 있으신가요?</h3>
                </div>
                      <form action="mentoList.do" id="frm" class="frm">
                      <sec:csrfInput/>
                                    <div class="mb-20 mb-md-10">
                                        <select class="input-md round form-control" style="width:200px" id="lang" name="lang">
                                            <c:forEach var="lang" items="${choice}">
                                            	<option value="${lang}">${lang}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                       <button type="submit" class="btn btn-mod btn-w btn-medium btn-round me-md-1" style="background-color:#00D8FF">언어 선택</button>
                      </form>
                      <c:if test="${member.exp >= 1000 }">
                      <form action="mentoInsertForm.do" id="frm2" method="get">
                      		<button type="submit" class="btn btn-mod btn-w btn-circle"> <i class="fa fa-chalkboard-teacher"></i>멘토등록</button>
                 		</form>
                 		<form action="mentiCheck.do" id="frm3" method="get">
                      		<button type="submit" class="btn btn-mod btn-w btn-circle"> <i class="fa fa-chalkboard-teacher"></i>서비스신청현황</button>
                 		</form>
                 	</c:if>
                 </div>
                
                
            </main>
            
            
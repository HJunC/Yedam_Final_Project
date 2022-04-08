<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>studyMember.jsp</title>
	</head>
	<body>
                <!-- Home Section -->
                <section class="page-section bg-dark light-content" id="home">
                    <div class="container relative text-center">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1">
                                <h1 class="hs-line-4 mb-30 mb-xs-20 wow fadeInUpShort" data-wow-delay=".1s"><span class="d-inline-block bg-gray-dark round px-3 pb-1"><i class="fas fa-code-branch"></i></span></h1>
                                <h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">DEVELOPER<br>STUDY GROUP MEMBER</h2>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Home Section -->\
                <!-- Section -->
               <section class="page-section bg-dark light-content pt-0">
                    <div class="container relative">
                        <div class="row mb-120 mb-sm-50">
                            
                            <!-- Team item -->
                            <c:forEach items="${study}" var="std">
                            <div class="col-md-4 mb-xs-30">
                                <div class="team-item-wrap wow fadeInUp" data-wow-delay=".1s" data-wow-duration="1.2s">
                                    <div class="team-item-decoration" style="background-image: url(${resources}/images/team/team-decoration-1.jpg);"></div>
                                    <div class="team-item">
                                        <div class="team-item-image">
                                            <img src="${resources}/images/team/team-1.jpg" alt="" />
                                            <div class="team-item-detail">
                                                <p class="team-item-detail-title">
                                                    ${std.present }
                                                </p>
                                                <p>
                                                   학력: ${std.college }<br>
                                                   경력: ${std.career }<br>
                                                   자격증: ${std.license }<br> 
                                                </p>
                                                <div class="team-social-links">
                                                    <a href="#" target="_blank"><i class="fab fa-facebook"></i><span class="sr-only">Facebook profile</span></a>
                                                    <a href="#" target="_blank"><i class="fab fa-twitter"></i><span class="sr-only">Twitter profile</span></a>
                                                    <a href="#" target="_blank"><i class="fab fa-pinterest"></i><span class="sr-only">Pinterest profile</span></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="team-item-descr">
                                            <div class="team-item-name">
                                                ${std.name }(${std.memberId })
                                            </div>
                                            <div class="team-item-role">
                                                ${std.mail }
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                            <!-- End Team item -->
                     </div>
                        
                        <div class="row section-text">
                        
                            <div class="col-lg-4 mb-md-50 mb-xs-30">
                                <div class="lead-alt wow linesAnimIn" data-wow-offset="0" data-splitting="lines">
                                    Our mission is to make design simple and useful.
                                </div>
                            </div>
                            
                            <div class="col-lg-8 mb-sm-50 mb-xs-30 wow linesAnimIn" data-wow-offset="0" data-splitting="lines">
                                Lorem ipsum dolor sit amet conseur adipisci inerene maximus ligula sempe metuse pelente mattis. Maecenas volutpat, diam eni sagittis quam porta quam. Sed id dolor consectetur fermentum volutpat accumsan purus. 
                                Etiam sit amet fringilla lacus susantebe sit ullamcorper pulvinar neque porttitor. Integere lectus. Praesent sede nisi eleifend fermum orci amet, iaculis libero. Donec vel ultricies purus. Name dictum sem ipsumebe euliquam.
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Section -->     
                
                <!-- Divider -->
                <hr class="mt-0 mb-0 white" />
                <!-- End Divider -->
                
                
                <!-- Contact Section -->
                <section class="page-section bg-dark light-content">
                    <div class="container relative">
                        <div class="row mb-60 mb-xs-40">
                            <div class="col-md-10 offset-md-1">
                                <div class="row">
                                    <!-- Message -->
                                    <div class="col-sm-6 col-lg-4 pb-20">
                                        <div class="contact-item wow fadeScaleIn" data-wow-delay="0" data-wow-duration="1s">
                                            <a href="#"><div class="ci-icon">
                                                <i class="fa fa-comments"></i>
                                            </div></a>
                                             <a href="#"><div class="ci-title">
                                                채팅
                                            </div></a>
                                            <div class="ci-text">
                                                스터디장
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Message -->
                                    
                                    <!-- Location -->
                                    <div class="col-sm-6 col-lg-4 pb-20">
                                        <div class="contact-item wow fadeScaleIn" data-wow-delay=".1s" data-wow-duration="1s">
                                            <div class="ci-icon">
                                                <i class="fa fa-map-marker-alt"></i>
                                            </div>
                                            <div class="ci-title">
                                                지역
                                            </div>
                                            <div class="ci-text">
                                                ${study[0].location }
                                            </div>
                                            <div class="ci-link">
                                                <a href="https://goo.gl/maps/7Vw1PBhxx5BaXStr8" target="_blank">See on the Map</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Location -->
                                    
                                    <!-- Period -->
                                    <div class="col-sm-6 col-lg-4 pb-20">
                                        <div class="contact-item wow fadeScaleIn" data-wow-delay=".2s" data-wow-duration="1s">
                                            <div class="ci-icon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <div class="ci-title">
                                                공부기간
                                            </div>
                                            <div class="ci-text">
                                                ${study[0].studySdt } ~ ${study[0].studyEdt }
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Period -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Contact Section -->
</body>
</html>
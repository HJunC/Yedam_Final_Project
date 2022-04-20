<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
	<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>studyMember.jsp</title>
	
	<!-- image 반복 -->
	<script type="text/javascript">
        var imgArray= new Array();
        imgArray[0]="${resources}/images/studyimg/devalProfile/deval01.jpg";
        imgArray[1]="${resources}/images/studyimg/devalProfile/deval02.png";
        imgArray[2]="${resources}/images/studyimg/devalProfile/deval03.jpg";
        imgArray[3]="${resources}/images/studyimg/devalProfile/deval04.png";
        imgArray[4]="${resources}/images/studyimg/devalProfile/deval05.jpg";
        imgArray[5]="${resources}/images/studyimg/devalProfile/deval06.png";
        imgArray[6]="${resources}/images/studyimg/devalProfile/deval07.jpg";
        imgArray[7]="${resources}/images/studyimg/devalProfile/deval08.png";
        imgArray[8]="${resources}/images/studyimg/devalProfile/deval09.jpg";
        imgArray[9]="${resources}/images/studyimg/devalProfile/deval10.jpg";
 
        function showImage() {
            var objImg=document.getElementsByClassName("introImg");
            for(var i=0; i<objImg.length; i++) {
           		objImg[i].src=imgArray[Math.round(Math.random()*9)];
            }
            
        }

        document.addEventListener("DOMContentLoaded", showImage);

    </script>
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
            <!-- End Home Section -->
            <!-- Section -->
               <section class="page-section bg-dark light-content pt-0">
                    <div class="container relative">
                        <div class="row mb-120 mb-sm-50">
                            
                            <!-- Team item -->
                            <c:forEach items="${study}" var="std">
                            <div class="col-md-4 mb-xs-30">
                                <div class="team-item-wrap wow fadeInUp" data-wow-delay=".1s" data-wow-duration="1.2s">
                                    <div class="team-item-decoration" style="background-image: url(${resources}/images/team/blackbar.jpg);"></div>
                                    <div class="team-item">
                                        <div class="team-item-image">
                                            <img class="introImg" border="0"  alt="" />
                                            <div class="team-item-detail">
                                                <p class="team-item-detail-title">
                                                    ${std.present }
                                                </p>
                                                <p>
                                                   학력: ${std.college }<br>
                                                   경력: ${std.career }<br>
                                                   자격증: ${std.license }<br> 
                                                </p>
                                                <!-- <div class="team-social-links">
                                                    <a href="#" target="_blank"><i class="fab fa-facebook"></i><span class="sr-only">Facebook profile</span></a>
                                                    <a href="#" target="_blank"><i class="fab fa-twitter"></i><span class="sr-only">Twitter profile</span></a>
                                                    <a href="#" target="_blank"><i class="fab fa-pinterest"></i><span class="sr-only">Pinterest profile</span></a>
                                                </div> -->
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
                 <!-- <div>
                 	<button id="memberDelBtn" name="memberDelBtn" onclick="memberDelBtn()">팀 나가기</button>
                 </div> -->
                    </div>
                </section>
                <!-- End Section --> 
               
                
                <!-- Divider -->
                <hr class="mt-0 mb-0 white" />
                <!-- End Divider -->
                
                
                <!-- Contact Section -->
                <section class="page-section bg-dark light-content">
                    <div class="container relative">
                        <div class="row mb-xs-40">
                            <div class="col-md-10 offset-md-1">
                                <div class="row">
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
                                        </div>
                                    </div>
                                    <!-- End Location -->
                                    
                                     <!-- Location -->
                                    <div class="col-sm-6 col-lg-4 pb-20">
                                        <div class="contact-item wow fadeScaleIn" data-wow-delay=".1s" data-wow-duration="1s">
                                            <div class="ci-icon">
                                                <i class="fa fa-code-branch"></i>
                                            </div>
                                            <div class="ci-title">
                                                언어
                                            </div>
                                            <div class="ci-text">
                                                ${study[0].lang1 }<c:if test="${not empty study[0].lang2 }"> / ${study[0].lang2 }</c:if>
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
                                    
                                     <!-- Message -->
                                    <div class="pb-20">
                                        <div class="contact-item wow fadeScaleIn" data-wow-delay="0" data-wow-duration="1s">
                                            <div class="ci-icon">
                                                <i class="fa fa-comments"></i>
                                            </div>
                                             <%-- <a href="#" onclick="teamChat('${leaderId.leaderId}')"><div class="ci-title"> --%>
                                            <div class="ci-title">
                                            	팀원 오픈톡
                                            </div>
                                            <div class="ci-text">
                                                <a href="${study[0].kakao }">${study[0].kakao }</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Message -->
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- End Contact Section -->
                
       <!-- <script type="text/javascript">
            	function teamChat(id) {
            		if (id == "") {
            			alert("id값이 없습니다");
            			return;
            		}
		    		console.log("-- Study Qna Start --");
		    		$.ajax({
		    			type: "POST",
		    			url: "studyChat.do",
		    			data: {"ownerId": id},
		    			dataType : "text",
		    			success: function(result) {
		    				if (result != 0)
		    					location.href="chatForm.do?roomId="+result;
		    				else
		    					return -1;
		    			},
		    			error: function(result) {
		    			}
		    		});
		    		console.log("-- Study Qna End --")
				}
        </script> -->
	</body>
</html>
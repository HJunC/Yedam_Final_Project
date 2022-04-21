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
                                <a href="studySelect.do?studyNo=${study[0].studyNo}"><p class="badge bg-dark mt-20">STUDY INFO POST</p></a>
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
                                <div class="team-item-wrap wow fadeInUp" data-wow-delay=".1s" data-wow-duration="1.2s" style="margin: 20px;">
                                    <div class="team-item-decoration" style="background-image: url(${resources}/images/team/blackbar.jpg);"></div>
                                    <div class="team-item">
                                        <div class="team-item-image">
                                            <img class="introImg" border="0" alt="" />
                                            <div class="team-item-detail">
                                                <p class="team-item-detail-title">
                                                    ${std.present }
                                                </p>
                                                <p>
                                                   학력: ${std.college }<br>
                                                   경력: ${std.career }<br>
                                                   자격증: ${std.license }<br>
                                                </p>
                                                <c:if test="${leaderId.leaderId eq user }">
                                                	<c:if test="${leaderId.leaderId ne std.memberId}">
	                                                	<button type="button" onclick="teambyebyeBtn('${std.studyNo }', '${std.memberId }')" class="btn btn-mod btn-glass btn-round btn-small">
			                                              <i class="fa fa-minus-circle"></i> 내보내기
			                                            </button>
                                                	</c:if>
                                                </c:if>	
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
                                            <div class="ci-title" style="font-size: 18px;">
                                                지역
                                            </div>
                                            <div class="ci-text" style="font-size: 15px;">
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
                                            <div class="ci-title" style="font-size: 18px;">
                                                언어
                                            </div>
                                            <div class="ci-text" style="font-size: 15px;">
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
                                            <div class="ci-title" style="font-size: 18px;">
                                                공부기간
                                            </div>
                                            <div class="ci-text" style="font-size: 15px;">
                                                ${study[0].studySdt } ~ ${study[0].studyEdt }
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Period -->
                                    
                                     <!-- Message -->
                                    <div class="pt-40">
                                        <div class="contact-item wow fadeScaleIn" data-wow-delay="0" data-wow-duration="1s">
                                            <div class="ci-icon">
                                                <i class="fa fa-comments"></i>
                                            </div>
                                             <%-- <a href="#" onclick="teamChat('${leaderId.leaderId}')"><div class="ci-title"> --%>
                                            <div class="ci-title" style="font-size: 18px;">
                                            	팀원 오픈톡
                                            </div>
                                            <div class="ci-text" style="font-size: 15px;">
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
                
                <!-- button -->
               <c:if test="${leaderId.leaderId ne user }">
	                <div align="center" style="border-radius: 5px; margin: 20px;">
			           	<button class="btn btn-mod btn-glass btn-round btn-small" id="teambyebye" name="teambyebye" onclick="teambyebyeBtn('${study[0].studyNo}', '${user}')">팀 나가기</button>
			        </div>
			   </c:if>     
               
               <c:if test="${leaderId.leaderId eq user }">
                <c:if test="${leaderId.state eq 0 }">
	               <div align="center" style="border-radius: 5px; margin: 20px;">
			           	<button class="btn btn-mod btn-glass btn-round btn-small" id="teamPause" name="teamPause" onclick="teamPauseBtn(${study[0].studyNo})">스터디 모집중단</button>
			        </div>
             	</c:if>
              
              	<c:if test="${leaderId.state eq 1 }">
	                <div align="center" style="border-radius: 5px; margin: 20px;">
			           	<button class="btn btn-mod btn-glass btn-round btn-small" id="teamRestart" name="teamRestart" onclick="teamRestartBtn(${study[0].studyNo})">스터디 모집재개</button>
			        </div>
              	</c:if>
              </c:if>
             <script type="text/javascript">
             	function teamPauseBtn(sno){
             		console.log("Study teamPause");
        			
        			$.ajax({
        				url : "studyPause.do",
        				type : "post",
        				data : {"studyNo": sno},
        				success : function(result) {
        					console.log("succ", result);
        					if (result == 1) {
        						alert("스터디 모집을 중단하였습니다.");
        						location.reload();
        					}
        				},
        				error : function(err) {
        					console.log("err", err);
        				}
        			});
             	}
             	
             	
             	function teamRestartBtn(sno){
					console.log("Study teamRestart");
        			
        			$.ajax({
        				url : "studyRestart.do",
        				type : "post",
        				data : {"studyNo": sno},
        				success : function(result) {
        					console.log("succ", result);
        					if (result == 1) {
        						alert("스터디 모집을 재개하였습니다.");
        						location.reload();
        					}
        				},
        				error : function(err) {
        					console.log("err", err);
        				}
        			});
             	}
             	
            	function teambyebyeBtn(sno, id){
					console.log("Study teambyebye");
        			
        			$.ajax({
        				url : "studyteambye.do",
        				type : "post",
        				data : {"studyNo": sno, "memberId": id},
        				success : function(result) {
        					console.log("succ", result);
        					if (result == 1) {
        						alert(id + "님 " + sno +"번 스터디를 중단하였습니다.");
        						location.href = "studyMain.do";
        					}
        				},
        				error : function(err) {
        					console.log("err", err);
        				}
        			});
             	}	
             </script> 
		</body>
	</html>
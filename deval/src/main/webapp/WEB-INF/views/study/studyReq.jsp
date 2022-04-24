<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>studyReq.jsp</title>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<!-- 정보 창 탬플릿 링크 -->
	<link rel="stylesheet" href="${resources}/css/custom/study_req_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/3.6.95/css/materialdesignicons.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
    
    <!-- 로딩창 -->
    <style>
	    	.wrap-loading{ /*화면 전체를 어둡게*/
	    position: fixed;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    background: rgba(0,0,0,0.3);
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');
	    z-index: 10;
	}
	
	.wrap-loading div{ /*로딩 이미지*/
	   width: 50px;   
	   height: 50px;
	    position: fixed;
	    top:50%;
	    left:50%;
	    margin-left: -21px;
	    margin-top: -21px;
	    z-index: 10;
	}
	
	.display-none{ /*감추기*/
	   display:none;
	}
    </style>
</head>
<body>
	<div class="wrap-loading display-none" id="div_ajax_load_image">
   		 <div><img src="${resources }/images/load.gif"/></div>
	</div>
				 <!-- Home Section -->
                <section class="page-section bg-dark light-content" id="home">
                    <div class="container relative text-center">
                        <div class="row">
                            <div class="col-lg-10 offset-lg-1">
                                <h1 class="hs-line-4 mb-30 mb-xs-20 wow fadeInUpShort" data-wow-delay=".1s"><span class="d-inline-block bg-gray-dark round px-3 pb-1"><i class="fas fa-code-branch"></i></span></h1>
                                <h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">DEVELOPER<br>STUDY APPLICANT</h2>
                            </div>
                        </div>
                    </div>
                </section>
            <!-- End Home Section -->
            
            <style>
            	.padding {
			    padding: 0rem !important;
			}
            </style>
            
	 <div class="page-content page-container" id="page-content">
        <div class="padding" align="center">
            <div class="row container d-flex justify-content-center" >
                <div class="col-xl-6 col-md-12">
	 			  <c:forEach items="${study}" var="std">
                    <div class="card user-card-full" style="border-radius: 2.25rem;">
                        <div class="row m-l-0 m-r-0" style="color: black">
                        
                            <div class="col-sm-4 bg-c-lite-green user-profile">
                                <div class="card-block text-center text-white">
                                    <div class="m-b-25"> <img src="${resources}/images/studyimg/probg.png" class="img-radius" alt="User-Profile-Image"> </div>
                                    <h6 class="f-w-600">${std.memberId }</h6>
                                    <p align="center">${std.present }</p> 
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="card-block">
                                    <h6 class="m-b-20 p-b-5 b-b-default f-w-600">팀번호: ${std.studyNo }</h6>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">자격증</p>
                                            <h6 class="text-muted f-w-400">${std.license }</h6>
                                        </div>
                                    </div>
                                    <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600"></h6>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">학력</p>
                                            <h6 class="text-muted f-w-400">${std.college }</h6>
                                        </div>
                                        <div class="col-sm-6">
                                            <p class="m-b-10 f-w-600">경력</p>
                                            <h6 class="text-muted f-w-400">${std.career }</h6>
                                        </div>
                                    </div>
                                    <div class="social-link list-unstyled m-t-40 m-b-10">
                                    	<button class="btn btn-mod btn-glass btn-round" style="background-color: black; color: white;" onclick="teamGo('${std.memberId }', '${std.studyNo }')">승인</button>
                                    	<button class="btn btn-mod btn-glass btn-round" style="background-color: black; color: white;" onclick="teamBye('${std.memberId }', '${std.studyNo }')">거절</button>
                                    	<button class="btn btn-mod btn-glass btn-round" style="background-color: black; color: white;" onclick="reqChat('${std.memberId}')">Message</button>
                                    	
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
       			   </c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <script type="text/javascript">
     	function teamBye(id, sno) {
    		console.log("-- StudyReq Member Refuse Start --");
    		$.ajax({
    			type: "POST",
    			url: "studyReqRefuse.do",
    			data: {"memberId": id, "studyNo": sno},
   			  	beforeSend : function() {
                     $("#div_ajax_load_image").show();
                 },
                complete : function() {
                     $("#div_ajax_load_image").hide();
                 },
    			success: function(json) {
    				/* alert(id + '님을 거절했습니다.');
    				location.reload(); */
    				
    				swal('거절', id + '님을 거절했습니다.', 'error')
					.then(function(){
						location.reload();           
					});
    			},
    			error: function(json) {
    			}
    		});
    		console.log("-- Study Refuse End --")
		}
     	
     	
      	function teamGo(id, sno) {
    		console.log("-- StudyReq Member Accept Start --");
		    
    		$.ajax({
    			type: "POST",
    			url: "studyReqAccept.do",
    			data: {"memberId": id, "studyNo": sno},
                beforeSend : function() {
                    	$("#div_ajax_load_image").show();
					},
                   complete : function() {
                    	$("#div_ajax_load_image").hide();
                	},
    			success : function(result) {
					console.log(result);
					
					if (result == 0){
						/* alert('참가 인원을 초과 했습니다.'); */
						swal('인원을 초과했습니다!', '승인이 불가능합니다', 'error');
						
					} else {
						/* alert(id + '님이 ' + sno + '번 스터디에 참가했습니다.');
						location.reload(); */
						
						swal('참가!', id + '님이 ' + sno + '번 스터디에 참가했습니다.', 'success')
						.then(function(){
							location.reload();           
						});
					}
				},
				error : function(err) {
					console.log("error", err);
				}
    		});
    		console.log("-- Study Accept End --")
		} 
      	
      	
      	function reqChat(id) {
    		console.log("-- Study Req Chat Start --");
    		$.ajax({
    			type: "POST",
    			url: "studyReqMemberChat.do",
    			data: {"entryId": id},
    			dataType : "text",
    			success: function(result) {
    				if (result != 0) {
    					var option = "top=50, left=60, width=500, height=750, resizable=0, scrollbars=no";
    					window.open("../chatSelect.do?roomId="+result,"",option);	
    				} else {
    					return -1;
    				}
    			},
    			error: function(result) {
    			}
    		});
    		console.log("-- Study Req Chat End --")
		}
    </script>
    
   
</body>
</html>
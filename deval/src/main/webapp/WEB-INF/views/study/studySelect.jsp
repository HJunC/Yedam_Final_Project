<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudySelect.jsp</title> 
<link rel="stylesheet" href="${resources}/css/custom/study_modal_style.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <style>
      	.comment-avatar {
		    width: 30px;
		    margin-right: 10px;
		    -webkit-border-radius: 50%;
		    -moz-border-radius: 50%;
		    border-radius: 50%;
		}
      </style>
</head>
<body>
	<!-- Title -->
                <section class="page-section bg-dark-alfa-50 bg-scroll" data-background="${resources}/images/studyimg/bg5.png" id="home">
                    <div class="container relative">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">Recruitment STUDY</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0" style="font-size: 20px;">
                                    	팀원들과 함께 경험을 공유하세요
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
      <!-- End Title -->
 <main id="main">  
   <section class="page-section bg-dark light-content">
      <div class="container relative">	
         <div class="row">  
            <!-- Content -->
			<div class="col-md-8 offset-lg-1 mb-sm-80 order-first order-md-last">

				<!-- Post -->
				<div class="blog-item">
					<c:choose>
	                    <c:when test="${study.state eq '0'}">
	                    	<p class="badge bg-success">모집중</p>
	                    </c:when>
	                    <c:when test="${study.state eq '1'}">
	                    	<p class="badge bg-light text-dark">모집중단</p>
	                    </c:when>
	                    <c:when test="${study.state eq '2'}">
	                    	<p class="badge bg-warning text-dark">모집완료</p>
	                    </c:when>
	                    <c:when test="${study.state eq '3'}">
	                    	<p class="badge bg-secondary">기간종료</p>
	                    </c:when>
                    </c:choose>
					<!-- Post Title -->
					<h2 class="blog-item-title">
						${study.studyNm}
					</h2>
					

					<!-- Author, Categories, Comments -->
					<div class="blog-item-data">
						 <span><i class="fa fa-user"></i> ${study.leaderId}</span>&nbsp;
                          <span class="separator">&nbsp;</span>
                          <span><i class="fa fa-map-marker-alt"></i> ${study.location}</span>
                          <span class="separator">&nbsp;</span>
                          <span><i class="fa fa-code-branch"></i> ${study.lang1}<c:if test="${not empty study.lang2 }"> / ${study.lang2 }</c:if></span>
                          <span class="separator">&nbsp;</span>
                           <span><i class="fa fa-users"></i> ${study.rcnt}/${study.maxRcnt }</span>
                          <span class="separator">&nbsp;</span>
                          <span><i class="fa fa-clock"></i>
                              ${study.studySdt} ~ ${study.studyEdt}
                          </span>
                          <span class="separator">&nbsp;</span>
					</div>
					
					<!-- Text Intro -->
					<div class="blog-item-body col-lg-11" style="margin-top: -128px; padding: 10px;">
						<p style="margin-top: 40px; margin-bottom: 80px; padding: 24px; font-size: 15px;">${study.subject }</p>
					</div>
					
					<!-- Divider -->
           				<hr class="mt-0 mb-0 white" />
        			<!-- End Divider -->
        			
					 <!-- Start Button -->
				      <div align="center" style="padding: 20px;">
				      	 <form action="studyUpdateForm.do" method="post" style="padding: 15px;">
				      	 <sec:csrfInput/>
				      	   <%-- <sec:authentication property="principal.username"/> --%>  
				      	  <c:if test="${study.leaderId eq member.name}">
					         <button type="submit" class="btn btn-mod btn-w btn-round" style="border-radius: 24px;">수정</button>
					      </c:if>
					      <c:if test="${study.leaderId ne member.name}">
					         <button type="button" class="btn btn-mod btn-w btn-round" style="border-radius: 24px;" onclick="studyQna('${study.leaderId}')">문의</button>
					      </c:if>   
					         <button type="button" class="btn btn-mod btn-w btn-round" style="border-radius: 24px;" onclick="location.href='studyList.do'">목록</button>
					          <input type="hidden" name="studyNo" value="${study.studyNo }">
					      </form>
					      <div class="mb-30" align="center">
					<!-- Modal Button -->
			          <c:if test="${study.state eq '0'}">
			           <c:if test="${study.leaderId ne member.name}">
		        		<c:if test="${empty list[0]}">
		         		 <c:if test="${study.rcnt ne study.maxRcnt}">	
							<button onclick="MyInfoModal()" id="joinBtn" class="btn btn-mod btn-glass btn-round btn" style="border-radius: 24px; font-size: 13px; padding: 6px 25px 6px;">참가하기</button>
						 </c:if>
						</c:if>
			  		   </c:if>
			  		  </c:if> 
				    </div>
				  </div>
					      
				<!-- End Button -->
				</div>
				<!-- End Post -->
			</div>
			<!-- End Content -->
			    
         <!-- Sidebar -->
            <div class="col-md-4 col-lg-3 mt-10">
                <!-- Widget -->
                <div class="widget">
                <input type="hidden" name="studyNo" value="${study.studyNo }">
                    <h3 class="widget-title">팀원 ${study.rcnt}/${study.maxRcnt }</h3>
                    <div class="widget-body">
                        <ul class="clearlist widget-menu">
                        
                       		<c:forEach items="${studyreq }" var="item">
                            <li>
                            <a class="float-start" href="#">
                    			<img class="media-object comment-avatar" src="${resources}/images/user-avatar.png" width="25" >
                			</a>
                                ${item.memberId }
                                <c:if test="${item.isLeader eq '1' }">
	                                <small>
	                				 👑
	                				</small>
                				</c:if>
                            </li>
                           </c:forEach>
                        </ul>
                    </div>
                </div>
                <!-- End Widget -->
                
                <!-- Widget -->
                <div class="widget">
                    <h3 class="widget-title"><i class="fa fa-code-branch"></i> 언어</h3>
                    <div class="widget-body">
                        <div class="tags">
                         	<a href="studyList.do?lang1=${study.lang1}">${study.lang1}</a>
                         	<a href="studyList.do?lang1=${study.lang2}">${study.lang2}</a>
                        </div>
                    </div>
                </div>
                <!-- End Widget -->
                
            	<div class="widget">
         		<h3 class="widget-title"><i class="fa fa-clock"></i> 공부기간</h3>
           <div class="widget-body" style="font-size: 18px;">
               ${study.studySdt} ~ ${study.studyEdt}
           </div>
   				</div>
   				 <!-- End Widget -->
   				 
   				  <div class="widget">
         		<h3 class="widget-title"><i class="fa fa-map-marker-alt"></i> 지역</h3>
           <div class="widget-body" style="font-size: 18px;">
               ${study.location }
           </div>
   				</div>
   				<!-- End Widget -->
                
                <!-- Widget -->
               <div class="widget">
         		<h3 class="widget-title"># Project</h3>
                    <div class="widget-body">
                        <ul class="clearlist widget-posts">
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-1.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">프로젝트명 테스트 1</a>
                                    <i class="fa fa-clock"></i> 2022.02.14  
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-2.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">프로젝트명 테스트 2</a>
                                   <i class="fa fa-clock"></i> 2022.03.14  
                                </div>
                            </li>
                            <li class="clearfix">
                                <a href=""><img src="${resources}/images/blog/previews/post-prev-3.jpg" alt="" width="100" class="widget-posts-img" /></a>
                                <div class="widget-posts-descr">
                                    <a href="#" title="">프로젝트명 테스트 3</a>
                                    <i class="fa fa-clock"></i> 2022.04.14  
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- End Widget -->
                
                <!-- Widget -->
                <div class="widget">
                    <h3 class="widget-title"># Developer Vally</h3>
                    <div class="widget-body">
                        <ul class="clearlist widget-menu" style="font-size: 18px;">
                            <li>
                                <a href="studyList.do" title="">✔ 스터디 검색</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/project/main.do" title="">✔ 프로젝트 참가</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/mento/main.do" title="">✔ 멘토&멘티 신청</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- End Widget -->
            </div>
            <!-- End Sidebar -->
         </div>
        <!-- Divider -->
           <hr class="mt-0 mb-0 white" />
        <!-- End Divider -->            
    </div>
  	</section>
  	<!-- Start Modal -->
		<style>
			.mfp-content {
				border: 1px solid #ddd;
				border-radius: 15px;
				padding: 0 !important;
				max-width: 630px !important;}
		</style>

		<div id="mod_myinfo" class="mfp-hide">
			<form id="frm_modal" name="frm_modal">
				<div class="wrapper bg-white mt-sm-5" id="test-modal">
					<h4 class="pb-4 border-bottom">MY INFO</h4>
					<div class="d-flex align-items-start py-3 border-bottom">
					<img src="${resources}/images/studyimg/main/deval.jpg" class="img" alt="">
						<div class="pl-sm-4 pl-2 ms-4" id="img-section">
							<b>#STUDY</b>
							<h3 style="margin: 0" id="memberId"></h3>
							<input type="hidden" name="sno" value="${study.studyNo }">
						</div>
					</div>
					<div class="py-2">
						<div class="row py-2">
							<div class="col-md-6">
								<textarea class="bg-light form-control" rows="10" cols="40"
									name="present" id="present" placeholder="소개 내용을 입력하세요" readonly="readonly"></textarea>
							</div>
							<div class="col-md-6 pt-md-0 pt-3">
								<textarea class="bg-light form-control" rows="10" cols="40"
									name="license" id="license" placeholder="자격증 (선택사항)" readonly="readonly"></textarea>
							</div>
						</div>
					</div>
					<div class="row py-2">
						<div class="col-md-6" >
							<label for="college">학력</label> <select name="college"
								id="college" class="bg-light" >
								<option value="비공개" selected>비공개</option>
								<option value="고등학교 졸업 이하">고등학교 졸업 이하</option>
								<option value="고등학교 졸업">고등학교 졸업</option>
								<option value="대학 졸업 (2,3년제)">대학 졸업 (2,3년제)</option>
								<option value="대학 졸업(4년제)">대학 졸업(4년제)</option>
								<option value="대학원 석사 졸업">대학원 석사 졸업</option>
								<option value="대학원 박사 졸업">대학원 박사 졸업</option>
							</select>
						</div>
						<div class="col-md-6 pt-md-0 pt-3" id="career">
							<label for="career">경력</label>
							<div class="arrow">
								<select name="career" id="career" class="bg-light">
									<option value="비공개" selected>비공개</option>
									<option value="1년 미만">1년 미만</option>
									<option value="1년~2년">1년~2년</option>
									<option value="3년~4년">3년~4년</option>
									<option value="5년~7년">5년~7년</option>
									<option value="10년 이상">10년 이상</option>
								</select>
							</div>
						</div>
					</div>
					<div class="py-3 pb-4 border-bottom">
						<button type="button" class="btn btn-primary mr-3" id="btn_md_req"> 신청 </button>
					</div>
					<div class="d-sm-flex align-items-center pt-3" id="deactivate">
						<div>
							<b>Please enter your information</b>
							<p>원활한 스터디 참가를 위해서 정보를 입력해주세요</p>
						</div>
						<br> <!-- End Modal -->
						
      				<!-- Modal Script -->
				      <script type="text/javascript">
				      
				      	function MyInfoModal() {
				      		console.log("-- My Info Modal Onclick Evn Start --")
							
								/* 유저 정보 저장된 값 가져오기 */
								$.ajax({
									url : "studyUser.do",
									type : "post",
									data : $("#frm_modal").serialize(),
									dataType : "json",
									success : function (result) {
											if (result){
												$("#memberId").text(result.memberId);
												$("#present").val(result.present);
												$("#license").val(result.license);
												$("#career option[value='"+ result.career  + "']").attr('selected','selected');
												$("#college option[value='"+ result.college + "']").attr('selected','selected');
										
												$.magnificPopup.open({
													  items: {
													    src: '#mod_myinfo'
													  }
													
													});
											}
										},
									error : function(err) {
										    console.log("error", err);
											/* alert('참가 신청을 원하시면, 스터디 검색란에서 내 정보를 입력해주세요.');
											history.back(); */

											swal('주의!', '참가 신청을 원하시면 내정보를 등록해주세요.', 'info')
											.then(function(){
												history.back();
											});
										}
								});
				      		
				      		// 모달 창 클릭시 OPEN
							/*  $('#mod_open').on('click', function (e) { 
								console.log("-- Study User Info Modal Open --");
							});  */
							
							/* 스터디 신청 보내기 */
				      		 $('#btn_md_req').on('click', function (e) {
									console.log("-- Study Req Start --");
									
									$.ajax({
										url : "studyReqInsert.do",
										type : "post",
										data : $("#frm_modal").serialize(),
										dataType : "text",
										success : function(result) {
											console.log(result);
											 if (result.state != null || result.state != '0' ) {
												
												// alert("스터디 참가 신청을하였습니다.");
												//location.href = "studyMain.do";
												
												swal('완료!', '스터디 참가 신청을하였습니다.', 'success')
												.then(function(e){
													location.href = "studyMain.do";
												});
												
											} 
										},
										error : function(err) {
											console.log("error", err);
										}
									});
									console.log("-- Study Req End --")
								});
				      	}
				      	
				      	function studyQna(id) {
				    		console.log("-- Study Qna Start --");
				    		$.ajax({
				    			type: "POST",
				    			url: "studyChat.do",
				    			data: {"ownerId": id},
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
				    		console.log("-- Study Qna End --")
						}
      				</script>
      			</div>
      		</div>
      	</form>
      </div>
  </main>
</body>
</html>
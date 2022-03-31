<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-03-25
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>

<style>
  .ui-tabs-vertical { width: 55em; }
  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; }
  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
  </style>
<!-- Home Section -->
<section class="small-section bg-dark-alfa-50 bg-scroll light-content" data-background="images/full-width-images/section-bg-19.jpg" id="home">
    <div class="container relative pt-70">
    
        <div class="row">
            
            <div class="col-md-8">
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                    <h1 class="hs-line-7 mb-20 mb-xs-10">My Page</h1>
                </div>
                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                   
                </div>
            </div>
        </div>
    
    </div>
</section>
<!-- End Home Section -->


<!-- Section -->
<section class="page-section">
    <div class="container relative">
        
        <div class="row">
        	<div id="info_box" class="col-md-8 offset-lg-1 mb-sm-80 order-first order-md-last">
				<!-- 나의 정보가 보이는 div -->
				<div id="my_info_box" class="border border-white" style="height:1000px;display:none">
					<h2>나의 정보</h2>
					<hr>
					<div>
						<img src="${member.profileImg}" alt="..">
						<table class="table">
							<tr>
								<th>아이디</th>
								<td colspan="5">${member.memberId}</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td colspan="3">${member.mail}</td>
								<th>이름</th>
								<td>${member.name}</td>
							</tr>
							<tr>
								<th>등급</th>
								<td>
									<c:if test="${member.role == 'admin'}">
										admin
									</c:if>
									<c:if test="${member.role != 'admin'}">
										<c:choose>
											<c:when test="${member.exp >= 10000 }">
												principal
											</c:when>
											<c:when test="${member.exp >= 5000 }">
												senior
											</c:when>
											<c:when test="${member.exp >= 1000 }">
												middle
											</c:when>
											<c:when test="${member.exp >= 100 }">
												junior
											</c:when>
											<c:otherwise>
												beginner
											</c:otherwise>
										</c:choose>
									</c:if>
								</td>
								<th>경험치</th>
								<td>${member.exp}</td>
								<th>포인트</th>
								<td>${member.cashPt}</td>
							</tr>
							<tr>
								<th>이력서</th>
								<td colspan="5">
									<c:if test="${empty member.resume}">
									등록된 이력서가 없습니다.
									</c:if>
									<c:if test="${not empty member.resume}">
									${member.resume}
									</c:if>
								</td>
							</tr>
						</table>
					</div>
				</div>
			
				<!-- 나의 정보를 수정하는 div -->
				<div id="info_update_box" class="border border-white" style="height:1000px">
					<h2>정보 수정</h2>
					<hr>
					<div>
						<form id="infoUpdFrm" action="" method="post">
							<table class="table">
								<tr>
									<th>아이디</th>
									<td colspan="5">
										<input id="memberId" name="memberId" class="form-control" readonly="readonly" type="text" value="${member.memberId}">
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td colspan="3">
										<input class="form-control" type="email" id="mail" name="mail" value="${member.mail}">
									</td>
									<th>이름</th>
									<td>
										<input class="form-control" type="text" id="name" name="name" value="${member.name}">
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td colspan="4">
										<input type="password" class="form-control" id="pwd" name="password">
									</td>
									<td colspan="1"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td colspan="4">
										<input type="password" class="form-control" id="pwdCheck">
									</td>
									<td colspan="1"></td>
								</tr>
								<tr>
									<th id="pwdChk" colspan="6"></th>
								</tr>
								<tr>
									<th>이력서</th>
									<td colspan="5">
										<c:if test="${empty member.resume}">
											<input type="file" name="file" id="resumeFile">
										</c:if>
										<c:if test="${not empty member.resume}">
											<input type="file" name="file" id="resumeFile">
										</c:if>
									</td>
								</tr>
								<tr>
									<th>프로필 사진 변경</th>
									<td colspan="5">
										<input type="file" name="imgFile" id="profileImg">
									</td>
								</tr>
							</table>
							<input type="submit" class="btn btn-primary" value="수정">
							<input type="reset" class="btn btn-danger" value="취소">
						</form>
					</div>
				</div>
			
				<!-- 나의 이력정보를 보여주는 div -->
				<div id="career_box" class="border border-white" style="height:1000px">
					<h2>나의 이력</h2>
					<hr>
					<div>
						
					</div>
				</div>
				
			</div>                                    
        
            <div class="col-md-4 col-lg-3 mt-10">
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Categories</h3>
                    
                    <div id="tabs" class="widget-body">
                        <ul class="clearlist widget-menu">
                            <li id="myInfo">
                                나의 정보
                            </li>
                               	<ul id="tag">
                               		<li id="info_update">정보수정</li>
                               		<li id="my_career">나의 이력</li>
                               		<li id="offer_record">구인 신청 이력</li>
                               	</ul>
                            <li id="myProject">
                                마이 프로젝트
                            </li>
                            <li id="myStudy">
                                마이 스터디
                            </li>
                            
                        </ul>
                    </div>
                    
                </div>
                <!-- End Widget -->
                </div>
         </div>

	</div>
</section>
<!-- End Section -->                
<script>
	
	// div들 display에 관한 기능들
	$('#myInfo').on('click',function(){
						$('#tag').children().css('display','block')
						$('#info_box').children().css('display','none');
						$('#my_info_box').css('display','block');
					});
	$('#myProject').on('click',function(){
						$('#tag').children().css('display','none');
						$('#info_box').children().css('display','none');
					   });
	$('#myStudy').on('click',function(){
						$('#tag').children().css('display','none');
						$('#info_box').children().css('display','none');
					});
	// myInfo 하위의 메뉴들이 보여줄 div들의 display에 관한 기능들
	$('#info_update').on('click',function(){
							$('#info_box').children().css('display','none');
							$('#info_update_box').css('display','block');
						})
	$('#my_career').on('click',function(){
		                  $('#info_box').children().css('display','none');
		                  $('#career_box').css('display','block');
					   });
	
	$('#offer_record').on('click',function(){
							$('#info_box').children().css('display','none');
						  })
	
	
	// 비밀번호 변경시 입력한 비밀번호가 비밀번호 확인에 입력한 비밀번호와 일치하는지 확인하는 function					
	$('#pwdCheck').on('change',function(){
		if($('#pwd').val() == $('#pwdCheck').val()){
			$('#pwdChk').text('');
			$('#pwdChk').text('비밀번호가 일치합니다').css('color','green');
		} else {
			$('#pwdChk').text('');
			$('#pwdChk').text('비밀번호가 일치하지 않습니다.').css('color','red');
		}
	});
</script>


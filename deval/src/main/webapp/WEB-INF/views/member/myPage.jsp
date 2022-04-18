<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-03-25
  Time: 오후 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				<div id="my_info_box" class="border border-white" style="height:1000px;">
					<h2>나의 정보</h2>
					<hr>
					<div>
						<img src="upload/profile/${member.profileImg}" alt="..">
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
									${member.tier}
								</td>
								<th>경험치</th>
								<td>${member.exp}</td>
								<th>포인트</th>
								<td>${member.cashPt}</td>
							</tr>
						</table>
					</div>
				</div>
			
				<!-- 나의 정보를 수정하는 div -->
				<div id="info_update_box" class="border border-white" style="height:1000px;display:none">
					<h2>정보 수정</h2>
					<hr>
					<div>
						<form id="infoUpdFrm" action="myInfoUpdate.do" method="post" enctype="multipart/form-data" onsubmit="return infoInputCheck()">
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
										<input class="form-control" type="email" id="mail" name="mail">
									</td>
									<th>이름</th>
									<td>
										<input class="form-control" type="text" id="name" name="name">
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
				
				<!-- 모집,신청,진행,완료된 프로젝트의 목록을 보여주는 div -->
				<div id="project_box" class="border border-white" style="height:1000px;display:none">
					<h2>프로젝트 목록</h2>
					<hr class="border border-white">
					<h3>대기중인 프로젝트</h3>
					<table id="waitProject" class="table">
						<thead>
							<tr>
								<th>프로젝트 이름</th>
								<th>프로젝트 기간</th>
								<th>프로젝트 시작일</th>
								<th>프로젝트 종료일</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<hr class="border border-white">
					<h3>참여한 프로젝트</h3>
					<table id="joinProject" class="table">
						<thead>
							<tr>
								<th>프로젝트 이름</th>
								<th>프로젝트 기간</th>
								<th>프로젝트 시작일</th>
								<th>프로젝트 종료일</th>
								<th>상태</th>
							</tr>
						</thead>	
						<tbody>
						</tbody>
					</table>				
				</div>
				
				<!-- 모집,신청,진행,완료된 스터디의목록을 보여주는 div -->
				<div id="study_box" class="border border-white" style="height:1000px;display:none">
					<h2>스터디 목록</h2>
					<hr class="border border-white">
					<h3>대기중인 스터디</h3>
					<table id="waitStudy" class="table">
						<thead>
							<tr>
								<th>스터디 이름</th>
								<th>스터디 장소</th>
								<th>스터디 시작일</th>
								<th>스터디 종료일</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<hr class="border border-white">
					<h3>진행중인 스터디</h3>
					<table id="joinStudy" class="table">
						<thead>
							<tr>
								<th>스터디 이름</th>
								<th>스터디 장소</th>
								<th>스터디 시작일</th>
								<th>스터디 종료일</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
						<!-- 	<a href="#test-modal" class="btn btn-mod btn-w btn-medium round mt-10 lightbox-gallery-5 mfp-inline"></a>
	                                
	                                <div id="test-modal" class="mfp-hide">
	                                    <h1>This is lightbox modal window</h1>
	                                    <p>
	                                        Lorem ipsum dolor sit amet, adipiscing elit. In maximus ligula semper metus pellentesque mattis. Maecenas volutpat, diam enim.
	                                    </p>
	                                </div> -->
					</table>
				</div>
				
				<!-- 모집,신청,진행,완료된 멘토 보여주는 div -->
				<div id="mento_box" class="border border-white" style="height:1000px;display:none">
					<h2>멘토서비스 목록</h2>
					<hr class="border border-white">
					<h3>대기중인 멘토서비스</h3>
					<table id="waitMento" class="table">
						<thead>
							<tr>
								<th>멘토 이름</th>
								<th>멘티 이름</th>
								<th>멘토서비스 시작일</th>
								<th>서비스 기간</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<hr class="border border-white">
					<h3>진행중인 멘토서비스</h3>
					<table id="joinMento" class="table">
						<thead>
							<tr>
								<th>멘토 이름</th>
								<th>멘티 이름</th>
								<th>멘토서비스 시작일</th>
								<th>서비스 기간</th>
								<th>상태</th>
								<th>평점주기</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				
				
				<!-- chating -->
				<!-- 모집,신청,진행,완료된 멘토 보여주는 div -->
				<div id="chatList_box" class="border border-white" style="height:1000px;display:none">
					<h2>채팅 목록</h2>
					<hr class="border border-white">
					<table id="chatList" class="table">
						<thead>
							<tr>
								<th>채팅방 주인</th>
								<th>채팅방 손님</th>
								<th>채팅방 타입</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
								
			</div>                                    
        
            <div class="col-md-4 col-lg-3 mt-10">
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Categories</h3>
                    
                    <div id="tabs" class="widget-body">
                        <ul class="clearlist widget-menu">
                            <li id="myInfo" class="bg-light">
                                나의 정보
                            </li>
                               	<ul id="tag">
                               		<li id="info_update">정보수정</li>
                               	</ul>
                            <li id="myProject">
                                마이 프로젝트
                            </li>
                            <li id="myStudy">
                                마이 스터디
                            </li>
                             <li id="myMento">
                            	마이 멘토
                            </li>
                            <li id="chatting">
                            	마이 채팅
                            </li>
                        </ul>
                    </div>
                    
                </div>
                <!-- End Widget -->
                </div>
              
         </div>

	</div>
	<form action="chatSelect.do" method="post" id="frm">
                	<input type="hidden" name="roomId">
     </form>
</section>
<!-- End Section -->                
<script>
	// category background 컬러 구분
	$('#tabs>ul>li').on('click',function(){
						$('#tabs>ul>ul>li').removeClass('bg-info');
						$('#tabs>ul>li').removeClass('bg-light');
						$(event.target).attr('class','bg-light');
				    })
				    
	$('#tabs>ul>ul>li').on('click',function(){
							$('#tabs>ul>ul>li').removeClass('bg-info');
							$(event.target).attr('class','bg-info');
					  })
	
	
	// div들 display에 관한 기능들
	$('#myInfo').on('click',function(){
						$('#tag').children().css('display','block')
						$('#info_box').children().css('display','none');
						$('#my_info_box').css('display','block');
					});
	
	// 마이프로젝트를 누를 시 ajax를 통해 나의 프로젝트 현황을 보여줌
	$('#myProject').on('click',function(){
						$('#tag').children().css('display','none');
						$('#info_box').children().css('display','none');
						$('#project_box').css('display','block');
						$.ajax({
							url:"myProjects.do",
							success : function(data){
								if(data === ''){
									$('#joinProject>tbody').empty();
									$('#waitProject>tbody').empty();
									$('#joinProject').append(makeNotTr(2));
									$('#waitProject').append(makeNotTr(1));
								} else {
									if(data.project.length == 0){
										$('#joinProject>tbody').empty();
										$('#joinProject').append(makeNotTr(2));	
									} else {
										$('#joinProject>tbody').empty();
										$.each(data.project,function(item,idx){
											$('#joinProject>tbody').append(makeTr(idx,4));
										})
									}
									
									if(data.wait.length == 0){
										$('#waitProject>tbody').empty();
										$('#waitProject').append(makeNotTr(1))	
									} else {
										$('#waitProject>tbody').empty();
										$.each(data.wait,function(item,idx){
											$('#waitProject>tbody').append(makeTr(idx,2))	
										})
									}
								}
							}
						});
					   });
	
	// 마이스터디를 누를 시 ajax를 통해 나의 스터디 현황을 보여줌
	$('#myStudy').on('click',function(){
						$('#tag').children().css('display','none');
						$('#info_box').children().css('display','none');
						$('#study_box').css('display','block');
						$.ajax({
							url:"myStudies.do",
							success : function(data){
								if(data === ''){
									$('#joinStudy>tbody').empty();
									$('#waitStudy>tbody').empty();
									$('#joinStudy').append(makeNotTr(2));
									$('#waitStudy').append(makeNotTr(1))
								} else {
									if(data.study.length == 0){
										$('#joinStudy>tbody').empty();
										$('#joinStudy').append(makeNotTr(2));	
									} else {
										$('#joinStudy>tbody').empty();
										$.each(data.study,function(item,idx){
											$('#joinStudy>tbody').append(makeTr(idx,3));
										})
									}
									
								 	if(data.wait.length == 0){
										$('#waitStudy>tbody').empty();
										$('#waitStudy').append(makeNotTr(1))	
									} else { 
										$('#waitStudy>tbody').empty();
										$.each(data.wait,function(item,idx){
											$('#waitStudy>tbody').append(makeTr(idx,1))	
										})
									}
								}
							}
						})
					});
	
	// 마이멘토를 누를 시 ajax를 통해 나의 멘토 현황을 보여줌
	$('#myMento').on('click',function(){
						$('#tag').children().css('display','none');
						$('#info_box').children().css('display','none');
						$('#mento_box').css('display','block');
						$.ajax({
							url:"myMento.do",
							success : function(data){
								if(data === ''){
									$('#joinMento>tbody').empty();
									$('#joinMento>tbody').empty();
									$('#joinMento').append(makeNotTr(2));
									$('#waitMento').append(makeNotTr(1));
								} else {
									console.log(data);
									 if(data.mento.length == 0){
										$('#joinMento>tbody').empty();
										$('#joinMento').append(makeNotTr(2));	
									} else {
										$('#joinMento>tbody').empty();
										$.each(data.mento,function(item,idx){
											$('#joinMento>tbody').append(mentoTr(idx));
										})
									}
									
									if(data.wait == null){
										$('#waitMento>tbody').empty();
										$('#waitMento').append(makeNotTr(1))	
									} else {
										$('#waitMento>tbody').empty();
										$.each(data.wait,function(item,idx){
											$('#waitMento>tbody').append(mentoTr(idx))	
										})
									}
								}
							}
						});
					   }); //End Mento
			// 마이채팅을 누를 시 ajax를 통해 나의 채팅목록을 보여줌
						$('#chatting').on('click',function(){
											$('#tag').children().css('display','none');
											$('#info_box').children().css('display','none');
											$('#chatList_box').css('display','block');
											$.ajax({
												url : "myChat.do",
												success : function(data) {
													if(data === '') {
														$('#chatList>tbody').empty();
														$('#chatList').append(makeNotTr(0));
													}else {
														if(data.chat.length == 0) {
															$('#chatList>tbody').empty();
															$('#chatList').append(makeNotTr(0));
														}else {
															$('#chatList>tbody').empty();
															$.each(data.chat,function(item,idx) {
																$('#chatList>tbody').append(makeChatTr(idx));
															})
														}
													}
												}
												});	
											});
	// myInfo 하위의 메뉴들이 보여줄 div들의 display에 관한 기능들
	$('#info_update').on('click',function(){
							$('#info_box').children().css('display','none');
							$('#info_update_box').css('display','block');
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
	
	// 정보 변경시 미입력한 값이 존재하는지 확인
	function infoInputCheck(){
		if($('#mail').val() == "" && $('#name').val() == "" && $('#profileImg').val() == "" && $('#pwdChk').css('color') == 'rgb(255, 255, 255)'){
			alert('변경하는 값이 존재하지 않습니다.')
			return false;
		} else {
			return true;
		}
	}
	
	function makeNotTr(n){
		var tr = $('<tr>');
		var td;
		if(n == 1){
			td = $('<td colspan="4">').text('신청 이력이 없습니다.')			
		}else if(n == 0) {
			td = $('<td colspan="4">').text('채팅방이 존재하지 않습니다 ^오^')	
		} else {
			td = $('<td colspan="5">').text('참여 이력이 없습니다.')
		}
		tr.append(td);
		return tr;
	}
	
	function makeTr(idx,n){
		var tr = $('<tr>')
		var td1 = $('<td>')
		var td2 = $('<td>')
		var td3 = $('<td>')
		var td4 = $('<td>')
		var td5 = $('<td>')
		
		if(n == 1 || n == 3){
			td1.text(idx.studyNm);
			td2.text(idx.location);
			td3.text(idx.studySdt);
			td4.text(idx.studyEdt);
		} else if(n == 2 || n == 4 ){
			td1.text(idx.projectName);
			td2.text(idx.projectTerm);
			td3.text(idx.projectSdt);
			td4.text(idx.projectEdt);
		} else if(n == 7 || n == 8) {
			td1.text(idx.mentoId);
			td2.text(idx.mentiId);
			td3.text(idx.startDate);
			td4.text(idx.serviceTerm);
		}
		if(idx.leaderId == '${member.memberId}'){
			tr.css('color','green');
		}
		tr.append(td1,td2,td3,td4);
		if (n==3) {
			if(idx.state == 0){
				td5.text('모집중')
			} else if(idx.state == 1){
				td5.text('마감')
			} else if(idx.state == 2){
				td5.text('진행중').css('color','blue')
			} else {
				td5.text('종료').css('color','green')
			}
			tr.append(td5)
		} else if(n == 4){
			if(idx.state == 1){
				td5.text('모집중')
			} else if(idx.state == 2){
				td5.text('마감')
			} else if(idx.state == 3){
				td5.text('진행중').css('color','blue')
			} else if(idx.state == 4){
				td5.text('종료').css('color','green')
			} else {
				td5.text('취소').css('color','red')
			}
			tr.append(td5)
		}
		return tr;
	};
	
	function mentoTr(idx){
		var tr = $('<tr>')
		var td1 = $('<td id="tdId" value="실험성공입니다.">')
		var td2 = $('<td>')
		var td3 = $('<td>')
		var td4 = $('<td>')
		var td5 = $('<td>')
		var td6 = $('<td>')
		var btn = $('<button type="button" onclick="sendRating()" class="btn btn-mod btn-w btn-circle btn-small">평점주기</button>');
		
		td1.text(idx.mentoId);
		td2.text(idx.mentiId);
		td3.text(idx.startDate);
		td4.text(idx.serviceTerm);
		console.log(idx.state);
		if(idx.state == 4) {
			td5.text('멘토거절(환불)').css('color', 'red');
		}else if(idx.state == 3) {
			td5.text('서비스종료(평점부여가능)').css('color', 'blue');
			td6.append(btn);
		}else if(idx.state == 2) {
			td5.text('서비스종료').css('color', 'green');			
		}else {
			td5.text('진행중').css('color', 'yellow');
		}
		tr.append(td1, td2, td3, td4, td5, td6);
		return tr;
	}
	
	function sendRating() {
		var url = "ratingFrom.do";
		var option = "top=10, left=10, width=500, height=600";
		window.open(url,"",option);
	}
	
	//채팅 td만들어주는곳
	function makeChatTr(item) {
		var tr = $('<tr onclick="selectChat('+item.roomId+')">')
		var td1 = $('<td>')
		var td2 = $('<td>')
		var td3 = $('<td>')
		td1.text(item.ownerId);
		td2.text(item.entryId);
		tr.append(td1,td2);
		//tr.addEventListener('click', selectChat(item.roomId));
		
		return tr;
	}
	//chat 들어가기
	function selectChat(n) {
		frm.roomId.value = n;
		frm.submit();
	};
</script>


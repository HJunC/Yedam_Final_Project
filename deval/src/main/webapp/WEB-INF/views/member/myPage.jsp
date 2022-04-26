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
       .star {
    position: relative;
    font-size: 2rem;
    color: #ddd;
  }
  
  .star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: red;
    overflow: hidden;
    pointer-events: none;
  }
  </style>
<!-- Home Section -->
<section class="small-section bg-dark-alfa-50 bg-scroll light-content" id="home">
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

<style>
	.widget-menu{
		cursor:pointer;
	}
	.widget-menu li:hover{
		background-color:gray;
	}
</style>
<!-- Section -->
<section class="page-section">
    <div class="container relative">
    
        
        <div class="row">
        
        <div class="col-md-4 col-lg-2 mt-10">
                <!-- Widget -->
                <div class="widget">
                    
                    <h3 class="widget-title">Categories</h3>
                    
                    <div id="tabs" class="widget-body table-hover">
                        <ul class="clearlist widget-menu">
                            <li id="myInfo" class="bg-secondary">
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
                        </ul>
                    </div>
                    
                </div>
                <!-- End Widget -->
           </div>

           <div id="info_box" class="col-md-10 mb-sm-80 order-first order-md-last">
            <!-- 나의 정보가 보이는 div -->
            <div id="my_info_box" class="border border-secondary" style="height:400px;">
               <h2>나의 정보</h2>
               <hr>
               <div>
                  <div class="row">
                     <div class="col-5">
                        <div style="width:100%">
                           <img src="/upload/profile/${member.profileImg}" alt=".." style="object-fit: fill;width:100%;max-height:300px;">
                        </div>
                     </div>
                  <div class="col-7">
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
                     <button type="button" class="btn btn-mod btn-border-w btn-round btn-small" onclick="memberOut()">회원탈퇴</button>
                     </div>
                  </div>
               </div>
            </div>
         
            <!-- 나의 정보를 수정하는 div -->
            <div id="info_update_box" class="border border-secondary" style="height:500px;display:none">
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
            <div id="project_box" class="border border-secondary" style="height:1000px;display:none">
               <h2>프로젝트 목록</h2>
               <hr class="border border-white">
               <h3>대기중인 프로젝트</h3>
               <div class="overflow-auto" style="height: 200px;">
                  <table id="waitProject" class="table table-hover table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>이름</th>
                           <th>기간</th>
                           <th>사용 언어</th>
                           <th>모집 종료일</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>
               <hr class="border border-white">
               <h3>진행중인 프로젝트</h3>
               <div class="overflow-auto" style="height:200px;">
               <table id="joinProject" class="table table-hover table-dark">
                  <thead>
                     <tr style="color:#A7A9A5;">
                        <th>이름</th>
                        <th>기간</th>
                        <th>시작일</th>
                        <th>종료일</th>
                        <th>상태</th>
                     </tr>
                  </thead>   
                  <tbody>
                  </tbody>
               </table>
               </div>   
               <hr class="border border-white">
               <h3>종료된 프로젝트</h3>
               <div class="overflow-auto" style="height:200px;">
                  <table id="endProject" class="table table-hover table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>이름</th>
                           <th>기간</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th>상태</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>         
            </div>
            
            <!-- 모집,신청,진행,완료된 스터디의목록을 보여주는 div -->
            <div id="study_box" class="border border-secondary" style="height:1000px;display:none">
               <h2>스터디 목록</h2>
               <hr class="border border-white">
               <h3>대기중인 스터디</h3>
               <div class="overflow-auto" style="height: 200px;">
                  <table id="waitStudy" class="table table-hover table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>이름</th>
                           <th>장소</th>
                           <th>시작일</th>
                           <th>종료일</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>
               <hr class="border border-white">
               <h3>진행중인 스터디</h3>
               <div class="overflow-auto" style="height: 200px;">
                  <table id="joinStudy" class="table table-hover table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>이름</th>
                           <th>장소</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th>상태</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>
               <hr class="border border-white">
               <h3>종료된 스터디</h3>
               <div class="overflow-auto" style="height: 200px;">
                  <table id="endStudy" class="table table-hover table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>이름</th>
                           <th>장소</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th>상태</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>
            </div>
            
            <!-- 모집,신청,진행,완료된 멘토 보여주는 div -->
            <div id="mento_box" class="border border-secondary" style="height:1000px;display:none">
               <h2>멘토서비스 목록</h2>
               <input type="hidden" id="serviceNo">
               <hr class="border border-white">
               <h3>대기중인 멘토서비스</h3>
               <div class="overflow-auto" style="height: 200px;">
                  <table id="waitMento" class="table table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>멘토</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th>시간</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>
               <hr class="border border-white">
               <h3>진행중인 멘토서비스</h3>
               <div class="overflow-auto" style="height: 200px;">
                  <table id="joinMento" class="table table-hover table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>멘토</th>
                           <th>멘티</th>
                           <th>시작일</th>
                           <th>종료일</th>
                           <th>시간</th>
                           <th>상태</th>
                           <th>평점</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>
               <hr class="border border-white">
               <h3>종료된 멘토서비스</h3>
               <div class="overflow-auto" style="height: 200px;">
                  <table id="endMento" class="table table-hover table-dark">
                     <thead>
                        <tr style="color:#A7A9A5;">
                           <th>멘토</th>
                           <th>멘티</th>
                           <th>시작일</th>
                           <th>기간</th>
                           <th>상태</th>
                           <th>평점</th>
                        </tr>
                     </thead>
                     <tbody>
                     </tbody>
                  </table>
               </div>
            </div>
                        
         </div>                                    
        
         </div>

   </div>
   
   <!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<h3 style="color: black">멘토 평점</h3>
					<span class="star"> ★★★★★ <span>★★★★★</span> 
					<input id="stars" type="range" oninput="drawStar(this)" value="1" step="1" min="2" max="10">
					</span>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick="rate()">평점등록!</button>
				</div>
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
                  $('#tabs>ul>ul>li').removeClass('bg-success');
                  $('#tabs>ul>li').removeClass('bg-secondary');
                  $(event.target).attr('class','bg-secondary');
                })
                
   $('#tabs>ul>ul>li').on('click',function(){
                  $(event.target).attr('class','bg-success');
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
                           $('#waitProject>tbody').empty();
                           $('#joinProject>tbody').empty();
                           $('#endProject>tbody').empty();
                           $('#waitProject').append(makeNotTr(0));
                           $('#joinProject').append(makeNotTr(1));
                           $('#endProject').append(makeNotTr(2));
                        } else {
                        	console.log(data)
                        	console.log("doing : "+data.project.length);
                        	console.log("end : "+data.end.length);
                        	console.log("wait : "+data.wait.length);
                           if(data.project.length == 0){
                              $('#joinProject>tbody').empty();
                              $('#joinProject').append(makeNotTr(1));
                           } else {
                              $('#joinProject>tbody').empty();
                              $.each(data.project,function(item,idx){
                                 $('#joinProject').append(makeDoingTr(idx,1));
                              })
                           }
                           if(data.end.length == 0){
                              $('#endProject>tbody').empty();
                              $('#endProject').append(makeNotTr(2));
                           } else {
                              $('#endProject>tbody').empty();
                              $.each(data.end,function(item,idx){
                                 $('#endProject').append(makeEndTr(idx,1))
                              })
                           }
                           
                           if(data.wait.length == 0){
                        	   console.log('없음')
                              $('#waitProject>tbody').empty();
                              $('#waitProject').append(makeNotTr(0))   
                           } else {
                        	   console.log('있음')
                              $('#waitProject>tbody').empty();
                              $.each(data.wait,function(item,idx){
                                 $('#waitProject').append(makeWaitTr(idx,1))   
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
                           $('#waitStudy>tbody').empty();
                           $('#joinStudy>tbody').empty();
                           $('#endStudy>tbody').empty();
                           $('#waitStudy').append(makeNotTr(0))
                           $('#joinStudy').append(makeNotTr(1));
                           $('#endProject').append(makeNotTr(2));
                        } else {
                           if(data.study.length == 0){
                              $('#joinStudy>tbody').empty();
                              $('#joinStudy').append(makeNotTr(1));
                           } else {
                              $('#joinStudy>tbody').empty();
                              $.each(data.study,function(item,idx){
                                 $('#joinStudy>tbody').append(makeDoingTr(idx,2));
                              })
                           }
                           
                           if(data.end.length == 0){
                              $('#endStudy>tbody').empty();
                              $('#endStudy').append(makeNotTr(2));
                           } else {
                              $('#endStudy>tbody').empty();
                              $.each(data.end,function(item,idx){
                                 $('#endStudy').append(makeEndTr(idx,2))
                              })
                           }
                           
                            if(data.wait.length == 0){
                              $('#waitStudy>tbody').empty();
                              $('#waitStudy').append(makeNotTr(0))   
                           } else { 
                              $('#waitStudy>tbody').empty();
                              $.each(data.wait,function(item,idx){
                                 $('#waitStudy').append(makeWaitTr(idx,2))   
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
                    	 console.log(data.end);
                    	 console.log(data);
                        if(data === ''){
                           $('#waitMento>tbody').empty();
                           $('#joinMento>tbody').empty();
                           $('#endMento>tbody').empty();
                           $('#waitMento').append(makeNotTr(0));
                           $('#joinMento').append(makeNotTr(1));
                           $('#endMento').appned(makeNotTr(2));
                        } else {
                            if(data.mento.length == 0){
                              $('#joinMento>tbody').empty();
                              $('#joinMento').append(makeNotTr(1));
                           } else {
                              $('#joinMento>tbody').empty();
                              $.each(data.mento,function(item,idx){
                                 $('#joinMento').append(makeDoingTr(idx,3));
                              })
                           }
                            
                            if(data.end.length == 0){
                               $('#endMento>tbody').empty();
                               $('#endMento').append(makeNotTr(2));
                            } else {
                               $('#endMento>tbody').empty();
                               $.each(data.end,function(item,idx){
                                  $('#endMento').append(makeEndTr(idx,3))
                               })
                            }
                           
                           if(data.wait.length == 0){
                              $('#waitMento>tbody').empty();
                              $('#waitMento').append(makeNotTr(0))   
                           } else {
                              $('#waitMento>tbody').empty();
                              $.each(data.wait,function(item,idx){
                                 $('#waitMento').append(makeWaitTr(idx,3))   
                              })
                           }
                        }
                     }
                  });
                  }); //End Mento
   // myInfo 하위의 메뉴들이 보여줄 div들의 display에 관한 기능들
   $('#info_update').on('click',function(){
                     $('#info_box').children().css('display','none');
                     $('#info_update_box').css('display','block');
                  })
                  
   //회원탈퇴 확인을 위한 기능
   function memberOut(){
      var pwd = prompt('비밀번호를 입력해주세요');
      if(pwd == '${member.password}'){
         var result = confirm('정말로 탈퇴하시겠습니까?');
         if(result){
            $.ajax({
               url:"memberOut.do",
               data:{memberId:'${member.memberId}'},
               type:'post',
               success:function(data){
                  if(data == 1){
                     alert('탈퇴되었습니다.')
                     location.href="home.do";
                  } else {
                     alert('오류로 인해 탈퇴되지 않았습니다.');
                  }
               }
            })
         } else {
            alert('탈퇴가 취소되었습니다.');
         }
      } else {
         alert('비밀번호가 일치하지 않습니다.');
      }
   }
   
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
   
   // 정보가 없는 항목의 tr을 만들어주는 기능
   function makeNotTr(n){
      var tr = $('<tr>');
      var td = $('<th>');
      if(n == 0){
         td.attr('colspan','6').text('신청 이력이 없습니다').css('color','#A7A9A5')
      }else if(n == 1) {
         td.attr('colspan',"7").text('참여 이력이 없습니다.').css('color','#A7A9A5')      
      } else {
         td.attr("colspan","6").text('종료 이력이 없습니다.').css('color','#A7A9A5')
      }
      tr.append(td);
      return tr;
   }
   
   // 수락 대기중인 정보의 tr을 만들어주는 기능
   function makeWaitTr(idx,n) {
      var tr = $('<tr>').css('color','#A7A9A5')
      var td1 = $('<td>')
      var td2 = $('<td>')
      var td3 = $('<td>')
      var td4 = $('<td>')
      var no;
      if(n == 1) {
         no = idx.projectNo
         tr.on('click',function(){
            location.href='project/projectDetail.do?no='+no;
         })
         td1.text(idx.projectName);
         td2.text(idx.projectTerm);
         td3.text(idx.lang);
         td4.text(idx.recruitEdt)
      } else if(n == 2){
         no = idx.studyNo
         tr.on('click',function(){
            location.href='study/studySelect.do?studyNo='+no;
         })
         td1.text(idx.studyNm);
         td2.text(idx.location);
         td3.text(idx.studySdt);
         td4.text(idx.studyEdt);
      } else {
         td1.text(idx.mentoId);
         td2.text(idx.startDate)
         td3.text(idx.endDate)
         td4.text(idx.startTm+'-'+idx.endTm)
      }
      tr.append(td1,td2,td3,td4);
      return tr;
   }
   
   // 진행중인 정보의 tr을 만들어주는 기능
   function makeDoingTr(idx,n) {
      var tr = $('<tr>');
      var no;
      var state;
      if(n == 1){
         no = idx.projectNo;
         console.log(no);
         state = idx.state;
         tr.on('click',function(){
            location.href='project/projectDetail.do?no='+no;
         })
         var td1 = $('<td>').text(idx.projectName);
         var td2 = $('<td>').text(idx.projectTerm);
         var td3 = $('<td>').text(idx.projectSdt);
         var td4 = $('<td>').text(idx.projectEdt);
         if(state == 3){
            var td5 = $('<td>').text('진행중').css('color','#7F8DF5');
         } else {
            var td5 = $('<td>').text('시작 대기중').css('color','#F1F57F');
         }
         tr.append(td1,td2,td3,td4,td5);
      } else if(n == 2) {
         no = idx.studyNo
         state = idx.state
         tr.on('click',function(){
            location.href='study/studySelect.do?studyNo='+no;
         })
         var td1 = $('<td>').text(idx.studyNm);
         var td2 = $('<td>').text(idx.location);
         var td3 = $('<td>').text(idx.studySdt);
         var td4 = $('<td>').text(idx.studyEdt);
         if(state == 0){
            var td5 = $('<td>').text('시작 대기중').css('color','#F1F57F');
         } else {
            var td5 = $('<td>').text('진행중').css('color','#7F8DF5');
         }
         tr.append(td1,td2,td3,td4,td5);
      } else {
         state = idx.state
         tr.attr('data-id',idx.mentoServiceNo);
         var td1 = $('<td>').text(idx.mentoId);
         var td2 = $('<td>').text(idx.mentiId);
         var td3 = $('<td>').text(idx.startDate);
         var td4 = $('<td>').text(idx.endDate);
         var td5 = $('<td>').text(idx.startTm+'-'+idx.endTm);
         if(state == 1){
            var td6 = $('<td>').text('진행중').css('color','#7F8DF5');
            var td7 = $('<td>')
         } else {
            var td6 = $('<td>').text('평점 대기중').css('color','#F1F57F');
            if(idx.mentoId != '${member.memberId}'){
            	var td7 = $('<td>').append($('<button type="button" onclick="sendRating()" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">평점주기</button>'));
            } else {
            	var td7 = $('<td>');
            }
         }
         tr.append(td1,td2,td3,td4,td5,td6,td7);
      }
      return tr;
   }
   
   // 종료된 정보의 tr을 만들어주는 기능
   function makeEndTr(idx,n){
      var no;
      var state;
      var tr = $('<tr>')
      if(n == 1){
         no = idx.projectNo;
         state = idx.state;
         tr.on('click',function(){
            location.href='project/projectDetail.do?no='+no;
         })
         var td1 = $('<td>').text(idx.projectName);
         var td2 = $('<td>').text(idx.projectTerm);
         var td3 = $('<td>').text(idx.projectSdt);
         var td4 = $('<td>').text(idx.projectEdt);
         if(state == 4){
            var td5 = $('<td>').text('완료').css('color','#7FF38F');
         } else {
            var td5 = $('<td>').text('취소').css('color','#F2625F');
         }
         tr.append(td1,td2,td3,td4,td5)
      } else if(n == 2){
         no = idx.studyNo;
         state = idx.state;
         tr.on('click',function(){
            location.href='study/studySelect.do?studyNo='+no;
         })
         var td1 = $('<td>').text(idx.studyNm);
         var td2 = $('<td>').text(idx.location);
         var td3 = $('<td>').text(idx.studySdt);
         var td4 = $('<td>').text(idx.studyEdt);
         if(state == 1) {
            var td5 = $('<td>').text('중단').css('color','#F2625F');
         } else {
            var td5 = $('<td>').text('완료').css('color','#7FF38F');
         }
         tr.append(td1,td2,td3,td4,td5);
      } else {
         state = idx.state;
         var td1 = $('<td>').text(idx.mentoId);
         var td2 = $('<td>').text(idx.mentiId);
         var td3 = $('<td>').text(idx.startDate);
         var td4 = $('<td>').text(idx.serviceTerm);
         if(state == 2) {
            var td5 = $('<td>').text('완료').css('color','#7FF38F');
            var td6 = $('<td>').text(idx.stsfdg);
         } else {
            var td5 = $('<td>').text('취소').css('color','#F2625F');
            var td6 = $('<td>');
         }
         tr.append(td1,td2,td3,td4,td5,td6);
      }
      return tr;
   }
   
   function sendRating() {
      console.log($(event.target).parent().parent().data('id'))
      var id = $(event.target).parent().parent().data('id')
      $('#serviceNo').val(id);
   }
   
   
   //별점 처리
    const drawStar = (target) => {
           document.querySelector('.star span').style.width = target.value * 10 + '%';
           }
    
    function rate() {
		$.ajax({
			url : "rating.do",
			type : "post",
			data : {
				ratingNum : ($('#stars').val())/2,
				mentoServiceNo : $('#serviceNo').val()
				},
			success : function() {
				alert('평점이 등록되었습니다.');
				location.reload();
			},
			error: function() {
				alert("에러");
			}
		})
	}
</script>

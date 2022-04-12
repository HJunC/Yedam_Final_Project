
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="resources" value="${pageContext.request.contextPath}/resources" />

<!-- 모달창 링크 -->
<link rel="stylesheet" href="${resources}/css/custom/study_modal_style.css">

<!-- 지도 -->
<link rel="stylesheet" href="${resources}/css/custom/korea.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="${resources}/js/study/common.js"></script>
</head>
<body>

	<!-- Title -->
                <section class="small-section bg-dark-alfa-50" data-background="images/full-width-images/section-bg-19.jpg">
                    <div class="container relative">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">STUDY</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                         스터디 찾기
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
      <!-- End Title -->
      
     <!-- Start Study Map -->
     <div class="d-flex justify-content-center" style="padding: 40px;">
     	<script type="text/javascript" src="${resources}/js/study/d3.js"></script>
    	<script type="text/javascript" src="${resources}/js/study/korea.js"></script>
    	<div id="container" align="center"></div>
     </div>	
     <!-- End Study Map -->
     
     
     <!-- Start Search List -->
      	<div align="center">
		<section class="page-section bg-dark light-content pt-0">
			<div class="container relative">
					<div class="row">
						<div>
							<form class="form" id="searchForm" action="studyList.do" style="position: sticky; top: 100px" method="get">
							<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	  						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	  						<input type="hidden" name="location" >
	  						
								<label for="lang" style="font-size: 17px;">언어 </label> 
								<select id="cqLang" name="lang1" class="input-md round form-control" style="width: 100px; height: 30px; font-size: 13px;">
									<option value="">전체</option>
									<option>Apache Groovy</option>
									<option>C</option>
									<option>C#</option>
									<option>C++</option>
									<option>Crystal</option>
									<option>Clojure</option>
									<option>Dart</option>
									<option>Elixir</option>
									<option>Elm</option>
									<option>Erlang</option>
									<option>Fortran</option>
									<option>Go</option>
									<option>GraphQL</option>
									<option>Haskell</option>
									<option>Java</option>
									<option>Javascript</option>
									<option>Julia</option>
									<option>Kotlin</option>
									<option>LaTeX</option>
									<option>Lua</option>
									<option>Markdown</option>
									<option>Nim</option>
									<option>Octave</option>
									<option>PHP</option>
									<option>Perl</option>
									<option>Python</option>
									<option>R</option>
									<option>Ruby</option>
									<option>Rust</option>
									<option>Scala</option>
									<option>Shell Script</option>
									<option>Solidity</option>
									<option>Swift</option>
									<option>TypeScript</option>
									<option>Zig</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp; 
								<label for="type" style="font-size: 17px;">난이도</label> 
								<select id="cqType" name="defficulty" class="input-md round form-control" style="width: 100px; height: 30px; font-size: 13px;">
									<option value="">전체</option>
									<option value="상">상</option>
									<option value="중">중</option>
									<option value="하">하</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="text" name="codeSearch" id="codeSearch" 
								class="input-sm round" placeholder="검색" 
								style="width: 300px; height: 30px; font-size: 13px;" />
								&nbsp;
								<button type="submit" class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
							</form>
						</div>
					</div><br>
					<!-- End Search List -->

					<!-- Start Study List -->
					<div class="table-responsive" >
					<div class="container relative text-center" >
						<table id="locSearch" class="table shopping-cart-table" >
						  <thead>
							<tr align="center">
								<th width="120">팀번호</th>
								<th width="250">지역</th>
								<th width="300">언어</th>
								<th width="500">스터디명</th>
								<th width="150">스터디장</th>
								<th width="150">난이도</th>
								<th width="150">인원</th>
								<th width="400">학습기간</th>
								<th width="150">현재상태</th>
							 </tr>
							</thead>
							<tbody style="font-size: 15px;">
							<c:forEach items="${study }" var="std">
								<tr onclick="studySearch('${std.studyNo }')">
									<td>${std.studyNo }</td>
									<td>${std.location }</td>
									<td>${std.lang1 }<c:if test="${not empty std.lang2 }"> / ${std.lang2 }</c:if></td>
									<td>${std.studyNm }</td>
									<td>${std.leaderId }</td>
									<td>${std.defficulty }</td>
									<td>${std.rcnt}/${std.maxRcnt }</td>
									<td>${std.studySdt }~${std.studyEdt }</td>
									<c:choose>
					                    <c:when test="${std.state eq '0'}">
					                    	<td><p class="badge bg-success">모집중</p></td>
					                    </c:when>
					                    <c:when test="${std.state eq '2'}">
					                    	<td><p class="badge bg-warning text-dark">모집완료</p></td>
					                    </c:when>
                					</c:choose>
								</tr>
							</c:forEach>
							</tbody>
							</table>
						</div>
						<!-- End Study List -->
						
						
						<!-- Study Add button -->
						<div align="right">
							<c:if test="${studyfind.leaderId ne member.name}">
		 						<c:if test="${empty list[0]}">
									<input class="btn btn-mod btn-round btn-w btn-small" type="button" value="모집" onclick="location.href='addStudy.do'">
								</c:if>
							</c:if>
							<a href="#mod_myinfo" id="mod_open" class="btn btn-mod btn-round btn-w btn-small lightbox-gallery-5 mfp-inline">내정보</a>
						</div> 
								
								
						
						<!-- Pagination -->
					       <div class="pagination" align="center">
					          <ul class="pagination" id="pagination"></ul>
					       </div>
    				   <!-- End Pagination -->
					</div>
				</div>
		</section>
		<br>
		
		<style>
			.pagination {
		    display: flex;
		    padding-left: 0;
		    list-style: none;
		    justify-content: space-evenly;
		}
		</style>
		
		<style>
			.page-item.active .page-link {
    		z-index: 3;
    		color: #fff;
		    background-color: black;
		    border-color: black;
}
		</style>
	
	
	<!-- Modal Start -->
		<style>
		.mfp-content {
			border: 1px solid #ddd;
			border-radius: 15px;
			padding: 0 !important;
			max-width: 630px !important;
		}
		</style> 

		<div id="mod_myinfo" class="mfp-hide">
			<form id="frm_modal" name="frm_modal">
				<div class="wrapper bg-white mt-sm-5" id="test-modal">
					<h4 class="pb-4 border-bottom">MY INFO</h4>
					<div class="d-flex align-items-start py-3 border-bottom">
						<img src="https://images.pexels.com/photos/1037995/pexels-photo-1037995.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" class="img" alt="">
						<div class="pl-sm-4 pl-2 ms-4" id="img-section">
							<b>#STUDY</b>
							<h3 style="margin: 0" id="memberId"></h3>
						</div>
					</div>
					<div class="py-2">
						<div class="row py-2">
							<div class="col-md-6">
								<textarea class="bg-light form-control" rows="10" cols="40"
									name="present" id="present" placeholder="소개 내용을 입력하세요"></textarea>
							</div>
							<div class="col-md-6 pt-md-0 pt-3">
								<textarea class="bg-light form-control" rows="10" cols="40"
									name="license" id="license" placeholder="자격증 (선택사항)"></textarea>
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
						<button class="btn btn-primary mr-3" id="btn_md_save"> Save </button>
						<input type="reset" class="btn border button" value="Reset">
					</div>
					<div class="d-sm-flex align-items-center pt-3" id="deactivate">
						<div>
							<b>Please enter your information</b>
							<p>원활한 스터디 참가를 위해서 정보를 입력해주세요</p>
						</div>
						<br>
						<!-- <div class="ml-auto">
							<button class="btn danger" id="btn_md_cls">CLOSE</button>
						</div> -->
						
						<!-- Modal close & Modal User data -->
						<script type="text/javascript">
							$('#btn_md_cls').on('click', function() {
								$('#mod_myinfo').modal('hide');
							});
							
							$('#mod_open').on('click', function (e) { 
								console.log("Study User Info Modal Open");
								
								$.ajax({
									url : "studyUser.do",	//유저 정보 가져오기
									type : "post",
									data : $("#frm_modal").serialize(),
									dataType : "json",
									success : function(result) {
										$("#memberId").text(result.memberId);
										$("#present").val(result.present);
										$("#license").val(result.license);
										$("#career option[value='"+ result.career  + "']").attr('selected','selected');
										$("#college option[value='"+ result.college + "']").attr('selected','selected');
									},
									error : function(err) {
										console.log("err", err);
									}
								});
							});
							
							/*
							* 모달 창 멤버 정보 저장
							* LOGIN MEMBER INFO NULL=! => UPDATE or INFO SAVE
							* LOGIN MEMBER INFO NULL => INSERT
							*/
							$('#btn_md_save').on('click', function (e) { 
								console.log("-- Study UserInfo Save Start --");
								
								$.ajax({
									url : "studyUserEdit.do",
									type : "post",
									data : $("#frm_modal").serialize(),
									dataType : "text",
									success : function(result) {
										console.log("succ", result);
										if (result != "0") {
											alert("나의 스터디 정보 입력을 성공하였습니다.");
										}
									},
									error : function(err) {
										console.log("err", err);
									}
								});
								
								console.log("-- Study UserInfo Save End --");
							});
						</script>
					</div>
				</div>
			</form>
		</div>
	<!-- End Modal -->
	</div>
	${param.defficulty}
	<!-- 게시글 번호 값으로 상세글 넘기기 -->
	<div>
		<form id="selfrm" action="studySelect.do" method="post">
			<sec:csrfInput />
			<input type="hidden" id="studyNo" name="studyNo">
		</form>
	</div>
	<script type="text/javascript">
		function studySearch(n) {
			document.forms.selfrm.studyNo.value = n;
			document.forms.selfrm.submit();
		}
	</script>
    
    <script src="${resources}/js/common/jQueryPage.js"></script>
	<script>
    var endPage = ${pageMaker.endPage}
    var current = ${pageMaker.cri.pageNum}

    window.pagObj = $('#pagination').twbsPagination({
      totalPages: endPage,
      startPage: current,
      visiblePages: 5, // 최대로 보여줄 페이지
      prev: "<i class='fa fa-chevron-left'></i>", // Previous Button Label
      next: "<i class='fa fa-chevron-right'></i>", // Next Button Label
      first: '«', // First Button Label
      last: '»', // Last Button Label
      onPageClick: function (event, page) { // Page Click event
        console.info("current page : " + page);
      } }).on('page', function (event, page) {
      searchDateList(page);
    });

  function searchDateList(page) {
    var searchForm = $("#searchForm");
    console.log(page);
    searchForm.find("input[name='pageNum']").val(page);
    searchForm.submit();
  }
  
  window.onload = function() {
		console.log('test')
	    drawMap('#container');
		
	};
$(document).ready(function() {
	
	$("select[name=defficulty]").val('${param.defficulty}');
	$("select[name=lang1]").val('${param.lang1}');
});
	
</script>
</body>
</html>
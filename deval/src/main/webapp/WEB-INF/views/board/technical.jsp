<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
tr {
	text-decoration: none;
	font-size: 15px;
	border: 30px;
	line-height: 40px;
}

td {
	border: 2;
	text-align: center;
	margin: 10px 10px;
	cursor: pointer;
}

.button {
	width: 100px;
	height: 40px;
	border: none;
	border-radius: 5px;
	padding: 2px 1px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	margin: 10px 1px;
	cursor: pointer;
	float: right;
}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<div align="center">
		<section class="page-section bg-dark light-content" id="home">
			<div class="container relative text-center">
				<div class="row">
					<div class="col-lg-11 offset-lg-10"></div>
					<h1 class="hs-line-7 mb-20 wow fadeInUpShort" data-wow-delay=".2s">최신기술</h1>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br>


					<section class="page-section bg-dark light-content pt-0">
						<div class="container relative">
							<form id="searchForm" action="technical.do" class="row">
								<div align="left">
									<label class="hidden">검색 분류</label> <select name="option">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="writer">작성자</option>
										<option value="subject">내용</option>
									</select> <input type="text" name="keyvalue" id="codeSearch"
										class="input-sm round" placeholder="검색"
										style="width: 300px; height: 40px;" />

									<button type="submit"
										class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
									<input type="hidden" name="pageNum"
										value="${pageMaker.cri.pageNum}"> <input type="hidden"
										name="amount" value="${pageMaker.cri.amount}">

								</div>
							</form>

						</div>
					</section>
					<div class="table-responsive">
						<table class="table shopping-cart-table">
							<tr align="center">
								<th width="50">No</th>
								<th width="250">제목</th>
								<th width="100">작성자</th>
								<th width="100">작성일자</th>
								<th width="50">조회수</th>
								<th width="50">추천수</th>
							</tr>


							<c:forEach items="${technicList}" var="list3">
								<tr class="active" onclick="technicSelect(${list3.boardNo})">
									<td>${list3.boardNo}</td>
									<th align="left">${list3.title}</th>
									<td>${list3.writer}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${list3.boardDate}" /></td>
									<td>${list3.hit}</td>
									<td>${list3.recommend}</td>
								</tr>
							</c:forEach>
						</table>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">
							<div align="right">
								<input class="btn btn-mod btn-round btn-border-w btn-small"
									type="button" value="글쓰기"
									onclick="location.href='write.do?no=3'">
							</div>
						</sec:authorize>
						<form action="technicSelect.do" id="boardSS3">
							<input type="hidden" name="boardNo" id="boardSe3" />
						</form>

						<div class="pagination">
							<ul class="pagination" id="pagination"></ul>
						</div>
					</div>
				</div>
			</div>
		</section>
</div>



	<script src="${resources}/js/common/jQueryPage.js"></script>

	<script>
   var endPage = ${pageMaker.endPage}
   var current = ${pageMaker.cri.pageNum}

   window.pagObj = $('#pagination').twbsPagination({
     totalPages: endPage,
     startPage: current,
     visiblePages:10, // 최대로 보여줄 페이지
     prev: "<i class='fa fa-chevron-left'></i>", // Previous Button Label
     next: "<i class='fa fa-chevron-right'></i>", // Next Button Label
     first: '«', // First Button Label
     last: '»', // Last Button Label
     onPageClick: function (event, page) { // Page Click event
       console.info("current page : " + page);
     } }).on('page', function (event, page) {
     searchPage(page);
   });

 // 검색하는 함수
 function searchPage(page) {
   var searchForm = $("#searchForm");
   console.log(page);
   searchForm.find("input[name='pageNum']").val(page);
   searchForm.submit();
 }
 
 function search() {
      var searchForm = $("#searchForm"); 
      searchForm.find("input[name='pageNum']").val("1");
      searchForm.submit();
    }


function technicSelect(t){
boardSS3.boardSe3.value= t;
boardSS3.submit();   
   
}

 
</script>

</body>
</html>
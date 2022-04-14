<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="resources"
	value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
tr {
	text-decoration: bold;
	font-size: 20px;
	border: 10px;
	line-height: 30px;
}

td {
	border: 1;
	text-align: center;
	margin: 10px 1px;
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
 	<div align="center">
		<section class="page-section bg-dark light-content" id="home">
			<div class="container relative text-center">
				<div class="row">
					<div class="col-lg-10 offset-lg-1"></div>
				<h1 class="hs-line-7 mb-10 wow fadeInUpShort" data-wow-delay=".2s">공지</h1>
				</div>
			</div>
		</section>
		<section class="page-section bg-dark light-content pt-0">
			<div class="container relative">
				<div class="row">
					<div>
						<form id="searchForm" class="row">
							<div class="col-lg-10 offset-lg-1">
								<input type="text" name="title" id="codeSearch"
									class="input-sm round" placeholder="검색"
									style="width: 300px; height: 48px;" /> &nbsp;
								<button type="submit"
									class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
								<input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum}"> <input type="hidden"
									name="amount" value="${pageMaker.cri.amount}">
							</div>
						</form>
					</div>
				</div>
				<br>

				<div class="table-responsive">
					<table class="table shopping-cart-table">
						<tr align="center">
							<th width="50">No</th>
							<th width="300">제목</th>
							<th width="100">작성일자</th>
							<th width="50">조회수</th>
							<th width="50">추천수</th>
						</tr>

						<c:forEach items="${noticeList}" var="list2">
							<tr class="active" onclick="noticeSelect(${list2.boardNo})">
								<td>${list2.boardNo}</td>
								<th align="left">${list2.title}</th>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${list2.boardDate}" /></td>
								<td>${list2.hit}</td>
								<td>${list2.recommend}</td>
							</tr>
						</c:forEach>
					</table>
					<div align="right">
						<input class="btn btn-mod btn-round btn-border-w btn-small"
							type="button" value="글쓰기" onclick="location.href='write.do'">
					</div>
				</div>
			</div>
			<br>

			<form action="noticeSelect.do" method="post" id="boardSS2">
				<input type="hidden" name="boardNo" id="boardSe2" />
			</form>

			<div class="pagination">
				<ul class="pagination" id="pagination"></ul>
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



function noticeSelect(n){
boardSS2.boardSe2.value= n;
boardSS2.submit();   
}

</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div align="center">
		<section class="page-section bg-dark light-content" id="home">
			<div class="container relative text-center">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">Let's Free !</h2>
					</div>
				</div>
			</div>
		</section>
		<section class="page-section bg-dark light-content pt-0">
			<div class="container relative">
					<!-- 검색 -->
					<div class="row">
						<div>
							<form class="form" id="searchForm" action="free.do"
							style="position: sticky; top: 100px" method="get">
							<label for="lang">유형 번호</label> <select id="searchForm"
								class="input-md round form-control" style="width: 100px">
								<option>자유게시판</option>
								<option>공지사항</option>
								<option>최신기술동향</option>
								<option>Deal</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="codeSearch"
								id="codeSearch" class="input-sm round" placeholder="검색"
								style="width: 300px; height: 48px;" pattern="" required />
							&nbsp;
							<button type="submit"
								class="btn btn-mod btn-round btn-border-w btn-small">검색</button>

						</form>
						</div>
					</div><br>

					<!-- 리스트 테이블 -->
			<div class="table-responsive">
				<table class="table shopping-cart-table">
					<tr align="center">
						<th width="50">번호</th>
						<th width="300">제목</th>
						<th width="100">작성자</th>
						<th width="100">조회</th>
						<th width="50">추천수</th>
						<th width="50">작성일</th>
					</tr>
							<c:forEach items="${boardList}" var="list">
						<tr class="active" onclick="freeSelect(${list.boardNo})">
							<td>${list.boardNo}</td>
							<td>${list.title}</td>
							<td>${list.writer}</td>
							<td>${list.hit}</td>
							<td>${list.recommend}</td>
							<td><c:set var="ymd" value="<%=new java.util.Date()%>" /> <fmt:formatDate
					value="${ymd}" pattern="yy-MM-dd" /> <!--<fmt:formatDate value="${list.boardDate}" pattern="yyyy-MM-dd"/>-->
							</td>
						</tr>

							</c:forEach>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="글쓰기"
								onclick="location.href='write.do'">
						</div>
				
		</section>
		<br>

	</div>
	</section>
	<div align="right">
		<input class="btn btn-mod btn-round btn-border-w btn-small"
			type="button" value="글쓰기" onclick="location.href='write.do'">

		<form action="boardSelect.do" method="post" id="boardSS">
			<input type="hidden" name="boardNo" id="boardSe" />
		</form>

		<div class="pagination">
			<ul class="pagination" id="pagination"></ul>
	</div>
	</div>
	</div>
	 
		
	<script>
function freeSelect(e){
boardSS.boardSe.value= e;
boardSS.submit();   
   
}
 
</script>

	<script src="${resources}/js/common/jQueryPage.js"></script>

	<script>
    var total = ${pageMaker.total}
    var current = ${pageMaker.cri.pageNum}

    window.pagObj = $('#pagination').twbsPagination({
      totalPages: total,
      startPage: current,
      visiblePages:10, // 최대로 보여줄 페이지
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

</script>
</body>
</html>
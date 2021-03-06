<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>

<div align="center">
	<section class="page-section bg-dark light-content" id="home">
		<div class="container relative text-center">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
				<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">코드 공유</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section bg-dark light-content pt-0">
		<div class="container relative">
				<!-- 검색 -->
				<div class="row">
					<div>
						<form action="#" class="form">
							<label for="lang">언어</label> 
							<select id="cqLang" class="input-md round form-control" style="width: 100px">
								<option>전체</option>
								<option>JAVA</option>
								<option>C#</option>
								<option>C++</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="text" name="codeSearch" id="codeSearch" 
							class="input-sm round" placeholder="검색" 
							style="width: 300px; height: 48px;" pattern="" required />
							&nbsp;
							<button type="submit" class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
						</form>
					</div>
				</div><br>
                <style>
                    .table-list {cursor: pointer;}
                    .table-list:hover {background-color: #2c2c2c;}
                </style>
				<!-- 리스트 테이블 -->
				<div class="table-responsive">
					<table class="table shopping-cart-table">
						<tr align="center">
							<th width="50">No</th>
							<th width="300">제목</th>
							<th width="100">작성자</th>
							<th width="100">작성일자</th>
							<th width="50">조회수</th>
							<th width="50">추천수</th>
						</tr>
						<c:forEach items="${lists}" var="item">
							<tr class="table-list" align="center" onclick="selectOne('${item.cqNo}')">
								<td>${item.cqNo}</td>
                                <td align="left">${item.projectNo != 0 ? '<i class="fa fa-compass"></i> ' : null}[${item.cqLang}]${item.title}</td>
								<td>${item.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${item.cqDate}"/></td>
								<td>${item.hit}</td>
								<td>${item.recommend}</td>
							</tr>
						</c:forEach>
					</table>
					<sec:authorize access="isAuthenticated()">
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="글쓰기" onclick="location.href='cqInsertForm.do?type=4'">
						</div>
					</sec:authorize>
				</div>

				<!-- Pagination -->
				<div class="pagination">
					<ul class="pagination" id="pagination"></ul>
				</div>
				<!-- End Pagination -->

			</div>
	</section>
	<br>
</div>
<div>
	<form id="frm" action="cqSelect.do" method="get">
	<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
			<input type="hidden" id="cqNo" name="cqNo">
		</form>
	</div>

<script src="${resources}/js/common/jQueryPage.js"></script>
<script>

	function selectOne(id) {
		frm.cqNo.value = id;
		frm.submit();
	}

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
		searchPage(page);
	});

	function searchPage(page) {
		var searchForm = $("#searchForm");
		searchForm.find("input[name='pageNum']").val(page);
		searchForm.submit();
	}

	function search() {
		var searchForm = $("#searchForm");
		searchForm.find("input[name='pageNum']").val("1");
		searchForm.submit();
	}

</script>

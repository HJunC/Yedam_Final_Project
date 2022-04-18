<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
 
<section class="page-section bg-dark-alfa-50 bg-scroll" data-background="${resources}/images/intro/20.jpg" id="home">
    <div class="container relative">
           
                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                   <h1 class="hs-line-7 mb-20 mb-xs-10">자유게시판</h1>
	<form id="searchForm" class="row">
               <div class="col-lg-10 offset-lg-1">
                    <input type="text" name="title"
                     id="codeSearch" class="input-sm round" placeholder="검색"
                     style="width: 300px; height: 48px;" />
                  &nbsp;
                  <button type="button" onclick="search()"
                     class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
                  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
               </div>
            </form>
	
			

				<br>

				<div class="table-responsive">
					<table class="table shopping-cart-table">
						<tr align="center">
							<th width="50">No</th>
							<th width="100">작성자</th>
							<th width="300">제목</th>
							<th width="100">작성일자</th>
							<th width="50">조회수</th>
							<th width="50">추천수</th>
						</tr>
						<c:forEach items="${boardList}" var="list">
							<tr class="active" onclick="freeSelect(${list.boardNo})">
								<td>${list.boardNo}</td>
								<td>${list.writer}</td>
								<td>${list.title}</td>
								<td><c:set var="ymd" value="<%=new java.util.Date()%>" />
									<fmt:formatDate value="${ymd}" pattern="yy-MM-dd" /> <!--<fmt:formatDate value="${list.boardDate}" pattern="yyyy-MM-dd"/>-->
								</td>
								<td>${list.hit}</td>
								<td>${list.recommend}</td>
							</tr>
						</c:forEach>
					</table>
					<div align="right">
						<input class="btn btn-mod btn-round btn-border-w btn-small"
							type="button" value="글쓰기" onclick="location.href='write.do'">
				
			<br>

			<form action="boardSelect.do" method="post" id="boardSS">
				<input type="hidden" name="boardNo" id="boardSe" />
			</form>

			<div class="pagination">
				<ul class="pagination" id="pagination"></ul>
			</div>
				</div>
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
 // 상세페이지 가는 함수
 function freeSelect(no){
	location.href = "boardSelect.do?boardNo=" + no;
 }
</script>
			</div>
 	</div>
	</section>
</body>
</html>
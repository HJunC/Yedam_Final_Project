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
					<h1 class="hs-line-7 mb-20 wow fadeInUpShort" data-wow-delay=".2s">자유게시판</h1>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br>

				</div>

				<div class="container relative">
					<div class="container relative">
						<form id="searchForm" action="free.do" class="row">
							<div align="left">
								<label class="hidden">검색 분류</label> 
								<select name="option">
									<option value="all">전체</option>
									<option value="title">제목</option>
									<option value="writer">작성자</option>
									<option value="subject">내용</option>
								</select> 
								<input type="text" name="keyvalue"
									id="codeSearch" class="input-sm round" placeholder="검색"
									style="width: 300px; height: 40px;" />

								<button type="submit"
									class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
								<input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum}"> <input type="hidden"
									name="amount" value="${pageMaker.cri.amount}">

							</div>
						</form>
						<br>
						<br>
						<br>


						<%-- 		<div class="container relative">
						
							<label class="hidden">검색 분류</label> <select name="option">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="writer">작성자</option>
								<option value="subject">내용</option>
							</select> <label>검색어</label> <input type="button" onclick="searchData()"
								value="조회"> <input type="text" name="keyvalue" value="" />
							<input class="btn btn-search" type="submit" value="조회" />

							<c:if test="${empty boardList}">
								<h3 class="call-action-1-heading"
									style="font-size: 30px; color: rgba(255, 255, 255, 0.3);">검색
									결과가 없습니다.</h3>
							</c:if>
						</form> --%>




						<%--         <div align="left">
                              <input type="text" name="title" id="codeSearch"
                                 class="input-sm round" placeholder="검색"
                                 style="width: 300px; height: 48px;" /> &nbsp;
                              <button type="submit"
                                 class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
                              <input type="hidden" name="pageNum"
                                 value="${pageMaker.cri.pageNum}"> <input
                                 type="hidden" name="amount" value="${pageMaker.cri.amount}">
                           </div>
                        </form>
                         --%>



						<%-- 		</div>
					</section>


					<form id="form1">
						<select name="option">
							<option value="all">전체</option>
							<option value="writer">작성자</option>

							<option value="title">제목</option>

							<option value="subject">내용</option>


						</select> <input name="keyvalue"> <input type="button"
							onclick="searchData()" value="조회">
					</form> --%>

						<div class="table-responsive">
							<table class="table shopping-cart-table">
								<tr align="center">
									<th width="50">No</th>
									<th width="250">제목</th>
									<th width="100">작성자</th>
									<th width="100">작성일자</th>
									<th width="50">조회수</th>
									<th width="100">추천수</th>
								</tr>
								<c:forEach items="${boardList}" var="list">
									<tr class="active" onclick="freeSelect(${list.boardNo})">
										<td>${list.boardNo}</td>
										<th align="left">${list.title}</th>
										<td>${list.writer}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${list.boardDate}" /></td>
										<td>${list.hit}</td>
										<td>${list.recommend}</td>
									</tr>
								</c:forEach>
							</table>
							<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')">

								<div align="right">
									<input class="btn btn-mod btn-round btn-border-w btn-small"
										type="button" value="글쓰기"
										onclick="location.href='write.do?no=2'">
								</div>
							</sec:authorize>


							<form action="boardSelect.do" id="boardSS">
								<input type="hidden" name="boardNo" id="boardSe" />
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
 
 function searchData(){
    console.log(($('#form1').serializeObject));
    $.ajax({
       url:"boardSearch.do",
       data:$('#form1').serializeObject(),
       success:function(data){
          console.log(data)
       },
       error:function(err){
          console.log(err)
       }
    })
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


	<%-- 	<c:forEach var="n" items="${list }">
		<tr>
			<td>${n.id }</td>
			<td><a href="detail?id=${n.id }">${n.title }</a></td>
			<td>${n.writerId}</td>
			<td><fmt:formatDate pattern="yyyy:MM:dd hh:mm:ss"
					value="${n.regdate }" /></td>
			<td><fmt:formatNumber pattern="####,###" value="${n.hit}" /></td>
		</tr>
	</c:forEach>

	</tbody>
	</table>
	</div>

	<div>
		<c:set var="page" value="${(empty param.p)? 1 : param.p}" />
		<c:set var="startNum" value="${page-(page-1)%5}" />
		<c:set var="lastNum" value="23" />

		<c:if test="${startNum > 1}">
			<span><a href="?p=${startNum - 1}&f=&q=">이전</a> </span>
		</c:if>
		<c:if test="${startNum <= 1}">
			<span onclick="alert('이전 페이지가 없습니다.');">이전</span>
		</c:if>

		<span> <c:forEach var="i" begin="0" end="4">
				<a href="?p=${startNum + i}&f=&q=">${startNum + i}</a>
			</c:forEach>
		</span>

		<c:if test="${startNum < lastNum }">
			<span><a href="?p=${startNum + 5}&f=&q=">다음</a> </span>
		</c:if>
		<c:if test="${startNum >= lastNum }">
			<span onclick="alert('다음 페이지가 없습니다.');">다음</span>
		</c:if>
	</div>
</body>
</html>


 --%>
</body>
</html>
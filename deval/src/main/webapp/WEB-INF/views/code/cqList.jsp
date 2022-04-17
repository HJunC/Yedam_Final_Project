<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<div align="center">
	<section class="page-section bg-dark light-content" id="home">
		<div class="container relative text-center">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
				<c:if test="${type == 4}">
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">코드 공유</h2>
				</c:if>
				<c:if test="${type == 6}">
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">질문 / 답변</h2>
				</c:if>
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
								<option>USA</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="text" name="codeSearch" id="codeSearch" 
							class="input-sm round" placeholder="검색" 
							style="width: 300px; height: 48px;" pattern="" required />
							&nbsp;
							<button type="submit" class="btn btn-mod btn-round btn-border-w btn-small">검색</button>
						</form>
					</div>
				</div><br>

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
						<c:forEach items="${lists}" var="list">
							<tr align="center" onclick="selectOne('${list.cqNo}')">
								<td>${list.cqNo}</td>
									<td align="left">[${list.cqLang}]${list.title}</td>
								<td>${list.writer}</td>
								<td>${list.cqDate}</td>
								<td>${list.hit}</td>
								<td>${list.recommend}</td>
							</tr>
						</c:forEach>
					</table>
					<sec:authorize access="isAuthenticated()">
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="글쓰기" onclick="location.href='cqInsertForm.do?type=${type}'">
						</div>
					</sec:authorize>
				</div>
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
<script type="text/javascript">
function selectOne(id) {
	frm.cqNo.value = id;
	frm.submit();
}
</script>

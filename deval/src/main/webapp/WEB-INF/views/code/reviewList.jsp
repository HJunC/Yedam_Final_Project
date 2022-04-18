<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div align="center">
	<section class="page-section bg-dark light-content" id="home">
		<div class="container relative text-center">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">코드 리뷰</h2>
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
							<select id="cqLang" class="input-md round form-control" style="width: 100px">
								<option>전체</option>
								<option>제목</option>
								<option>내용</option>
								<option>제목/내용</option>
								<option>작성자</option>
							</select> 
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
							<tr align="center" onclick="selectOne('${list.cqReplyNo}')">
								<td>${list.cqReplyNo}</td>
									<td align="left">[${list.cqNo}번글 리뷰]${list.title}</td>
								<td>${list.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.replyDate}"/></td>
								<td>${list.hit}</td>
								<td>${list.recommend}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
	</section>
	<br>

</div>
<div>
	<form id="frm" action="reviewSelect.do" method="get">
	<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
		<input type="hidden" id="cqNo" name="cqReplyNo">
	</form>
</div>
<script type="text/javascript">
	function selectOne(id) {
		frm.cqNo.value = id;
		frm.submit();
	}
</script>
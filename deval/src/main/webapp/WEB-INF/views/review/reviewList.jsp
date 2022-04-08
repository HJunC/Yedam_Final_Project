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
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">소스코드 리뷰</h2>
					</div>
				</div>
			</div>
		</section>
		<section class="page-section bg-dark light-content pt-0">
			<div class="container relative">
					<!-- 검색 -->
					<div class="row">
						<div align="right">
							<form action="#" class="form">
								<h3 align="left"></h3>
								<label for="lang">#${cqno}리뷰</label> &nbsp;&nbsp;&nbsp;
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
							<c:forEach items="${reviews }" var="review">
								<tr align="center" onclick="selectOne('${review.cqReplyNo }')">
									<td>${review.cqReplyNo }</td>
										<td align="left">${review.title }</td>
									<td>${review.writer}</td>
									<td>${review.replyDate}</td>
									<td>${review.hit}</td>
									<td>${review.recommend}</td>
								</tr>
							</c:forEach>
						</table>
						<div align="right">
						<form id="frm" method="post">
							<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
							<input type="hidden" id="cqReplyNo" name="cqReplyNo">
						</form>
						<form id="frm2" method="post">
							<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
							<input type="hidden" id="cqNo" name="cqNo" value="${cqno }">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="원문가기" onclick="reviewInput('C')">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="리뷰쓰기" onclick="reviewInput('I')">
						</form>
						</div>
						
					</div>
				</div>
		</section>
		<br>

	</div>
</body>
<script type="text/javascript">
	function selectOne(id) {
		frm.action = "reviewSelectOne.do";
		frm.cqReplyNo.value = id;
		frm.submit();
	}
	
	function reviewInput(str) {
		if(str=="I"){
			frm2.action = "reviewInsertForm.do";
		} else if (str == "C") {
			frm2.action = "../code/codeSelectOne.do";
		}
		frm2.submit();
	}
</script>
</html>
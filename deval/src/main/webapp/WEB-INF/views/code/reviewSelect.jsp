<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
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
	<form id="frm" name="frm">
	<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
	<section class="page-section bg-dark light-content pt-0">
		<div class="container relative">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="table-responsive">
						<table class="table shopping-cart-table">
							<tr>
								<th>[#${review.cqNo }]${review.title }</th>
								<td><input type="hidden" id="cqReplyNo" name="cqReplyNo" value="${review.cqReplyNo }"></td>
								<td><input type="hidden" id="cqNo" name="cqNo" value="${review.cqNo }"></td>
							</tr>
							<tr>
								<th>작성자 : ${review.writer }</th>
								<th>작성일자 : ${review.replyDate }</th>
								<th>조회수 : ${review.hit }</th>
								<th>추천수 : ${review.recommend }</th>
							</tr>
							<tr>
								<th style="vertical-align: top;" height="500px"><br>${review.subject }</th>
							</tr>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
							type="button" onclick="location.href='cqSelect.do?cqNo=${review.cqNo}'" value="원본글 가기">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
							type="button" onclick="codeUpdate('U')" value="수정"> 
							<input class="btn btn-mod btn-round btn-border-w btn-small"
							type="button" onclick="codeUpdate('D')" value="삭제">
							<input class="btn btn-mod btn-round btn-border-w btn-small" 
							type="button" value="리뷰목록" onclick="location.href='reviewSelectList.do?cqNo=${review.cqNo}'">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</form>
	<br>
</div>
<script type="text/javascript">
		function codeUpdate(str) {
			if (str == "U") {
				frm.action = "reviewUpdateForm.do";
			} else if (str == "D") {
				window.alert('삭제하였습니다.');
				frm.action = "reviewDelete.do";
			}
			frm.submit();
		}
</script>

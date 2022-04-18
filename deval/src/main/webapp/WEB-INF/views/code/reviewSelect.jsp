<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<input type="hidden" id="cqNo" name="cqNo" value="${review.cqNo }">
	<section class="page-section bg-dark light-content pt-0">
		<div class="container relative">
			<div class="row">
				<div class="col-lg-8 offset-lg-2">
					<div class="table-responsive">
						<table class="table shopping-cart-table">
							<tr>
								<th colspan="3">[#${review.cqNo }]${review.title }</th>
								<td align="right">
									<c:if test="${review.writer eq user}">
										<input class="btn btn-mod btn-round btn-border-w btn-small"
										type="button" onclick="codeUpdate('U')" value="수정"> 
										<input class="btn btn-mod btn-round btn-border-w btn-small"
										type="button" onclick="codeUpdate('D')" value="삭제">
									</c:if>
								</td>								
							</tr>
							<tr>
								<th>작성자 : ${review.writer }</th>
								<th>작성일자 : <fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${review.replyDate}"/></th>
								<th>조회수 : ${review.hit }</th>
								<th>추천수 : ${review.recommend }</th>
							</tr>
							<tr>
								<th style="vertical-align: top;" height="500px" colspan="4">
									<div id="viewer"></div>
								</th>
							</tr>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
							type="button" onclick="location.href='cqSelect.do?cqNo=${review.cqNo}'" value="원본글 가기">
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
<%@ include file="../comment/comment.jsp" %>
<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
<script type="text/javascript">
	function codeUpdate(str) {
		if (str == "U") {
			location.href="reviewUpdateForm.do?cqReplyNo=${review.cqReplyNo}";
		} else if (str == "D") {
			window.alert('삭제하였습니다.');
			frm.action = "reviewDelete.do";
			frm.submit();
		}
	}
	
	const viewer = new toastui.Editor.factory({
	    el: document.querySelector("#viewer"),
	    viewer: true,
	    initialValue: '${review.subject}',
	    theme: 'dark'
	});
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="page-section bg-dark light-content pt-0">
				<div class="container relative">
					<div class="row">
						<div class="col-lg-8 offset-lg-2">
	<form id="frm2" name="frm2">
		<input name="${_csrf.parameterName }" value="${_csrf.token}"
			type="hidden">
		<div align="left">
			<!-- Accordion -->
			<dl class="accordion">
				<dt>
					<a href="">댓글</a>
				</dt>
				<dd class="gray">
					<table class="table shopping-cart-table">
					<tr>
							<td>
								<input style="" class="btn btn-mod btn-round btn-border-w btn-small" 
								size="90" id="commentSub" name="commentSub"> 
								<input type="hidden" id="boardNo" name="boardNo" value="${bno }">
							</td>
							<td>
								<input type="hidden" id="writer" name="writer"
								value="<sec:authentication property="principal.username"/>">
							</td>
							<td>
								<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="등록" onclick="commentUpdate('IN')">
							</td>
						</tr>
						<c:forEach items="${comments }" var="comment">
							<tr>
								<td>${comment.writer }: ${comment.commentSub }</td>
								<!-- <td width="300px"></td> -->
								<td width="135px" align="right"><input
									class="btn btn-mod btn-round btn-border-w btn-small"
									type="button" value="수정"> <input
									class="btn btn-mod btn-round btn-border-w btn-small"
									type="button" value="삭제"></td>
							</tr>
						</c:forEach>
					</table>
				</dd>
				<dt>
					<a href="">답글리스트</a>
				</dt>
				<dd class="gray">답글내용</dd>
			</dl>
			<!-- End Accordion -->
		</div>
	</form>
	</div>
	</div>
	</div>
	</section>
</body>
<script type="text/javascript">
function commentUpdate(str){
	if (str == "IN") {
		frm2.method = "post";
		frm2.action = "../comment/commentInsert.do";
	}
	frm2.submit();
}
</script>
</html>
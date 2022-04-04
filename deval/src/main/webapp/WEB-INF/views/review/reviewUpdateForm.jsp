<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
			<form id="frm" name="frm" class="form">
			<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
				<div class="container relative">
					<div class="table-responsive">
						<table class="table shopping-cart-table">
							<tr>
								<th>제 목</th>
								<td><input size="122" id="title" name="title" value="${review.title }"></td>
								<td><input type="hidden" id="cqReplyNo" name="cqReplyNo" value="${review.cqReplyNo }"></td>
								<td><input type="hidden" id="cqNo" name="cqNo" value="${review.cqNo }"></td>
							</tr>
							<tr>
								<th style="vertical-align: top;">내 용</th>
								<td><textarea rows="10" cols="160" id="subject" name="subject">${review.subject }</textarea></td>
							</tr>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small" type="button" onclick="codeUpdate('U')" value="수정">
							<input class="btn btn-mod btn-round btn-border-w btn-small"	type="button" onclick="codeUpdate('C')" value="취소">
						</div>
					</div>
				</div>
			</form>
		</section>
		<br>
	</div>
</body>
<script type="text/javascript">
		function codeUpdate(str) {
			if (str == "U") {
				window.alert('수정하였습니다.');
				frm.method = "get";
				frm.action = "reviewUpdate.do";
			} else if (str == "C") {
				frm.method = "post";
				frm.action = "reviewSelectOne.do";
			}
			frm.submit();
		}
</script>
</html>
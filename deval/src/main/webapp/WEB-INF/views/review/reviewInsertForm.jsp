<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">소스코드</h2>
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
								<td><input size="122" id="title" name="title"></td>
								<td><input type="hidden" id="cqNo" name="cqNo" value="${review.cqNo }"></td>
							</tr>
							<tr>
								<th style="vertical-align: top;">내 용</th>
								<td><textarea rows="10" cols="160" id="subject" name="subject"></textarea></td>
								<td><input type="hidden" id="writer" name="writer" value="<sec:authentication property="principal.username"/>"></td>
							</tr>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small" 
								type="button" value="등록" onclick="inputFnc('I')">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="취소" onclick="location.href='reviewSelectList.do?cqNo=${review.cqNo}'">
						</div>
					</div>
				</div>
			</form>
		</section>
		<br>
	</div>
</body>
<script type="text/javascript">
	function inputFnc(str){
		if(str == "I"){
			 frm.method = "post";
			 frm.action = "reviewInsert.do";
			 frm.submit();
		} 
	}
</script>
</html>
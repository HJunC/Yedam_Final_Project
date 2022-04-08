<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<%-- <c:set var="userN"
	value="${username }" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<a href="">답글리스트</a>
				</dt>
				<dd class="gray">
				<table class="table shopping-cart-table">
				
				</table>
				</dd>
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
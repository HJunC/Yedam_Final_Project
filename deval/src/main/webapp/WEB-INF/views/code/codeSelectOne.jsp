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
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">소스코드</h2>
					</div>
				</div>

			</div>
		</section>
		<form id="frm" name="frm">
		<section class="page-section bg-dark light-content pt-0">
			<div class="container relative">
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<div class="table-responsive">
							<table class="table shopping-cart-table">
								<tr>
									<th>[${code.cqLang }]${code.title }</th>
									<td align="right">#${code.cqNo }</td>
									<td><input type="hidden" id="cqNo" name="cqNo" value="${code.cqNo }"></td>
								</tr>
								<tr>
									<th>작성자 : ${code.writer }</th>
									<th>작성일자 : ${code.cqDate }</th>
									<th>조회수 : ${code.hit }</th>
									<th>추천수 : ${code.recommend }</th>
								</tr>
								<tr>
									<th>${code.subject }</th>
								</tr>
							</table>
							<div align="right">
								<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" onclick="codeUpdate('U')" value="수정"> 
								<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" onclick="codeUpdate('D')" value="삭제">
								<input class="btn btn-mod btn-round btn-border-w btn-small" 
								type="button" value="목록" onclick="location.href='codeList.do'">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		</form>
		<br>
	</div>
</body>
<script type="text/javascript">
		function codeUpdate(str) {
			if (str == "U") {
				frm.action = "codeUpdateForm.do";
			} else if (str == "D") {
				window.alert('삭제하였습니다.');
				frm.action = "codeDelete.do";
			}
			frm.submit();
		}
</script>
</html>
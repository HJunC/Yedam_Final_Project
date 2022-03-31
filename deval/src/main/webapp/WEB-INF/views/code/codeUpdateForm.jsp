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
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">소스코드</h2>
					</div>
				</div>
			</div>
		</section>
		<section class="page-section bg-dark light-content pt-0">
			<form id="frm" name="frm" class="form" method="post">
			<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
				<div class="container relative">
					<!-- 검색 -->
					<div class="row">
						<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="lang">언어</label> 
							<select id="cqLang" name="cqLang" class="input-md round form-control" style="width: 100px">
								<option>${code.cqLang }</option>
								<option>JAVA</option>
								<option>C#</option>
								<option>C++</option>
								<option>USA</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp; 
							<label for="type">유형</label> 
							<select id="cqType" name="cqType" class="input-md round form-control" style="width: 100px">
								<option>${code.cqType }</option>
								<option>공유</option>
								<option>질문</option>
							</select>&nbsp;&nbsp;&nbsp;&nbsp;
							<label for="git">GIT URI</label> 
							<input type="url" size="90" id="gitUri" name="gitUri" 
								class="input-sm round" placeholder="GIT주소" 
								style="height: 48px;" value="${code.gitUri }" required >
						</div>
					</div>
					<br>
					<div class="table-responsive">
						<table class="table shopping-cart-table">
							<tr>
								<th>제 목</th>
								<td><input size="122" id="title" name="title" value="${code.title }"></td>
								<td><input type="hidden" id="cqNo" name="cqNo" value="${code.cqNo }"></td>
							</tr>
							<tr>
								<th style="vertical-align: top;">내 용</th>
								<td><textarea rows="10" cols="160" id="subject" name="subject">${code.subject }</textarea></td>
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
				frm.action = "codeUpdate.do";
			} else if (str == "C") {
				frm.action = "codeSelectOne.do";
			}
			frm.submit();
		}
</script>
</html>
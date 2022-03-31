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
		<section class="page-section bg-dark light-content pt-0">
			<div class="container relative">
					<!-- 검색 -->
					<div class="row">
						<div>
							<form action="#" class="form">
								<label for="lang">언어</label> 
								<select id="cqLang" class="input-md round form-control" style="width: 100px">
									<option>전체</option>
									<option>JAVA</option>
									<option>C#</option>
									<option>C++</option>
									<option>USA</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp; 
								<label for="type">유형</label> 
								<select id="cqType" class="input-md round form-control"
									style="width: 100px">
									<option>전체</option>
									<option>공유</option>
									<option>질문</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp; 
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
							<c:forEach items="${codes }" var="code">
								<tr align="center" onclick="selectOne('${code.cqNo}')">
									<td>${code.cqNo }</td>
										<td align="left">[${code.cqLang}-${code.cqType }]${code.title }</td>
									<td>${code.writer}</td>
									<td>${code.cqDate}</td>
									<td>${code.hit}</td>
									<td>${code.recommend}</td>
								</tr>
							</c:forEach>
						</table>
						<div align="right">
							<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="글쓰기"
								onclick="location.href='codeInsertForm.do'">
						</div>
					</div>
				</div>
		</section>
		<br>

	</div>
	<div>
		<form id="frm" action="codeSelectOne.do" method="post">
		<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
			<input type="hidden" id="cqNo" name="cqNo">
		</form>
	</div>
</body>
<script type="text/javascript">
	function selectOne(id) {
		frm.cqNo.value = id;
		frm.submit();
	}
</script>
</html>
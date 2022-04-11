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

	<!-- Title -->
                <section class="small-section bg-dark-alfa-50" data-background="images/full-width-images/section-bg-19.jpg">
                    <div class="container relative">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="wow fadeInUpShort" data-wow-delay=".1s">
                                    <h1 class="hs-line-7 mb-20 mb-xs-10">STUDY</h1>
                                </div>
                                <div class="wow fadeInUpShort" data-wow-delay=".2s">
                                    <p class="hs-line-6 opacity-075 mb-20 mb-xs-0">
                                         스터디 찾기
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
      <!-- End Title -->
      	<div align="center">
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
								<label for="type">난이도</label> 
								<select id="cqType" class="input-md round form-control"
									style="width: 100px">
									<option>상</option>
									<option>중</option>
									<option>하</option>
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
		<form id="frm" action="codeSelectOne.do" method="get">
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
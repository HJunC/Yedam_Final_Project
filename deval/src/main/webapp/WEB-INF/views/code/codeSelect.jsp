<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />
<div align="center">
	<section class="page-section bg-dark light-content" id="home">
		<div class="container relative text-center">

			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">코드공유</h2>
				</div>
			</div>

		</div>
	</section>
		<section class="page-section bg-dark light-content pt-0">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<div class="table-responsive">
						<form id="frm" name="frm">
							<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
							<input type="hidden" id="cqNo" name="cqNo" value="${cq.cqNo }">
							<input type="hidden" name="boardTypeNo" id="bno" value="0">
							<table class="table shopping-cart-table">
								<tr>
									<th colspan="3">#${cq.cqNo} / [${cq.cqLang}]${cq.title}</th>
									<td align="right">
										<c:if test="${user == cq.writer }">
											<input class="btn btn-mod btn-round btn-border-w btn-small"
											type="button" onclick="codeUpdate('U')" value="수정"> 
											<input class="btn btn-mod btn-round btn-border-w btn-small"
											type="button" onclick="codeUpdate('D')" value="삭제">
										</c:if>
									</td>
								</tr>
								<tr>
									<th>작성자 : ${cq.writer }</th>
									<th>작성일자 : ${cq.cqDate }</th>
									<th>조회수 : ${cq.hit }</th>
									<th>추천수 : ${cq.recommend }</th>
								</tr>
								<tr>
									<th colspan="4">GIT URI : 
										<c:if test="${not empty cq.gitUri }">
											<a href="${cq.gitUri }" target="_blank">바로가기</a>
										</c:if>
										<c:if test="${empty cq.gitUri}">
											없음
										</c:if>
									</th>
								</tr>
								<tr>
									<th style="vertical-align: top;" height="500px" colspan="4">
										<div id="viewer">${cq.subject}</div>
									</th>
								</tr>
							</table>
							<div align="right" class="col">
								<c:if test="${cq.writer != user}">
									<input class="btn btn-mod btn-round btn-border-w btn-small"
									type="button" onclick="location.href='reviewWrite.do?cqNo=${cq.cqNo}'" value="리뷰작성">
								</c:if>
								<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" onclick="codeUpdate('CR')" value="리뷰글목록">
								<input class="btn btn-mod btn-round btn-border-w btn-small"
								type="button" value="글목록" onclick="location.href='codeList.do'">
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	<br>
</div>
<%@ include file="../comment/comment.jsp" %>
<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
<script type="text/javascript">
	function codeUpdate(str) {
		if (str == "U") {
			frm.action = "cqUpdateForm.do";
		} else if (str == "D") {
			window.alert('삭제하였습니다.');
			frm.bno.value = ${cq.boardTypeNo}
			frm.action = "cqDelete.do";
			frm.method = 'post'
		} else if (str == "CR") {
			frm.action = "reviewSelectList.do";
		}
		frm.submit();
	}
	
	const viewer = new toastui.Editor.factory({
	    el: document.querySelector("#viewer"),
	    viewer: true,
	    initialValue: '${cq.subject}',
	    theme: 'dark'
	});
</script>

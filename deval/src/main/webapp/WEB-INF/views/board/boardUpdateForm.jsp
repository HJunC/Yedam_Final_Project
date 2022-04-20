<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor-dark.min.css" />
<div align="center">
	<section class="page-section bg-dark light-content" id="home">
		<div class="container relative text-center">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">글수정</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section bg-dark light-content pt-0">
		<form action="boardUpdate.do" method="post">
			<input name="${_csrf.parameterName }" value="${_csrf.token}"
				type="hidden"> <input type="hidden" name="boardNo"
				value="${board.boardNo}"> <input id="subject" type="hidden"
				name="subject">
			<div class="container relative">
				<br>
				<table class="table shopping-cart-table">
					<tr>
						<th>제 목</th>
						<td><input size="122" id="title" name="title" value=""
							value="${board.title}"></td>
					</tr>
					<tr>
						<th style="vertical-align: top;">내 용</th>
						<td><div id="editor">${board.subject}</div></td>
						<td><input type="hidden" id="writer" name="writer"
							value=""></td>
					</tr>
				</table>
				<div class="container relative">

					<button type="button" onclick="boardUpdate.do"  
						class="btn btn-mod btn-round btn-border-w btn-medium">수정하기</button>
				
				<div align="right">

								<c:if test="${board.boardTypeNo == 1}">
									<a href="notice.do"
										class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
								</c:if>

								<c:if test="${board.boardTypeNo == 2}">
									<a href="free.do"
										class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
								</c:if>
								<c:if test="${board.boardTypeNo == 3}">
									<a href="technical.do"
										class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
								</c:if>
							</div>
							</div>

			</div>
		</form>
	</section>
</div>
<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
<script type="text/javascript">
   const { Editor } = toastui;
   
   const editorObject = new Editor({
     el: document.querySelector('#editor'),
     previewStyle: 'vertical',
     initialValue: '${cq.subject}',
     height: '500px',
     initialEditType: 'wysiwyg',
     theme: 'dark'
   });
   
   editorObject.getMarkdown();
  
   function boardUpdate(str) {
      if (str == "U") {
         window.alert('수정하였습니다.');
         frm.action = "boardUpdate.do";
      } else {
         frm.action = "boardSelect.do";
         frm.method="get";
      }
      $('#subject').val(editorObject.getHTML());
      frm.submit();
   }
   
</script>
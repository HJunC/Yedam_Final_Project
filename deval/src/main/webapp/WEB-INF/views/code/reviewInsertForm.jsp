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
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">리뷰 등록</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section bg-dark light-content pt-0">
		<form id="frm" action="reviewInsert.do" method="post" onsubmit="inputCheck()">
		<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
		<input type="hidden" id="subject" name="subject">
		<input type="hidden" id="cqNo" name="cqNo" value="${cqNo}">
			<div class="container relative">
				<div class="table-responsive">
					<table class="table shopping-cart-table">
						<tr>
							<th>제 목</th>
							<td><input size="122" id="title" name="title"></td>
							<td></td>
						</tr>
						<tr>
							<th style="vertical-align: top;">내 용</th>
							<td><div id="editor"></div></td>
							<td><input type="hidden" id="writer" name="writer" value="<sec:authentication property="principal.username"/>"></td>
						</tr>
					</table>
					<div align="right">
						<input class="btn btn-mod btn-round btn-border-w btn-small" type="submit" value="등록">
						<input class="btn btn-mod btn-round btn-border-w btn-small"
							type="button" value="취소" onclick="location.href='cqSelect.do?cqNo=${cqNo}'">
					</div>
				</div>
			</div>
		</form>
	</section>
	<br>
</div>
<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
<script type="text/javascript">
	const { Editor } = toastui;
	
	const editorObject = new Editor({
	  el: document.querySelector('#editor'),
	  previewStyle: 'vertical',
	  height: '500px',
	  initialEditType: 'wysiwyg',
	  theme: 'dark'
	});
	
	editorObject.getMarkdown();
	
	function inputCheck(){
		  if(editor.innerText == '\n\n\nMarkdownWYSIWYG'){
			  alert('내용을 입력해주세요');
			  return false;
		  }
		  if($('#title').val() == ''){
			  alert('제목을 입력해주세요')
			  $('#title').focus();
			  return false;
		  }
		  $('#subject').val(editorObject.getHTML());
		  return false;
	}
</script>

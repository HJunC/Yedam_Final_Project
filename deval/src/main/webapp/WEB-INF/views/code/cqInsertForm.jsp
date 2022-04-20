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
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">글작성</h2>
				</div>
			</div>
		</div>
	</section>
	<section class="page-section bg-dark light-content pt-0">
		<form action="cqInsert.do" class="form" method="post" onsubmit="return inputCheck()">
		<input name="${_csrf.parameterName }" value="${_csrf.token}" type="hidden">
		<input id="subject" type="hidden" name="subject">
			<div class="container relative">
				<!-- 검색 -->
				<div class="row">
					<div align="left">&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="lang">언어</label> 
						<select id="cqLang" name="cqLang" class="input-md round form-control" style="width: 100px">
							<option>JAVA</option>
							<option>C#</option>
							<option>C++</option>
							<option>USA</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp; 
						<label for="type">유형</label>
						<select disabled="disabled" id="cqType" name="boardTypeNo" class="input-md round form-control" style="width: 100px">
							<c:if test="${type == 4}">
								<option value="4">공유</option>
							</c:if>
							<c:if test="${type == 6}">
								<option value="6">질문</option>
							</c:if>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${type == 4}">
							<label for="type">프로젝트 번호</label>
							<input type="text" value=${projectNo}" readonly>
						</c:if>
					</div>
				</div>
				<br>
				<div class="table-responsive">
					<table class="table shopping-cart-table">
						<tr>
							<th>제 목</th>
							<td><input size="122" id="title" name="title"></td>
						</tr>
						<tr>
							<th style="vertical-align: top;">내 용</th>
							<td><div id="editor"></div></td>
							<td><input type="hidden" id="writer" name="writer" value="<sec:authentication property="principal.username"/>"></td>
						</tr>
					</table>
					<div align="right">
						<input class="btn btn-mod btn-round btn-border-w btn-small" type="submit" value="등록"> 
						<input class="btn btn-mod btn-round btn-border-w btn-small" type="button" value="목록" 
						<c:if test="${type == 4}">
							onclick="location.href='cqList.do?type=code'"
						</c:if>
						<c:if test="${type == 6}">
							onclick="location.href='cqList.do?type=qna'"
						</c:if>
						>
					</div>
				</div>
			</div>
		</form>
	</section>
	<br>
</div>
<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
<script>
  /**
   * toast 에디터 적용
   */
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
	  $('#cqType').attr('disabled',false);
	  $('#subject').val(editorObject.getHTML());
	  return true;
  }
</script>
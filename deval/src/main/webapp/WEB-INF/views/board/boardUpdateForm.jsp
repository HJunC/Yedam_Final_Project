<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />
<style>
.input-info {
	font-size: 14px;
	color: #c0c0c0;
}
</style>
<body>
	<section class="small-section bg-dark-alfa-50 bg-scroll light-content"
		data-background="${resources}/images/full-width-images/section-bg-19.jpg"
		id="home">
		<div class="container relative pt-70">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<br>
					<h1>수정페이지 💭</h1>
					<h4 class="blog-page-title"></h4>
					<div align="center">
						<div class="container relative">
							<div class="row">
								<div class="col-md-8">
									<form action="boardUpdate.do" method="post">
										<table>
											<tr>
								<c:if test="${board.boardTypeNo == 1}">
									<a href="notice.do"
										class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
								</c:if>
												<td>글번호 : <input type="hidden" value="${board.boardNo}"
													name="boardNo" id="boardNo">${board.boardNo}</td>
											</tr>
											<tr>
												<td>분류 : <input type="hidden"
													value="${board.boardTypeNo}" name="boardTypeNo"
													id="boardTypeNo">${boardTypeNo}
												<c:if test="${board.boardTypeNo == 1}">공지사항</c:if>
												<c:if test="${board.boardTypeNo == 2}">자유게시판</c:if>
												<c:if test="${board.boardTypeNo == 3}">최신기술동향</c:if>
											</td>
											</tr>
											<tr>
												<td align="center">제목 <input value="${board.title}"
													name="title" id="title"
													class="input-md square form-control"></td>
											</tr>
											<tr>
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
												<td id="editor">${board.subject}</td>
											</tr>
											<tr>
										</table>
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
										<button type="submit"
											class="submit_btn btn btn-mod btn-w btn-large btn-round">수정</button>

									</form>

									<!-- Send Button -->
									<div align="right">

										<c:if test="${board.boardTypeNo == 1}">
											<a href="free.do"
												class="btn btn-mod btn-g btn-small btn-square">목록으로</a>
										</c:if>
										<br>


										<c:if test="${board.boardTypeNo == 2}">
											<a href="notice.do"
												class="btn btn-mod btn-g btn-small btn-square">목록으로</a>
										</c:if>


										<c:if test="${board.boardTypeNo == 3}">
											<a href="technical.do"
												class="btn btn-mod btn-g btn-small btn-square">목록으로</a>
										</c:if>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="${resources}/js/common/toastui-editor-all.min.js"></script>

	<script>
	  const { Editor } = toastui;

	  const editorObject = new Editor({
	    el: document.querySelector('#editor'),
	    previewStyle: 'vertical',
	    height: '500px',
	    initialEditType: 'wysiwyg',
	    theme: 'dark'
	  });

	  editorObject.getMarkdown();

	</script>

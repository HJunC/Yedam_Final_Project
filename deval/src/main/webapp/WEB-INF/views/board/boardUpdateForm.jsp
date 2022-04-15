<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor-dark.min.css" />
<head>
<style>
.input-info {
	font-size: 14px;
	color: #c0c0c0;
}
</style>
</head>
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

												<td id="editor">${board.subject}</td>
											</tr>
											<tr>
										</table>

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
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
						<h1> 🌵글쓰기</h1>

					<h4 class="blog-page-title"></h4>
					<div align="center">

						 
							<div class="container relative">
								<div class="row">
									<div class="col-md-8">
							 

									<form action="writePost.do" enctype="multipart/form-data"
										method="post" id="writeForm">
										<sec:csrfInput />
										<c:set var="ymd" value="<%=new java.util.Date()%>" />
										<table>
											<tr>
												<td></td>
												<td>
												<select name="boardTypeNo" class="form-control">
													<option>카테고리 선택</option>
													<option value="2">자유게시판</option>
													<option value="3">최신기술</option>
												</select>
												<td>
											</tr>
											<tr>
												<td></td>
												<td><input type="text" id="title" name="title"
													required="required" class="input-md square form-control"
													placeholder="Enter title" maxlength="100"></td>
											</tr>

											<tr>
												<td></td>
												<td>
													<div id="editor"></div>
									        	</td>
											<tr>
												<td></td>
												<td><input type="file" id="photo" name="file"
													accept="image/*"></td>
											</tr>
										</table>
										<input type="hidden" name="subject">
										<input type="hidden" name="writer" value="${member.name}">
										<div align="right">
										<button type="button"
											onclick="handleSubmit()"
											class="submit_btn btn btn-mod btn-w btn-large btn-round">작성하기</button>
										<button
											class="submit_btn btn btn-mod btn-w btn-large btn-round"
											onclick="location.href='free.do'">목록으로</button>
</div>
									</form>
									<div class="container relative">
										<c:if test="${board.boardTypeNo == 1}">
											<a href="free.do"
												class="submit_btn btn btn-mod btn-w btn-large btn-round">목록으로</a>
										</c:if>

										<c:if test="${board.boardTypeNo == 2}">
											<a href="notice.do"
												class="submit_btn btn btn-mod btn-w btn-large btn-round">목록으로</a>
										</c:if>

										<c:if test="${board.boardTypeNo == 3}">
											<a href="technical.do"
												class="submit_btn btn btn-mod btn-w btn-large btn-round">목록으로</a>
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

	  function handleSubmit(){
		  $("input[name=subject]").val(editorObject.getHTML());
		  $("#writeForm").submit();
	  }
	</script>
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
					   <div align="center">

	<section class="page-section bg-dark-alfa-50 bg-scroll"
		data-background="${resources}/images/full-width-images/section-bg-11.jpg" id="home">
		<div class="container relative">
			<div class="row">
				<div class="col-md-8">
					<div class="wow fadeInUpShort" data-wow-delay=".1s">
						<h1 class="hs-line-7 mb-20 mb-xs-10">
							🌵<br> 글쓰기
						</h1>
					</div>
					<div class="wow fadeInUpShort" data-wow-delay=".2s"></div>
				</div>

				<form action="writePost.do" enctype="multipart/form-data"method="post">
					<sec:csrfInput />
					<c:set var="ymd" value="<%=new java.util.Date()%>" />
					<table>
						<tr>
							<td>type_no.</td>
							<td><input type="number" name="boardTypeNo"
								class="input-md square form-control" value="1" />
							<td>
						</tr>
						<tr>
							<td>등록날짜 </td>
							<td><fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd"/>
							<td>
						</tr>

						<tr>
							<td>Title</td>
							<td><input type="text" id="title" name="title"
								required="required" class="input-md square form-control"
								placeholder="Enter title" maxlength="100">
						</tr>

						<tr>
							<td>Subject</td>
							<td><div id="editor"></div></td>
							<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
						<tr>
							<td>file</td>
							<td><input type="file" id="photo" name="file"
								accept="image/*"></td>
						</tr>
					</table>
                    <button type="submit" class="submit_btn btn btn-mod btn-w btn-large btn-round">작성하기</button>
					<button  class="submit_btn btn btn-mod btn-w btn-large btn-round" onclick="location.href='free.do'">목록으로</button>
				</form>
				
				<div class="container relative">
					<c:if test="${board.boardTypeNo == 1}">
						<a href="free.do" class="submit_btn btn btn-mod btn-w btn-large btn-round">목록으로</a>
					</c:if>
					
					<c:if test="${board.boardTypeNo == 2}">
						<a href="notice.do"  class="submit_btn btn btn-mod btn-w btn-large btn-round">목록으로</a>
					</c:if>

					<c:if test="${board.boardTypeNo == 3}">
						<a href="technical.do"
							 class="submit_btn btn btn-mod btn-w btn-large btn-round">목록으로</a>
					</c:if>
				</div>
</div>

			</div>

	</section>
		</div>

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

</script>


</body>
</html>

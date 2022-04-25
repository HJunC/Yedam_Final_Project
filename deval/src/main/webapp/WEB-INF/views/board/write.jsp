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
					<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">글작성</h2>
				</div>

				<section class="page-section bg-dark light-content pt-0">
					<form action="writePost.do" enctype="multipart/form-data"
						method="post" id="writeForm">
						<h4 class="blog-page-title"></h4>
						<table class="table shopping-cart-table">
							<tr>
								<td></td>
								<td>
								<select name="boardTypeNo"  class="form-control input-sm " required>
									<option>카테고리 선택</option>
										<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
											<option value="1">공지사항</option>
										</sec:authorize>
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
								<td></td>
							</tr>
						</table>

						<input type="hidden" name="subject"> <input type="hidden"
							name="writer" value="${member.name}">

					</form>

					<div align="right">
						<button type="button" onclick="handleSubmit()"
							class="btn btn-mod btn-round btn-border-w btn-medium">작성하기</button>


						<c:if test="${no == 1}">
							<a href="notice.do"
								class="btn btn-mod btn-round btn-border-w btn-medium">목록으로</a>
						</c:if>

						<c:if test="${no == 2}">
							<a href="free.do"
								class="btn btn-mod btn-round btn-border-w btn-medium">목록으로</a>
						</c:if>
						<c:if test="${no == 3}">
							<a href="technical.do"
								class="btn btn-mod btn-round btn-border-w btn-medium">목록으로</a>
						</c:if>
					</div>
				</section>
			</div>


		</div>
	</section>
</div>



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
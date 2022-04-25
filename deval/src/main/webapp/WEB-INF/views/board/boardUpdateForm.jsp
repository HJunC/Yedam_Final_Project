<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<c:set var="resources"
	value="${pageContext.request.contextPath}/resources" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet"
	href="${resources}/css/common/toastui-editor-dark.min.css" />



<style>
* {
	margin: 4px 0;
}

.controller {
	padding: 25px 0;
	margin: auto;
	width: 800px;
}

#wriTitle {
	text-align: center;
	background-color: rgb(100, 100, 100);
	width: 800px;
	height: 20px;
	padding: 12px 0;
	color: white;
}

table {
	width: 800px;
	margin: 25px 0;
	padding: 20px;
	border-collapse: collapse;
}

#category {
	width: 100px;
	height: 30px;
}

#title {
	width: 700px;
	height: 24px;
}

textarea {
	width: 800px;
	height: 400px;
}

.button {
	width: 100px;
	padding: 5px 12px;
	border: none;
	background-color: rgb(150, 60, 60);
	color: white;
}

button {
	padding: 5px 12px;
	background-color: white;
	border-color: rgb(180, 180, 180);
	border-width: 1px;
}

textarea {
	resize: none;
}
</style>
</head>
<body>

	<div align="center">
		<section class="page-section bg-dark light-content" id="home">
			<div class="container relative text-center">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<h2 class="hs-line-7 mb-0 wow fadeInUpShort" data-wow-delay=".2s">글수정</h2>
						<form action="boardUpdate.do" enctype="multipart/form-data" onsubmit="inputCheck()" method="post" id="writeForm">
							<h4 class="blog-page-title"></h4>
							<table class="table shopping-cart-table">
								<tr>
									<td>글번호 <input type="hidden" value="${board.boardNo}"
										name="boardNo" id="boardNo" readonly>${board.boardNo}</td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" required id="title"
										value="${board.title}" /></td>
								</tr>
								<tr>
									<td colspan="2">
										<div id="editor"></div>
										<input id="subject" type="hidden" name="subject">
									</td>
								</tr>
								<tr>
									<th align="center"><input type="submit" value="수정"
										class="btn btn-mod btn-round btn-border-w btn-small">
										<input type="reset" value="reset"
										class="btn btn-mod btn-round btn-border-w btn-small"></th>
								</tr>
							</table>

						</form>

						<c:if test="${board.boardTypeNo == 1}">
							<a href="free.do"
								class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
						</c:if>
						<c:if test="${board.boardTypeNo == 2}">
							<a href="notice.do"
								class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
						</c:if>
						<c:if test="${board.boardTypeNo == 3}">
							<a href="technical.do"
								class="btn btn-mod btn-round btn-border-w btn-small">목록으로</a>
						</c:if>

					</div>

				</div>
			</div>


		</section>

	</div>
	<%--   

 
 
      
        </tr>
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="board_subject" type="text" size="70" maxlength="100" 
                    value="${board.board_subject}"/>
            </td>        
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="board_content" cols="72" rows="20">
                    ${board.board_content}
                </textarea>            
            </td>        
        </tr>
                <!-- 답글이 아닐 경우에만 파일 첨부 가능하도록 처리 -->
        <c:if test="${board.board_parent==0}">    
            <tr>
                <td id="title">
                    기존 파일
                </td>
                <td>
                    &nbsp;&nbsp; ${board.board_file}
                </td>    
            </tr>
            <tr>
                <td id="title">
                    첨부파일
                </td>
                <td>
                    <input type="file" name="board_file"/>
                </td>    
            </tr>
        </c:if> --%>


<!-- 인풋태그가 없었고 , 온서브밋으로 실행할걸 안넣어줬음. 온서브밋() -->

	<script src="${resources}/js/common/toastui-editor-all.min.js"></script>
	<script type="text/javascript">
 
  const { Editor } = toastui;

  const editorObject = new Editor({
    el: document.querySelector('#editor'),
    previewStyle: 'vertical',
    height: '500px',
    initialValue: '${board.subject}',
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
     return true;
  }  
   </script>
</body>
</html>

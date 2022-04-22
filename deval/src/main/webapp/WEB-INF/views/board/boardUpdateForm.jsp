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
					<form action="boardUpdate.do" enctype="multipart/form-data"
						method="post" id="writeForm">
							<h4 class="blog-page-title"></h4>
						<table class="table shopping-cart-table">
						<tr>
							
								<td>
								<td>글번호
							<input type="hidden" value="${board.boardNo}"
									name="boardNo" id="boardNo" readonly>${board.boardNo}</td>

							</tr>
							<tr>
								<td>Title</td>
								<td><input type="text" value="${board.title}" name="title"
									id="title"></td>
							</tr>
							<tr>
								<td>Subject</td>
								<td><textarea rows="5" cols="30" name="subject"
										id="subject">${board.subject}</textarea>
							</tr>

						</table>
						<button type="submit" class="button">수정</button>

					</form>

				

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
				</section>
			</div>

 


			<%-- <c:if test = "${board.boardTypeNo == 1}" > 
 <a href="free.do" class="btn btn-mod btn-g btn-small btn-square">목록으로</a></c:if>
 	<br>
  		 

<c:if test = "${board.boardTypeNo == 2}" > 
 <a href="notice.do" class="btn btn-mod btn-g btn-small btn-square">목록으로</a></c:if>
 	

<c:if test = "${board.boardTypeNo == 3}" > 
 <a href="technical.do" class="btn btn-mod btn-g btn-small btn-square">목록으로</a></c:if>
 	
</div> --%>
	</section>

		</div>
</body>
</html>

<%--   
</head>
<body>
 
    <br>
    <b><font size="6" color="gray">글 수정</font></b>
    <br>
    
  <form action="boardUpdate.do" method="post">
 
 
 
      
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
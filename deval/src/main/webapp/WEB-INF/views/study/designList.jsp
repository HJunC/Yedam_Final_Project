<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor.min.css" />
<link rel="stylesheet" href="${resources}/css/common/toastui-editor-dark.min.css" />

</head>
<body>
<div id="editor"></div>
<script src="${resources}/js/common/toastui-editor-all.min.js"></script>

<div id="viewer"></div>
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
  
  /**
  * 뷰어 적용
  */
  const viewer = new toastui.Editor.factory({
	    el: document.querySelector("#viewer"),
	    viewer: true,
	    initialValue: '${study.subject}',
	    theme: 'dark'
	});
</script>


</body>
</html>
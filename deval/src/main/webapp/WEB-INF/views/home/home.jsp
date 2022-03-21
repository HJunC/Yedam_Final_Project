<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h1>here is test</h1>
test
<c:if test="${not empty user}">
	<h1>${user.memberName}님 환영합니다</h1>
</c:if>
</div>
</body>
</html>
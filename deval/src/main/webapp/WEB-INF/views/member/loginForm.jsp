<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<h1>Login Form</h1>
	<form action="login.do" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" id="memberId" name="memberId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="memberPassword" name="memberPassword"></td>
		</tr>
	</table>
	<button type="button" onclick="location.href='signUpForm.do'">회원가입</button>
	<input type="submit" value="로그인"> 
	</form>
	<a href="home.do">홈으로</a>
</div>
</body>
</html>
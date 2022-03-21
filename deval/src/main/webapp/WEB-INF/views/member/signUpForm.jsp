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
	<h1>sign up form</h1>
	<form action="signUp.do" method="post" onsubmit="return formCheck()">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td colspan="3"><input type="text" id="memberId" name="memberId"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td colspan="3"><input type="password" id="memberPassword" name="memberPassword"></td>
			
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td colspan="3"><input type="text" id="passwordCheck" onchange="pwdCheck()"></td>
		</tr>
		<tr>
			<td></td>
			<td colspan="3"><div id="check_word"></div></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="memberName" name="memberName"></td>
			<td>전화번호</td>
			<td><input type="text" id="memberPhone" name="memberPhone"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td colspan="3"><input type="email" id="memberMail" name="memberMail"></td>
		</tr>
	</table>
	<input type="submit" value="가입">
	<input type="reset" value="취소"> 
	</form>
	<a href="home.do">홈으로</a>
	<script>
		function formCheck(){
			if(check_word.style.color != green) {
				if(check_word.style.color == red){
					alert('비밀번호를 일치시켜주세요')
				} else {
					alert('비밀번호를 확인해주세요')					
				}
				return false;
			}
		}
		
		function pwdCheck(){
			var password = memberPassword.value;
			var check = passwordCheck.value;
			if(password == check){
				check_word.innerText = '';
				check_word.style.color="green";
				check_word.innerText = '비밀번호가 일치합니다';
			} else {
				check_word.innerText = '';
				check_word.style.color="red";
				check_word.innerText = '비밀번호가 일치하지 않습니다.';
			}
			
		}
	</script>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	평점주기
	<div class="mb-20 mb-md-10">
	<form action="rating.do" method="post">
	<input type="text" id="mentoServiceNo" name="mentoServiceNo">
		<select class="form-control input-sm round" name="ratingNum">
			<option value="1">1</option>
			<option value="1.5">1.5</option>
			<option value="2">2</option>
			<option value="2.5">2.5</option>
			<option value="3">3</option>
			<option value="3.5">3.5</option>
			<option value="4">4</option>
			<option value="4.5">4.5</option>
			<option value="5">5</option>
		</select>
		<input type="submit" value="평점등록!">
	</form>
	</div>
	<script type="text/javascript">
	mentoServiceNo.value = window.opener.document.getElementById("serviceNo").value;
		console.log(test.value);
	</script>
</body>
</html>
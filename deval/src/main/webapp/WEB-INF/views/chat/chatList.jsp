<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><br><br><br><br><br><br>
	<table class="table">
		<tr>
			<th>방아이디</th>
			<th>방주인</th>
			<th>손님</th>
		</tr>
		<c:forEach var="room" items="${list}">
		<tr onclick="chatSelect('${room.roomId}')">
			<td>${room.roomId}</td>
			<td>${room.ownerId}</td>
			<td>${room.entryId}</td>
		</tr>
		</c:forEach>
	</table>
	<form action="chatSelect.do" id="frm" method="get">
		<input type="hidden" name="roomId" id="roomId">
	</form>
	<script type="text/javascript">
		function chatSelect(n) {
			frm.roomId.value = n;
			frm.submit();
		}
	</script>
</body>
</html>
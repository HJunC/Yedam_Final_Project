<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div>
	<input type="text" id="chat">
	<input type="button" id="btn" value="버튼">
	
	</div>
	
	<script type="text/javascript">
		var as = new WebSocket('WS://localhost/deval/chat');
		as.onopen = function() {
			console.log('connection opend');
		};
		
		as.onmessage = function(event) {
			console.log(event);
			console.log(event.data);
		}
		
		as.onclose = function (event) {
			console.log('connect closed.');
		}
		as.onerror = function (er) {
			console.log(er);
		}
		$('#btn').on('click',function(){as.send($('#chat').val())});
		
	</script>
</body>
</html>
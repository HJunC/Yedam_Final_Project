<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DevEric Chatting</title>


<style type="text/css">
	*{
		font-family: 나눔고딕;
	}
	#messageWindow{
		background: black;
		color: greenyellow;
	}
	#inputMessage{
		width:500px;
		height:20px
	}
	#btn-submit{
		background: white;
		background: #F7E600;
		width:60px;
		height:30px;
		color:#607080;
		border:none;
	}
	
	#main-container{
		width:600px;
		height:680px;
		border:1px solid black;
		margin:10px;
		display: inline-block;
		
	}
	#chat-container{
		vertical-align: bottom;
		border: 1px solid black;
		margin:10px;
		min-height: 600px;
		max-height: 600px;
		overflow: scroll;
		overflow-x:hidden;
		background: #9bbbd4;
	}
	
	.chat{
		font-size: 20px;
		color:black;
		margin: 5px;
		min-height: 20px;
		padding: 5px;
		min-width: 50px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #ffffff;
        width:auto;
        display:inline-block;
        border-radius: 10px 10px 10px 10px;
	}
	
	.notice{
		color:#607080;
		font-weight: bold;
		border : none;
		text-align: center;
		background-color: #9bbbd4;
		display: block;
	}

	.my-chat{
		text-align: right;
		background: #F7E600;
		border-radius: 10px 10px 10px 10px;
	}
	
	#bottom-container{
		margin:10px;
	}
	
	.chat-info{
		color:#556677;
		font-size: 10px;
		text-align: right;
		padding: 5px;
		padding-top: 0px;

	}
	
	.chat-box{
		text-align:left;
	}
	.my-chat-box{
		text-align: right;
	}
	
	
	
</style>
</head>
<body>
	<br><br><br><br><br><br><br><br><br>
	<div id="main-container">
		<div id="chat-container">
		<c:forEach items="${chats}" var="chat">
			<c:if test="${chat.writer == userId}">
			<div class='my-chat-box'>
				<div class='chat my-chat'>${chat.subject}</div>
				<div class='chat-info'>${chat.logDate}</div>
			</div>
			</c:if>
			<c:if test="${chat.writer != userId}">
			<div class='chat-box'>
				<div class='chat'>${chat.writer}:${chat.subject}</div>
				<div class='chat-info chat-box'>${chat.logDate}</div>
			</div>
			</c:if>
		</c:forEach>
		</div>
		<div id="bottom-container">
			<input id="inputMessage" type="text">
			<input id="btn-submit" type="submit" value="전송" >
		</div>
	</div>
	<input type="hidden" id="roomId" value="${roomId}">
	<input type="hidden" id="userId" value="${userId}">

</body>

<script type="text/javascript">
//스크롤 자동 내리가 처리
$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight);

var roomId = $('#roomId').val();
var userId = $('#userId').val();
var textarea = document.getElementById("messageWindow");
/* var webSocket = new WebSocket('WS://localhost/deval/chat?roomId=${roomId}'); */

// 로컬에서 테스트할 때 사용하는 URL입니다.
var inputMessage = document.getElementById('inputMessage');

webSocket.onerror = function(e){
	onError(e);
};
webSocket.onopen = function(e){
	console.log(10000);	
	onOpen(e);
};
webSocket.onmessage = function(e){
	onMessage(e);
};

webSocket.onclose = function(e) {console.log(e)}

function onMessage(e){
	var chatMsg = e.data;
	console.log(chatMsg);
	console.log(chatMsg.subject);
	var date = new Date();
	var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
	if(chatMsg.substring(0,6) == 'server'){
		var $chat = $("<div class='chat notice'>" + chatMsg + "</div>");
		$('#chat-container').append($chat);
	}else{
		var $chat = $("<div class='chat-box'><div class='chat'>" + chatMsg + "</div><div class='chat-info chat-box'>"+ dateInfo +"</div></div>");
		$('#chat-container').append($chat);
	}
	$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight);
	
}

function onOpen(e){
	console.log(e);
}

function onError(e){
	alert(e.data);
}

function send(roomNum){
	var chatMsg = inputMessage.value;
	if(chatMsg == ''){
		return;
	}
	var date = new Date();
	var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
	var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + chatMsg + "</div><div class='chat-info'>"+ dateInfo +"</div></div>");
	$('#chat-container').append($chat);
	chatMsg = {
			subject :chatMsg,
			writer : userId,
			roomId : roomId
	}
	webSocket.send(JSON.stringify(chatMsg));
	inputMessage.value = "";
	$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight);
}
//window.scroll(0, document.documentElement.scrollHeight);
	$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight);
	//websocket --End


	$(function(){
		$('#inputMessage').keydown(function(key){
			if(key.keyCode == 13){
				$('#inputMessage').focus();
				send();
			}
		});
		$('#btn-submit').click(function(){
			send();
		});
		
	})
</script>
</html>
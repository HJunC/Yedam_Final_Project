<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="resources" value="${pageContext.request.contextPath}/resources"/>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="Rhythm &mdash; One & Multi Page Creative Template">
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->
		<!-- Favicons -->
		<link rel="shortcut icon" href="${resources}/images/favicon.png">
		<script src="${resources}/js/jquery-3.5.1.min.js"></script>
		<!-- CSS -->
		<link rel="stylesheet" href="${resources}/css/bootstrap.min.css">
		<link rel="stylesheet" href="${resources}/css/template.css">
		<link rel="stylesheet" href="${resources}/css/custom/custom-style.css">
		<style type="text/css">
	*{
		font-family: 나눔고딕;
	}
	body {background-color: black;}
	#messageWindow{
		background: black;
		color: greenyellow;
	}
	#inputMessage{
		padding: 26px 16px;
	    height: 20px;
	    border-radius: 0 0 10px 10px;
	    outline: 0;
	    border: 0;
	    width: 100%;
	    font-size: 16px;
	}
	
	#btn-submit{
		position: absolute;
		right: 0;
		width: 58px;
	    height: 52px;
	    background: initial;
		color: #79c7c5;
		border:none;
	}
	
	#main-container{
	    width: 100%;
	    margin: 10px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	}
	#header-container {
	    padding: 14px 16px;
	    border-radius: 10px 10px 0 0;
	    background-color: #fff;
	    width: 400px;
	    color: #7fb398;
	    display: flex;
	    justify-content: center;
        box-shadow: 0 2px 4px rgb(0 0 0 / 18%);
    	z-index: 1;
	}
	#chat-container{
		padding: 0 18px;
		width: 400px;
		vertical-align: bottom;
		height: 600px;
		overflow: scroll;
		overflow-x: hidden;
		background: #e6f3f7;
	}
	
	#chat-container::-webkit-scrollbar {
	    width: 8px;
	    background-color: #e6f3f7;
	}
	
	#chat-container::-webkit-scrollbar-thumb {
	    background-color: #2f3542;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
 	 }
	
	.chat{
		font-size: 16px;
		color: #fff;
		margin: 5px;
		min-height: 20px;
		padding: 4px 8px;
		min-width: 50px;
		text-align: left;
        height:auto;
        word-break : break-all;
        background: #b2b2b2;
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
		background: #79c7c5;
		border-radius: 10px 10px 10px 10px;
	}
	
	#bottom-container{
		position: relative;
		width: 400px;
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
<script>
var URL_CONFIG = '${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath }';
var socket = null;
var room = '${roomId}';
console.log(room)
if (room == '') {
	var webSocket = new WebSocket('ws://' + URL_CONFIG + '/socket');
} else {
	var webSocket = new WebSocket('ws://' + URL_CONFIG + '/socket?roomId=${roomId}');
}
console.log(webSocket)
socket = webSocket;
webSocket.onopen = function(e) {
	console.log(e);
	console.log("웹소켓이 연결되었습니다.");
	webSocket.onmessage = function(e) {
		console.log(e)
			$('#alarmText').text(e.data);
			$('#alarm').css("display","block");
			setTimeout(function() {
				$('#alarm').css("display","none");
			},5000);
		}
	};
</script>
</head>
<body>
<!-- Page Loader -->
		<div class="page-loader dark">
			<div class="loader">Loading...</div>
		</div>
		<!-- End Page Loader -->
	<div id="main-container">
		<div id="header-container">${chatting }</div>
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
			<input id="inputMessage" type="text" placeholder="내용을 입력하세요...">
			<button type="submit" id="btn-submit">
				<i class="fa fa-paper-plane"></i>
			</button>
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
<script src="${resources}/js/jquery.easing.1.3.js"></script>
		<script src="${resources}/js/bootstrap.bundle.min.js"></script>
		<script src="${resources}/js/SmoothScroll.js"></script>
		<script src="${resources}/js/jquery.scrollTo.min.js"></script>
		<script src="${resources}/js/jquery.localScroll.min.js"></script>
		<script src="${resources}/js/jquery.viewport.mini.js"></script>
		<script src="${resources}/js/jquery.countTo.js"></script>
		<script src="${resources}/js/jquery.appear.js"></script>
		<script src="${resources}/js/jquery.parallax-1.1.3.js"></script>
		<script src="${resources}/js/jquery.fitvids.js"></script>
		<script src="${resources}/js/owl.carousel.min.js"></script>
		<script src="${resources}/js/isotope.pkgd.min.js"></script>
		<script src="${resources}/js/imagesloaded.pkgd.min.js"></script>
		<script src="${resources}/js/jquery.magnific-popup.min.js"></script>
		<script src="${resources}/js/masonry.pkgd.min.js"></script>
		<script src="${resources}/js/jquery.lazyload.min.js"></script>
		<script src="${resources}/js/wow.min.js"></script>
		<script src="${resources}/js/morphext.js"></script>
		<script src="${resources}/js/typed.min.js"></script>
		<script src="${resources}/js/all.js"></script>
		<script src="${resources}/js/contact-form.js"></script>
		<script src="${resources}/js/jquery.ajaxchimp.min.js"></script>
		<script src="${resources}/js/objectFitPolyfill.min.js"></script>
		<script src="${resources}/js/splitting.min.js"></script>
	</body>
</html>
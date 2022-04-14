	var socket = null;
	//스크롤 자동 내리가 처리
	$('#chat-container').scrollTop($('#chat-container')[0].scrollHeight);

	var roomId = $('#roomId').val();
	var userId = $('#userId').val();
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('WS://localhost/deval/chat?roomId=${roomId}');
	
	// 로컬에서 테스트할 때 사용하는 URL입니다.
	var inputMessage = document.getElementById('inputMessage');
	
	webSocket.onerror = function(e){
		onError(e);
	};
	webSocket.onopen = function(e){
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
package co.yd.deval.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class Handler extends TextWebSocketHandler{
	List<WebSocketSession> sessions = new ArrayList<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session + " 세션열결됨");
		System.out.println(session.getPrincipal().getName());
		sessions.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session + ":" + message + "======22번째");
		session.sendMessage(message);
		String senderId = session.getPrincipal().getName();
		for ( WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage(senderId + " :" + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session + "----" +  status + "closed");
	}
}

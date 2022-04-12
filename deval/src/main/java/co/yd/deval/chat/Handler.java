package co.yd.deval.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.yd.deval.chat.service.ChatLogService;
import co.yd.deval.chat.service.ChatLogVO;

public class Handler extends TextWebSocketHandler {
	@Autowired
	private ChatLogService chatLogDAO; 
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	List<WebSocketSession> sessionList = new ArrayList<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session);
		sessionList.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		ChatLogVO chatvo = objectMapper.readValue(message.getPayload(), ChatLogVO.class);
		for(WebSocketSession sess : sessionList) {
			if(sess.getUri().equals(session.getUri()) && !sess.getPrincipal().getName().equals(session.getPrincipal().getName())) {
				sess.sendMessage(new TextMessage(chatvo.getWriter() + ":" + chatvo.getSubject()));
			}
		}
		
		chatLogDAO.insertChat(chatvo);
	}
	

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}
}
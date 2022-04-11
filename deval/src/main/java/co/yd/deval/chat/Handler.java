package co.yd.deval.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.yd.deval.chat.service.ChatLogService;

public class Handler extends TextWebSocketHandler{
	
	@Autowired
	private ChatLogService chatLogDAO;
	
	List<WebSocketSession> sessions = new ArrayList<>();
	private Map<String, List<WebSocketSession>> sessionMap = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session + " 세션열결됨");
		System.out.println(session.getPrincipal());
		
		sessions.add(session);
		System.out.println(session.getUri());

	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(session + ":" + message + "======22번째");
		
		String senderId = session.getPrincipal().getName();

		String msg = message.getPayload();
		/*
		 * if (StringUtils.isNotEmpty(msg)) { String[] strs = msg.split(","); if (strs
		 * != null && strs.length == 4) { String content = strs[0]; String roomId =
		 * strs[1]; String ownerId = strs[2]; String entryId = strs[3]; WebSocketSession
		 * chatRoom = sessionMap.get(roomId); // chatRoom이 없으면 (=없던 방) 방을 새로 생성
		 * if(chatRoom == null) { sessionMap.put(roomId, session); } else { // chatRoom이
		 * 있으면 해당 채팅방에 받은 메시지를 푸시
		 * 
		 * } }
		 * 
		 * }
		 */
		 
		
		
		/*
		 * for(WebSocketSession sess : sessions) { sess.sendMessage(new
		 * TextMessage(senderId + " : " + message.getPayload())); }
		 */
		
		
		/*
		 * if(StringUtils.isNotEmpty(msg)) { String[] strs = msg.split(",");
		 * if(strs[0].equals("reply")) { session.sendMessage(new
		 * TextMessage("session : " + senderId + "mgs1 : " + strs[0] + "msg2 : " +
		 * strs[1])); } }
		 */
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session + "----" +  status + "closed");
	}
}

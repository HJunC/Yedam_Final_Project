package co.yd.deval.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.yd.deval.chat.service.AlarmService;
import co.yd.deval.chat.service.AlarmVO;
import co.yd.deval.chat.service.ChatLogService;
import co.yd.deval.chat.service.ChatLogVO;

public class Handler extends TextWebSocketHandler {
	@Autowired
	private ChatLogService chatLogDAO;

	@Autowired
	private AlarmService alarmDAO;

	private final ObjectMapper objectMapper = new ObjectMapper();

	List<WebSocketSession> sessionList = new ArrayList<>();


	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		System.out.println(session);
		System.out.println(session.getPrincipal());
		System.out.println(session.getPrincipal().getName());
		if(session.getPrincipal() != null) {
			for(AlarmVO vo : alarmDAO.alarmList(Objects.requireNonNull(session.getPrincipal()).getName())) {
				session.sendMessage(new TextMessage(vo.getSubject()));
			}
			alarmDAO.updateAlarm(session.getPrincipal().getName());
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		String userId = Objects.requireNonNull(session.getPrincipal()).getName();
		Boolean roomCheck = session.getUri().toString().contains("roomId"); 
		if (roomCheck) {
			ChatLogVO chatvo = objectMapper.readValue(message.getPayload(), ChatLogVO.class);
			for (WebSocketSession sess : sessionList) {
				if (sess.getUri().equals(session.getUri()) && !Objects.requireNonNull(sess.getPrincipal()).getName().equals(userId)) {
					sess.sendMessage(new TextMessage(chatvo.getWriter() + ":" + chatvo.getSubject()));
				}
			}
			chatLogDAO.insertChat(chatvo);
			return;
		}
		String msg = message.getPayload();
		AlarmVO alarmvo = objectMapper.readValue(msg, AlarmVO.class);
		alarmDAO.insertAlarm(alarmvo);
		for (WebSocketSession sess : sessionList) {
			System.out.println(sess.getPrincipal().getName());
			if (Objects.requireNonNull(sess.getPrincipal()).getName().equals(alarmvo.getMemberId())) {
				sess.sendMessage(new TextMessage(alarmvo.getSubject()));
				alarmDAO.updateAlarm(alarmvo.getMemberId());
			}

		}

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}

}
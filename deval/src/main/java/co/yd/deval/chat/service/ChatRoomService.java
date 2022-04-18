package co.yd.deval.chat.service;

import java.util.List;

public interface ChatRoomService {
	int makeChatRoom(ChatRoomVO vo);
	List<ChatRoomVO> selectListChat(String id);
	//roomId 땡겨오기
	ChatRoomVO selectChatRoom(int roomId);
	ChatRoomVO selectChat(ChatRoomVO vo);
}


package co.yd.deval.chat.service;

import java.util.List;

public interface ChatRoomService {
	int makeChatRoom(ChatRoomVO vo);
	List<ChatRoomVO> selectListChat(String id);
}

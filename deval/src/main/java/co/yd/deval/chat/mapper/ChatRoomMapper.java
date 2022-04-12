package co.yd.deval.chat.mapper;

import java.util.List;

import co.yd.deval.chat.service.ChatRoomVO;

public interface ChatRoomMapper {
	int makeChatRoom(ChatRoomVO vo);
	List<ChatRoomVO> selectListChat(String id);
	//roomId 땡겨오기
	ChatRoomVO selectChatRoom(int roomId);
}

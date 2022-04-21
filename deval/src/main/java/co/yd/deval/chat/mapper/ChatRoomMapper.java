package co.yd.deval.chat.mapper;

import java.util.List;

import co.yd.deval.chat.service.ChatRoomVO;

public interface ChatRoomMapper {
	//채티방 값 비교하기
	List<ChatRoomVO> chatList();
	
	int makeChatRoom(ChatRoomVO vo);
	List<ChatRoomVO> selectListChat(String id);
	//roomId 땡겨오기
	ChatRoomVO selectChatRoom(int roomId);
	
	ChatRoomVO selectChat(ChatRoomVO vo);
}

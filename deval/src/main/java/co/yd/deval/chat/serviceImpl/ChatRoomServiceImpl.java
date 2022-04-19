package co.yd.deval.chat.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.chat.mapper.ChatRoomMapper;
import co.yd.deval.chat.service.ChatRoomService;
import co.yd.deval.chat.service.ChatRoomVO;

@Repository("chatRoomDAO")
public class ChatRoomServiceImpl implements ChatRoomService {
	@Autowired
	private ChatRoomMapper map;
	
	@Override
	public int makeChatRoom(ChatRoomVO vo) {
		return map.makeChatRoom(vo);
	}

	@Override
	public List<ChatRoomVO> selectListChat(String id) {
		return map.selectListChat(id);
	}

	@Override
	public ChatRoomVO selectChatRoom(int roomId) {
		return map.selectChatRoom(roomId);
	}

	@Override
	public List<ChatRoomVO> chatList() {
		return map.chatList();
	}

}

package co.yd.deval.chat.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.chat.mapper.ChatLogMapper;
import co.yd.deval.chat.service.ChatLogService;
import co.yd.deval.chat.service.ChatLogVO;

@Repository("chatLogDAO")
public class ChatLogServiceImpl implements ChatLogService {
	@Autowired
	private ChatLogMapper map;
	
	@Override
	public List<ChatLogVO> selectChat(int roomId) {
		return map.selectChat(roomId);
	}

	@Override
	public int insertChat(ChatLogVO vo) {
		return map.insertChat(vo);
	}

}

package co.yd.deval.chat.mapper;

import java.util.List;

import co.yd.deval.chat.service.ChatLogVO;

public interface ChatLogMapper {
	List<ChatLogVO> selectChat(int roomId);
	int insertChat(ChatLogVO vo);
}

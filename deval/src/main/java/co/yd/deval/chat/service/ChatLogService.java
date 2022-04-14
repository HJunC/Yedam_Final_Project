package co.yd.deval.chat.service;

import java.util.List;

public interface ChatLogService {
	List<ChatLogVO> selectChat(int roomId);
	int insertChat(ChatLogVO vo);
}

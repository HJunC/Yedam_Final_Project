package co.yd.deval.chat.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ChatRoomVO {
	private int roomId;
	private String ownerId;
	private String entryId;
}

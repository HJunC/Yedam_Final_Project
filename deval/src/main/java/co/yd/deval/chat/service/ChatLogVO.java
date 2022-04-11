package co.yd.deval.chat.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatLogVO {
	private int roomId;
	@JsonFormat
	private Date logDate;
	private String writer;
	private String subject;
	private int chatLogNo;
}

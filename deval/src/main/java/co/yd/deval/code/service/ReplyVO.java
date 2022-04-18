package co.yd.deval.code.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
	private int cqNo;
	private String title;
	private String subject;
	private Date replyDate;
	private int hit;
	private int recommend;
	private int cqReplyNo;
	private String writer;
	private int boardTypeNo;
}

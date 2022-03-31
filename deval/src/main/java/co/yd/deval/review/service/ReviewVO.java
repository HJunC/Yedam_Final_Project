package co.yd.deval.review.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	
	private int cqNo;
	private String title;
	private String subject;
	private Date replyDate;
	private int hit;
	private int recommend;
	private int cqReplyNo;
	private String writer;
	
}

package co.yd.deval.comment.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVO {
	private int commentNo;
	private String commentSub;
	private Date commentDate;
	private String writer;
	private int boardNo;
	private int boardTypeNo;
}

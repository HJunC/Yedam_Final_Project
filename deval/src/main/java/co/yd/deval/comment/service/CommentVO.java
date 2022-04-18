package co.yd.deval.comment.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {
	private int commentNo;
	private String commentSubject;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date commentDate;
	private String writer;
	private int boardNo;
	private int boardTypeNo;
}

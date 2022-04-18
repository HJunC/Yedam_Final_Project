package co.yd.deval.comment.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVO {
	private int commentNo;
	private String commentSubject;
	@JsonFormat(pattern = "yyyy-MM-dd hh24:mm")
	private Date commentDate;
	private String writer;
	private int boardNo;
	private int boardTypeNo;
}

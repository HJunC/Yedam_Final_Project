package co.yd.deval.board.service;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {

		private int commentNo;
		private String commentSub;
		@JsonFormat(pattern="yyyy-MM-dd")
		private Date commentDate;
		private String writer;
		private int boardNo;
		
		
	
}

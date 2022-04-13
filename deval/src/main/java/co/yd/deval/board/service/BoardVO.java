package co.yd.deval.board.service;

import java.util.Date;

import co.yd.deval.common.Criteria;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int boardNo;
	private int boardTypeNo;
	private String title;
	private String subject;
	private Date boardDate;
	private int hit;
	private int recommend;
	private String writer;
	private String category;
	private String photo;
	private int rn;
	private Criteria criteria;
}

package co.yd.deval.board.web;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter 
@Setter
public class BoardVO {

	private int board_no;
	private String Title;
	private String Subject;
	private Date board_date;
	private int Hit;
	private int recommend;
	private String writer;
	private String category;
	private int board_type_no;
	
}


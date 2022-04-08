package co.yd.deval.board.service;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileManageVO {
	
	private int fileNo;
	private String name;
	private String type;
	private int boardNo;
}

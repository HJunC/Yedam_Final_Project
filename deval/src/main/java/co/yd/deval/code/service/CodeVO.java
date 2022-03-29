package co.yd.deval.code.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CodeVO {

	private int cqNo;
	private String cqLang;
	private String title;
	private String subject;
	private Date cqDate;
	private int hit;
	private int recommend;
	private String writer;
	private String cqType;
	private String gitUri;

}

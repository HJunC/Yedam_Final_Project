package co.yd.deval.code.service;

import java.util.Date;

import co.yd.deval.common.Criteria;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeVO {

	private int cqNo;
	private String cqLang;
	private String title;
	private String subject;
	private Date cqDate;
	private int hit;
	private int recommend;
	private String writer;
	private int projectNo;
	private int boardTypeNo;

	private int rn;
	private Criteria criteria;
}

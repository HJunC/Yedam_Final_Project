package co.yd.deval.study.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StudyVO {
	private int studyNo;
	private String lang1;
	private String location;
	private String subject;
	private Date uploadDate;
	private int maxRcnt;
	private String defficulty;
	private String leaderId;
	private Date studySdt;
	private Date studyEdt;
	private String state;
	private String studyNm;
	private String lang2;
}

package co.yd.deval.study.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import co.yd.deval.common.Criteria;
import lombok.Getter;
import lombok.Setter;

import lombok.ToString;

@Setter
@Getter
@ToString
public class StudyVO {
	
	private int studyNo;
	private String lang1;
	private String location;
	private String subject;
	private Date uploadDate;
	private int maxRcnt;
	private String defficulty;
	private String leaderId;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date studySdt;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date studyEdt;
	private String state;
	private String studyNm;
	private String lang2;
	private String[] ck_lang;
	private int rcnt;
	private String kakao;
	
	//페이징
    private int rn;
    private Criteria criteria;
}

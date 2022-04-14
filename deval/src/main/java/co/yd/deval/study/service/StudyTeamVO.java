package co.yd.deval.study.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudyTeamVO {
	private String profileImg;
	private int exp;
	private String present;
	private String state;
	private String memberId;
	private String isLeader;
	private String license;
	private String career;
	private String college;
	private String studyNo;
	private String mail;
	private String name;
	private String studyNm;
	private Date studySdt;
	private Date studyEdt;
	private String location;

}

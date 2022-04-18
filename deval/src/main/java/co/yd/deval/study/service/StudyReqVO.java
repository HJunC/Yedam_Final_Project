package co.yd.deval.study.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StudyReqVO {
	private int studyNo;
	private String state;
	private String memberId;
	private String college;
	private String career;
	private String license;
	private String isLeader;
	private String present;
	private String profileImg;
}

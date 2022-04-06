package co.yd.deval.mento.service;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MentoServVO {
	private int mentoServiceNo;
	private Date startDate;
	private Date endDate;
	private String serviceTerm;
	private String mentiInfo;
	private String startTm;
	private String endTm;
	private String mentoId;
	private String state;
	private String stsfdg;
	private String mentiId;
}

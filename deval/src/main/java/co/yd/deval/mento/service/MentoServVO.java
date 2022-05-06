package co.yd.deval.mento.service;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MentoServVO {
	private int mentoServiceNo;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String serviceTerm;
	private int startTm;
	private int endTm;
	private String mentoId;
	private String state;
	private String stsfdg;
	private String mentiId;
	private int price;
	private String profileImg;
	private int tradeLogNo;
}

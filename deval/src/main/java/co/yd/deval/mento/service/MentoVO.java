package co.yd.deval.mento.service;


import co.yd.deval.common.Criteria;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MentoVO {
	private int mentoNum;
	private String lang;
	private String photo;
	private String history;
	private String info;
	private int people;
	private String mentoId;
	private int price;
	private String serviceStt;
	private String serviceEdt;
	private String termDay;
	private String termWeek;
	private String termMonth;
	
	//paging
	private int rn;
	private Criteria criteria;
}

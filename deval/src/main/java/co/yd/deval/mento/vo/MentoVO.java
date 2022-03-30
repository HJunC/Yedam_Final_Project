package co.yd.deval.mento.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MentoVO {
	private String lang;
	private String photo;
	private String history;
	private String info;
	private int people;
	private String mentoId;
	private int price;
	private String maxTerm;
	private String serviceStt;
	private String serviceEdt;
}

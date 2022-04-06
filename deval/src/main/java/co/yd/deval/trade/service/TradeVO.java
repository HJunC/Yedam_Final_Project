package co.yd.deval.trade.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TradeVO {
	
	private int tradeNo;
	private String title;
	private String subject;
	private int price;
	private Date tradeDate;
	private int hit;
	private String writer;
	private String tradeItem;
	private String tradeType;
	
}

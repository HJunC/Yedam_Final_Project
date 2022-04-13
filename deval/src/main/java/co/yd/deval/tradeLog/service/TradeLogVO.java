package co.yd.deval.tradeLog.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TradeLogVO {
	private int tradeLogNo;
	private int serviceNo;
	private int price;
	private Date startDate;
	private Date endDate;
	private String buyer;
	private String seller;
	private String state;
	private String mentoReqt;
	
}

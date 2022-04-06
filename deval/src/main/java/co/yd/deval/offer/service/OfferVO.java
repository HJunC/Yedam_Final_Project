package co.yd.deval.offer.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OfferVO {

	private int offerNo;
	private String companyId;
	private String companyName;
	private String offerSubject;
	private int offerCareer;
	private String employPosition;
	private int offerIncome;
	private String offerLanguage;
	private String offerTitle;
	private String offerEdu;
	private String offerLocation;
	private String offerTime;
	private Date offerStartDate;
	private Date offerEndDate;
	
}

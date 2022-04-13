package co.yd.deval.mento.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TestVO {
	private String mentoId;
	private String memberId;
	private String serviceTime;
	private Date serviceDate;
}

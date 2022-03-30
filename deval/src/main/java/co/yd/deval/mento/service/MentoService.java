package co.yd.deval.mento.service;

import java.util.List;

import co.yd.deval.mento.vo.MentoVO;

public interface MentoService {
	List<MentoVO> mentoSelectList(String lang);
	MentoVO mentoSelectOne(MentoVO vo);
	int mentoInsert(MentoVO vo);
	int mentoDelete(MentoVO vo);
	int mentoUpdate(MentoVO vo);
}

package co.yd.deval.mento.mapper;

import java.util.List;

import co.yd.deval.mento.service.MentoVO;

public interface MentoMapper {
	List<MentoVO> mentoSelectList(String lang);
	MentoVO mentoSelectOne(MentoVO vo);
	int mentoInsert(MentoVO vo);
	int mentoDelete(MentoVO vo);
	int mentoUpdate(MentoVO vo);
}

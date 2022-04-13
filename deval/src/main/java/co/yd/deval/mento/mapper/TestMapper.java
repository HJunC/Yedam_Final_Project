package co.yd.deval.mento.mapper;

import co.yd.deval.mento.service.MentoServVO;

public interface TestMapper {
	int timeCheck(MentoServVO vo);
	
	int insertMentoring(MentoServVO vo);

}

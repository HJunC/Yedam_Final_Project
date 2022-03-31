package co.yd.deval.mentoserv.map;

import java.util.List;

import co.yd.deval.mentoserv.service.MentoServVO;

public interface MentoServMapper {
		//전체만족도
		double allSatisAvg();
		//단일만족도
		double oneSatisAvg(String id);
		//CRUD
		List<MentoServVO> mentoServList();
		MentoServVO mentoServSelect();
		int mentoServInsert(MentoServVO vo);
		int mentoServUpdate(MentoServVO vo);
		int mentoServDelete(MentoServVO vo);
}

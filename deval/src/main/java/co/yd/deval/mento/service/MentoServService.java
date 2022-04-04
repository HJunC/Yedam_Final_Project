package co.yd.deval.mento.service;

import java.util.List;

public interface MentoServService {
	//전체만족도
	double allSatisAvg();
	//단일만족도
	double oneSatisAvg(String id);
	
	//CRUD
	List<MentoServVO> mentoServList(String mentoId, int state);
	MentoServVO mentoServSelect(MentoServVO vo);
	int mentoServInsert(MentoServVO vo);
	int mentoServUpdate(MentoServVO vo);
	int mentoServDelete(MentoServVO vo);
	
	//전체값 조회
	int serviceCount();
	
}

package co.yd.deval.mento.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import co.yd.deval.mento.service.MentoServVO;

public interface MentoServMapper {
		//전체만족도
		double allSatisAvg();
		//단일만족도
		double oneSatisAvg(String id);
		//CRUD
		List<MentoServVO> mentoServList(String mentoId);
		MentoServVO mentoServSelect();
		int mentoServInsert(MentoServVO vo);
		int mentoServUpdate(int mentoServiceNo);
		int mentoServDelete(int mentoServiceNo);
		
		//전체값 조회
		int serviceCount();
		//결제후 멤버포인트차감
		int buyerPayment(Map<String, Object> buyer);
		
		//서비스 수락
		int mentoServAccept(MentoServVO vo);
		
		//my Page
		MentoServVO findWaitMento(String id);
		List<MentoServVO> findMentoByNo(String id);
		
		
}

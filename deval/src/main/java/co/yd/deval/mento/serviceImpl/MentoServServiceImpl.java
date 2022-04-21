package co.yd.deval.mento.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.mento.mapper.MentoServMapper;
import co.yd.deval.mento.service.MentoServService;
import co.yd.deval.mento.service.MentoServVO;

@Repository("mentoServDAO")
public class MentoServServiceImpl implements MentoServService {
	@Autowired
	private MentoServMapper map;
	
	@Override
	public double allSatisAvg() {
		return map.allSatisAvg();
	}

	@Override
	public double oneSatisAvg(String id) {
		return map.oneSatisAvg(id);
	}

	@Override
	public List<MentoServVO> mentoServList(String mentoId) {
		return map.mentoServList(mentoId);
	}

	@Override
	public MentoServVO mentoServSelect(MentoServVO vo) {
		return map.mentoServSelect();
	}

	@Override
	public int mentoServInsert(MentoServVO vo) {
		return map.mentoServInsert(vo);
	}

	@Override
	public int mentoServUpdate(int mentoServiceNo) {
		return map.mentoServUpdate(mentoServiceNo);
	}

	@Override
	public int mentoServDelete(int mentoServiceNo) {
		return map.mentoServDelete(mentoServiceNo);
	}

	@Override
	public int serviceCount() {
		return map.serviceCount();
	}

	@Override
	public int buyerPayment(Map<String, Object> buyer) {
		return map.buyerPayment(buyer);
	}

	@Override
	public int mentoServAccept(List<MentoServVO> mentoServiceNo) {
		int i = 0;
		for (MentoServVO serv : mentoServiceNo) {
			int n = map.mentoServAccept(serv);
			if(n != 0) {
				i++;
			}
		}
		return i;
	}

	@Override
	public MentoServVO findWaitMento(String id) {
		return map.findWaitMento(id);
	}
	
	@Override
	public List<MentoServVO> findEndMento(String id) {
		return map.findEndMento(id);
	}

	@Override
	public List<MentoServVO> findDoingMento(String id) {
		return map.findDoingMento(id);
	}

	@Override
	public int updateRating(Map<String, Object> rate) {
		return map.updateRating(rate);
	}
	

}

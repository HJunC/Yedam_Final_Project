package co.yd.deval.mento.serviceImpl;

import java.util.List;

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
	public List<MentoServVO> mentoServList() {
		return map.mentoServList();
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
	public int mentoServUpdate(MentoServVO vo) {
		return map.mentoServUpdate(vo);
	}

	@Override
	public int mentoServDelete(MentoServVO vo) {
		return map.mentoServDelete(vo);
	}

}

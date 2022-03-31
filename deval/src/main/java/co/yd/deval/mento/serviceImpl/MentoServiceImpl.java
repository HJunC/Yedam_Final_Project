package co.yd.deval.mento.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.mento.mapper.MentoMapper;
import co.yd.deval.mento.service.MentoService;
import co.yd.deval.mento.service.MentoVO;

@Repository("mentoDAO")
public class MentoServiceImpl implements MentoService{
	@Autowired
	public MentoMapper map;
	
	@Override
	public List<MentoVO> mentoSelectList(String lang) {
		return map.mentoSelectList(lang);
	}

	@Override
	public MentoVO mentoSelectOne(MentoVO vo) {
		return map.mentoSelectOne(vo);
	}

	@Override
	public int mentoInsert(MentoVO vo) {
		return map.mentoInsert(vo);
	}

	@Override
	public int mentoDelete(MentoVO vo) {
		return map.mentoDelete(vo);
	}

	@Override
	public int mentoUpdate(MentoVO vo) {
		return map.mentoUpdate(vo);
	}
	
}

package co.yd.deval.mento.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.mento.mapper.TestMapper;
import co.yd.deval.mento.service.MentoServVO;
import co.yd.deval.mento.service.TestService;

@Repository("testDAO")
public class TestServiceImpl implements TestService {
	@Autowired
	private TestMapper map;
	
	@Override
	public int timeCheck(MentoServVO vo) {
		return map.timeCheck(vo);
	}

	@Override
	public int insertMentoring(MentoServVO vo) {
		return map.insertMentoring(vo);
	}

}

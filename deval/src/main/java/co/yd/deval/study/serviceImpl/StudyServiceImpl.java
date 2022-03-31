package co.yd.deval.study.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.yd.deval.study.mapper.StudyMapper;
import co.yd.deval.study.service.StudyService;
import co.yd.deval.study.service.StudyVO;


@Repository("studyDao")
public class StudyServiceImpl implements StudyService {
	
	@Autowired
	private StudyMapper map;

	@Override
	public int studyInsert(StudyVO vo) {
		return map.studyInsert(vo);
	}

	@Override
	public int studyUpdate(StudyVO vo) {
		return map.studyUpdate(vo);
	}

	@Override
	public StudyVO studySelectNo(StudyVO vo) {
		return map.studySelectNo(vo);
	}

	@Override
	public List<StudyVO> studySelectAll() {
		return map.studySelectAll();
	}

}

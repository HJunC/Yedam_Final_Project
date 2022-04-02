package co.yd.deval.study.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.yd.deval.study.mapper.StudyMapper;
import co.yd.deval.study.service.StudyInfoVO;
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

	
	
	//모달창 정보
	@Override
	public StudyInfoVO studySelectUser(StudyInfoVO vo) {
		return map.studySelectUser(vo);
	}

	@Override
	public int studyUserInsert(StudyInfoVO vo) {
		return map.studyUserInsert(vo);
	}
	
	@Override
	public int studyUserUpdate(StudyInfoVO vo) {
		return map.studyUserUpdate(vo);
	}
}

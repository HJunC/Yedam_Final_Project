package co.yd.deval.study.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.study.mapper.StudyMapper;
import co.yd.deval.study.service.StudyInfoVO;
import co.yd.deval.study.service.StudyReqVO;
import co.yd.deval.study.service.StudyService;
import co.yd.deval.study.service.StudyVO;


@Repository("studyDao")
public class StudyServiceImpl implements StudyService {
	
	@Autowired
	private StudyMapper map;

	// 스터디 모집
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
	
	
	// 모달창 회원정보
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

	@Override
	public List<StudyVO> findStudyByNo(String id) {
		return map.findStudyByNo(id);
	}

	@Override
	public List<StudyVO> findWaitingStudy(String id) {
		return map.findWaitingStudy(id);
	}

	// 스터디 참가
	@Override
	public List<StudyReqVO> studyReqSelectAll() {
		return map.studyReqSelectAll();
	}

	@Override
	public int studyTeamMemberInsert(StudyReqVO vo) {
		return map.studyTeamMemberInsert(vo);
	}

	@Override
	public int studyTeamMemberUpdate(StudyReqVO vo) {
		return map.studyTeamMemberUpdate(vo);
	}

	@Override
	public int studyTeamMemberDelete(StudyReqVO vo) {
		return map.studyTeamMemberDelete(vo);
	}

}

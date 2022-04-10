package co.yd.deval.study.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import co.yd.deval.study.mapper.StudyMapper;
import co.yd.deval.study.service.StudyInfoVO;
import co.yd.deval.study.service.StudyReqVO;
import co.yd.deval.study.service.StudyService;
import co.yd.deval.study.service.StudyTeamVO;
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
	
	@Override
	public int findMaxStudyNo() {
		return map.findMaxStudyNo();
	}
	
	@Override
	public List<StudyReqVO> studyMemberFind(String id) {
		return map.studyMemberFind(id);
	}
	
	@Override
	public List<StudyReqVO> studyUnfinedTeamBtn(String id) {
		return map.studyUnfinedTeamBtn(id);
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
	public List<StudyVO> findStudyImLeader(String id) {
		return map.findStudyImLeader(id);
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
	public int studyTeamLeaderInsert(StudyReqVO vo) {
		return map.studyTeamLeaderInsert(vo);
	}

	@Override
	public int studyTeamMemberUpdateAccept(StudyReqVO vo) {
		return map.studyTeamMemberUpdateAccept(vo);
	}

	@Override
	public int studyTeamMemberUpdateRefuse(StudyReqVO vo) {
		return map.studyTeamMemberUpdateRefuse(vo);
	}

	@Override
	public int studyTeamMemberDelete(StudyReqVO vo) {
		return map.studyTeamMemberDelete(vo);
	}
	
	// 신청자 페이지
	@Override
	public List<StudyReqVO> studyLeaderBtn(String id) {
		return map.studyLeaderBtn(id);
	}

	@Override
	public List<StudyReqVO> studyLeaderReqPage(String leaderId) {
		return map.studyLeaderReqPage(leaderId);
	}
	
	// 스터디 팀 VIEW
	@Override
	public List<StudyTeamVO> studyTeamMember(String memberId) {
		return map.studyTeamMember(memberId);
	}
	
	// 페이징 처리
	@Override
	public List<StudyVO> getListWithPaging(StudyVO vo) {
		return map.getListWithPaging(vo);
	}

	@Override
	public int getTotalCount(StudyVO vo) {
		return map.getTotalCount(vo);
	}

	@Override
	public List<StudyVO> studyLocSearch(String loc) {
		return map.studyLocSearch(loc);
	}

	@Override
	public int studyRcntSelect(StudyVO vo) {
		return map.studyRcntSelect(vo);
	}

	@Override
	public int rcntLeader(StudyVO vo) {
		return map.rcntLeader(vo);
	}

	@Override
	public int rcntMember(StudyVO vo) {
		return map.rcntMember(vo);
	}

}

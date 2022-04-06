package co.yd.deval.study.service;

import java.util.List;

public interface StudyService {
	// 스터디 모집
	List<StudyVO> studySelectAll();
	StudyVO studySelectNo(StudyVO vo);
	
	int findMaxStudyNo();
	int studyInsert(StudyVO vo);
	int studyUpdate(StudyVO vo);

	List<StudyVO> findStudyImLeader(String id);
	List<StudyVO> findStudyByNo(String id);
	List<StudyVO> findWaitingStudy(String id);
	
	

	// 모달창 회원정보
	StudyInfoVO studySelectUser(StudyInfoVO vo);
	int studyUserInsert(StudyInfoVO vo);
	int studyUserUpdate(StudyInfoVO vo);
	
	// 스터디 참가
	List<StudyReqVO> studyReqSelectAll();
	//StudyReqVO studyTeam(StudyReqVO vo);
	int studyTeamMemberInsert(StudyReqVO vo);
	int studyTeamLeaderInsert(StudyReqVO vo);
	int studyTeamMemberUpdateAccept(StudyReqVO vo);
	int studyTeamMemberUpdateRefuse(StudyReqVO vo);
	int studyTeamMemberDelete(StudyReqVO vo);
	
	// 스터디 팀원 VIEW
	List<StudyTeamVO> studyTeamSelectAll();
	//StudyTeamVO studyTeamSelect(StudyTeamVO vo);

}

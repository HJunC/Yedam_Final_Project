package co.yd.deval.study.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import co.yd.deval.project.service.ProjectVO;
import co.yd.deval.study.service.StudyInfoVO;
import co.yd.deval.study.service.StudyReqVO;
import co.yd.deval.study.service.StudyTeamVO;
import co.yd.deval.study.service.StudyVO;

public interface StudyMapper {
	//스터디 CURD
	List<StudyVO> studySelectAll();
	StudyVO studySelectNo(StudyVO vo);

	int findMaxStudyNo();
	int studyInsert(StudyVO vo);
	int studyUpdate(StudyVO vo);

	List<StudyVO> findStudyImLeader(String id);
	List<StudyVO> findStudyByNo(String id);
	List<StudyVO> findWaitingStudy(String id);

	//모달창 정보
	StudyInfoVO studySelectUser(StudyInfoVO vo);
	int studyUserInsert(StudyInfoVO vo);
	int studyUserUpdate(StudyInfoVO vo);
	
	// 스터디 참가
	List<StudyReqVO> studyReqSelectAll();
	List<StudyReqVO> studyMemberFind(String id);
	List<StudyReqVO> studyUnfinedTeamBtn(String id);
	//StudyReqVO studyTeam(StudyReqVO vo);
	int studyTeamMemberInsert(StudyReqVO vo);
	int studyTeamLeaderInsert(StudyReqVO vo);
	int studyTeamMemberUpdateAccept(StudyReqVO vo);
	int studyTeamMemberUpdateRefuse(StudyReqVO vo);
	int studyTeamMemberDelete(StudyReqVO vo);
	
	// 스터디 팀원 VIEW
	List<StudyTeamVO> studyTeamSelectAll();
	//StudyTeamVO studyTeamSelect(StudyTeamVO vo);
	
	// 검색 페이징 처리
    List<StudyVO> getListWithPaging(StudyVO vo);
    int getTotalCount(StudyVO vo);
	

}

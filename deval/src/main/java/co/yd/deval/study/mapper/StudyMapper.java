package co.yd.deval.study.mapper;

import co.yd.deval.study.service.StudyInfoVO;
import co.yd.deval.study.service.StudyReqVO;
import co.yd.deval.study.service.StudyTeamVO;
import co.yd.deval.study.service.StudyVO;

import java.util.List;

public interface StudyMapper {
	// 스터디 모집
		List<StudyVO> studySelectAll();
		List<StudyVO> studyLocSearch(String loc);
		int studyEnd(StudyVO vo);
		
		StudyVO studySelectNo(StudyVO vo);
		
		int findMaxStudyNo();
		int studyInsert(StudyVO vo);
		int studyUpdate(StudyVO vo);
		List<StudyReqVO> teamAllMember(StudyReqVO vo);
		
		List<StudyVO> findEndStudy(String id);
		List<StudyVO> findDoingStudy(String id);
		List<StudyVO> findWaitingStudy(String id);
		
		// 모달창 회원정보
		StudyInfoVO studySelectUser(StudyInfoVO vo);
		int studyUserInsert(StudyInfoVO vo);
		int studyUserUpdate(StudyInfoVO vo);
		
		// 스터디 참가
		List<StudyReqVO> studyReqSelectAll();
		List<StudyReqVO> studyMemberFind(String id);
		List<StudyReqVO> studyUnfinedTeamBtn(String id);
		
		// 스터디 신청페이지
		List<StudyReqVO> studyLeaderBtn(String id);
		List<StudyReqVO> studyLeaderReqPage(String leaderId);
		int studyTeamMemberInsert(StudyReqVO vo);
		int studyTeamLeaderInsert(StudyReqVO vo);
		int studyTeamMemberUpdateAccept(StudyReqVO vo);
		int studyTeamMemberUpdateRefuse(StudyReqVO vo);
		int studyTeamMemberDelete(StudyReqVO vo);
		
		// 스터디 팀원 페이지 VIEW
		List<StudyTeamVO> studyTeamMember(String memberId);

		// 검색 페이징 처리
	    List<StudyVO> getListWithPaging(StudyVO vo);
	    int getTotalCount(StudyVO vo);
	    
	    // 현재인원
	    int studyRcntSelect(StudyVO vo);
	    int rcntLeader(StudyVO vo);
	    int rcntMember(StudyVO vo);
	    
	    // 그룹원페이지 스터디 일시정지 재개
	    int studyPause(StudyVO vo);
	    int studyRestart(StudyVO vo);
	    
	    // 그룹원페이지 팀나가기
	    int studyTeamDel(StudyReqVO vo);
	    int minusRcnt(int no);
	    
	    //모달창 체크
	    int addInfoCheck(String id);
	}

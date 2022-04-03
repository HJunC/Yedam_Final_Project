package co.yd.deval.study.mapper;

import java.util.List;

import co.yd.deval.study.service.StudyVO;

public interface StudyMapper {
	List<StudyVO> studySelectAll();
	StudyVO studySelectNo(StudyVO vo);
	
	int studyInsert(StudyVO vo);
	int studyUpdate(StudyVO vo);
	
	List<StudyVO> findStudyImLeader(String id);
	List<StudyVO> findStudyByNo(String id);
}

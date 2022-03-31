package co.yd.deval.study.service;

import java.util.List;

public interface StudyService {
	List<StudyVO> studySelectAll();
	StudyVO studySelectNo(StudyVO vo);
	
	int studyInsert(StudyVO vo);
	int studyUpdate(StudyVO vo);

}

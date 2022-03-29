package co.yd.deval.study.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import co.yd.deval.study.vo.StudyVO;

public interface StudyMapper {
	List<StudyVO> studySelectAll();
	StudyVO studySelectNo(StudyVO vo);
	
	int studyInsert(StudyVO vo);
	int studyUpdate(StudyVO vo);

}

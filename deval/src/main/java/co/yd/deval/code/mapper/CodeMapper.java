package co.yd.deval.code.mapper;

import java.util.List;

import co.yd.deval.code.service.CodeVO;

public interface CodeMapper {

	List<CodeVO> cqList(CodeVO vo);
	CodeVO cqSelect(CodeVO vo);
	int codeInsert(CodeVO vo);
	int codeUpdate(CodeVO vo);
	int codeDelete(CodeVO vo);
	
	void codeHitUp(CodeVO vo);
	void codeRecommendUp(CodeVO vo);

	int getTotalCount(CodeVO vo);
	
}

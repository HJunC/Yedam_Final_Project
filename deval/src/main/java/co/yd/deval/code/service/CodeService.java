package co.yd.deval.code.service;

import java.util.List;

import co.yd.deval.code.vo.CodeVO;

public interface CodeService {
	
	List<CodeVO> codeSelectList();
	CodeVO codeSelectOne(CodeVO vo);
	int codeInsert(CodeVO vo);
	int codeUpdate(CodeVO vo);
	int codeDelete(CodeVO vo);
	
	void codeHitUp(CodeVO vo);
	void codeRecommendUp(CodeVO vo);
}

package co.yd.deval.code.service;

import java.util.List;

public interface CodeService {
	
	List<CodeVO> cqList(int no);
	CodeVO cqSelect(CodeVO vo);
	
	int codeInsert(CodeVO vo);
	int codeUpdate(CodeVO vo);
	int codeDelete(CodeVO vo);
	
	void codeHitUp(CodeVO vo);
	void codeRecommendUp(CodeVO vo);
}

package co.yd.deval.code.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.code.mapper.CodeMapper;
import co.yd.deval.code.service.CodeService;
import co.yd.deval.code.service.CodeVO;

@Repository("codeDAO")
public class CodeServiceImpl implements CodeService {

	@Autowired
	private CodeMapper map;
	
	@Override
	public List<CodeVO> codeSelectList() {
		return map.codeSelectList();
	}

	@Override
	public CodeVO codeSelectOne(CodeVO vo) {
		return map.codeSelectOne(vo);
	}

	@Override
	public int codeInsert(CodeVO vo) {
		return map.codeInsert(vo);
	}

	@Override
	public int codeUpdate(CodeVO vo) {
		return map.codeUpdate(vo);
	}

	@Override
	public int codeDelete(CodeVO vo) {
		return map.codeDelete(vo);
	}

	@Override
	public void codeHitUp(CodeVO vo) {
		map.codeHitUp(vo);
	}

	@Override
	public void codeRecommendUp(CodeVO vo) {
		map.codeRecommendUp(vo);
	}

}

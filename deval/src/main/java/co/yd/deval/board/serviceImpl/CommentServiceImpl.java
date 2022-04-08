package co.yd.deval.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yd.deval.board.mapper.BCommentMapper;
import co.yd.deval.board.service.BCommentService;
import co.yd.deval.board.service.BCommentVO;

@Service("commentDao")
public class CommentServiceImpl implements BCommentService {

	@Autowired
	private BCommentMapper map;

	@Override
	public List<BCommentVO> commentSelectList(BCommentVO vo) {
		return map.commentSelectList(vo);
	}
	
	@Override
	public BCommentVO commentSelect(BCommentVO vo) {
		return map.commentSelect(vo);
	}

	@Override
	public int commentInsert(BCommentVO vo) {
		return map.commentInsert(vo);
	 
	}

	@Override
	public int commentDelete(BCommentVO vo) {
		return map.commentDelete(vo);
	}

 
	
	
	
	
	
}

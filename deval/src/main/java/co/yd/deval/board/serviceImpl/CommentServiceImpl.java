package co.yd.deval.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yd.deval.board.mapper.CommentMapper;
import co.yd.deval.board.service.CommentService;
import co.yd.deval.board.service.CommentVO;

@Service("commentDao")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper map;

	@Override
	public List<CommentVO> commentSelectList(CommentVO vo) {
		return map.commentSelectList(vo);
	}
	
	@Override
	public CommentVO commentSelect(CommentVO vo) {
		return map.commentSelect(vo);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		return map.commentInsert(vo);
	 
	}

	@Override
	public int commentDelete(CommentVO vo) {
		return map.commentDelete(vo);
	}

 
	
	
	
	
	
}

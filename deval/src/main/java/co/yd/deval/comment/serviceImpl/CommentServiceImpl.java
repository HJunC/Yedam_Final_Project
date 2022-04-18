package co.yd.deval.comment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.comment.mapper.CommentMapper;
import co.yd.deval.comment.service.CommentService;
import co.yd.deval.comment.service.CommentVO;

@Repository("commentDAO")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper map;
	
	@Override
	public List<CommentVO> commentSelectList(CommentVO vo) {
		return map.comSelectList(vo);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		return map.comInsert(vo);
	}

	@Override
	public int commentDelete(CommentVO vo) {
		return map.comDelete(vo);
	}

	@Override
	public CommentVO commentSelect(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.comSelect(vo);
	}

}

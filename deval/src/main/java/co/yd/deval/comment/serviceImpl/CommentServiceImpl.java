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
	private CommentMapper map2;
	
	@Override
	public List<CommentVO> commentSelectList(CommentVO vo) {
		return map2.commentSelectList(vo);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		return map2.commentInsert(vo);
	}

	@Override
	public int commentDelete(CommentVO vo) {
		return map2.commentDelete(vo);
	}

}

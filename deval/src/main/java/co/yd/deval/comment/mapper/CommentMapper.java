package co.yd.deval.comment.mapper;

import java.util.List;

import co.yd.deval.comment.service.CommentVO;

public interface CommentMapper {

	List<CommentVO> commentSelectList(CommentVO vo);
	int commentInsert(CommentVO vo);
	int commentDelete(CommentVO vo);
	
}

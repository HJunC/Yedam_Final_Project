package co.yd.deval.board.mapper;

import java.util.List;

import co.yd.deval.board.service.CommentVO;

public interface CommentMapper {
	
	List<CommentVO> commentSelectList(CommentVO vo);
	
	CommentVO commentSelect(CommentVO vo);

	int commentInsert(CommentVO vo);

    int commentDelete(CommentVO vo);



}

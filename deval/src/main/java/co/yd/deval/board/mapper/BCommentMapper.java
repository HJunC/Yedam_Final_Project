package co.yd.deval.board.mapper;

import java.util.List;

import co.yd.deval.board.service.BCommentVO;

public interface BCommentMapper {
	
	List<BCommentVO> commentSelectList(BCommentVO vo);
	
	BCommentVO commentSelect(BCommentVO vo);

	int commentInsert(BCommentVO vo);

    int commentDelete(BCommentVO vo);



}

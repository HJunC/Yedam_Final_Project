package co.yd.deval.board.service;

import java.util.List;

public interface BCommentService {
	
	List<BCommentVO> commentSelectList(BCommentVO vo);

	BCommentVO commentSelect(BCommentVO vo);

	int commentInsert(BCommentVO vo);

    int commentDelete(BCommentVO vo);



}



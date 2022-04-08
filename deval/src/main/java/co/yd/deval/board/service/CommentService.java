package co.yd.deval.board.service;

import java.util.List;

public interface CommentService {
	
	List<CommentVO> commentSelectList(CommentVO vo);

	CommentVO commentSelect(CommentVO vo);

	int commentInsert(CommentVO vo);

    int commentDelete(CommentVO vo);



}



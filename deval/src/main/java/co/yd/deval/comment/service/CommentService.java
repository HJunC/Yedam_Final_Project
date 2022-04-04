package co.yd.deval.comment.service;

import java.util.List;

public interface CommentService {

	List<CommentVO> commentSelectList(CommentVO vo);
	int commentInsert(CommentVO vo);
	int commentDelete(CommentVO vo);
	
}

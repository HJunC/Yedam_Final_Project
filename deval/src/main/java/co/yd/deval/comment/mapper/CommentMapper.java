package co.yd.deval.comment.mapper;

import java.util.List;

import co.yd.deval.comment.service.CommentVO;

public interface CommentMapper {
	List<CommentVO> comSelectList(CommentVO vo);	

	int comInsert(CommentVO vo);
	int comUpdate(CommentVO vo);
    int comDelete(CommentVO vo);
}

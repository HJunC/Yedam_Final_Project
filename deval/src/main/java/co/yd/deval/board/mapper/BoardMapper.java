package co.yd.deval.board.mapper;

import java.util.List;

import co.yd.deval.board.service.BoardVO;

public interface BoardMapper {
	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO vo);
	int boardInsert(BoardVO vo);
	int boardUpdate(BoardVO vo);
	int boardDelete (BoardVO vo);
	
	void boardHitUp(BoardVO vo);
	void boardRecUp(BoardVO vo);
 

}
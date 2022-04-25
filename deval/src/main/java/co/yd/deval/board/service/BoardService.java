package co.yd.deval.board.service;

import java.util.List;

public interface BoardService {

	List<BoardVO> boardSelectList(int b);

	BoardVO boardSelect(BoardVO vo);

	int boardInsert(BoardVO vo);

	int boardUpdate(BoardVO vo);

	int boardDelete(BoardVO vo);

	int boardHitUp(int board_no);

	int boardRecUp(int board_no);

	List<BoardVO> getListWithPaging(BoardVO vo);

	int getTotalCount(BoardVO vo);
	
	List<BoardVO> getSearchList(String option,String keyvalue);

	List<BoardVO> getMainPageList();
}

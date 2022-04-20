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

	/***
	 * 泥ロ솕硫댁뿉�꽌 蹂댁뿬二쇨린�쐞�븳 �뜲�씠�꽣
	 * @return BoardVO 由ъ뒪�듃
	 */
	List<BoardVO> getMainPageList();
}

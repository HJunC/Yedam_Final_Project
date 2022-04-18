package co.yd.deval.board.mapper;

import co.yd.deval.board.service.BoardVO;

import java.util.List;

public interface BoardMapper {

	List<BoardVO> boardSelectList(int b);

	BoardVO boardSelect(BoardVO vo);

	int boardInsert(BoardVO vo);

	int boardUpdate(BoardVO vo);

	int boardDelete(BoardVO vo);

	int boardHitUp(int board_no);

	int boardRecUp(int board_no);

	List<BoardVO> getListWithPaging(BoardVO vo);

	int getTotalCount(BoardVO vo);

	/***
	 * 첫화면에서 보여주기위한 데이터
	 * @return BoardVO 리스트
	 */
	List<BoardVO> getMainPageList();

}

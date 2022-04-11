package co.yd.deval.board.mapper;

import java.util.List;

import co.yd.deval.board.service.BoardVO;
import co.yd.deval.project.service.ProjectVO;

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

}

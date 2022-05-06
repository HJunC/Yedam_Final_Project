package co.yd.deval.board.mapper;

import co.yd.deval.board.service.BoardVO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BoardMapper {

	List<BoardVO> boardSelectList(int b);

	BoardVO boardSelect(BoardVO vo);

	int boardInsert(BoardVO vo);

	int boardUpdate(BoardVO vo);

	int boardDelete(BoardVO vo);

	int boardHitUp(int board_no);

	int boardRecUp(int board_no);

	List<BoardVO> getListWithPaging(BoardVO vo);
	
	List<BoardVO> getSearchList(@Param("option") String option,@Param("keyvalue") String keyvalue);

	int getTotalCount(BoardVO vo);

	List<BoardVO> getMainPageList();

}

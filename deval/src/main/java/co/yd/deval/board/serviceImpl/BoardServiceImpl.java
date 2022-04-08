package co.yd.deval.board.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.yd.deval.board.mapper.BoardMapper;
import co.yd.deval.board.service.BoardService;
import co.yd.deval.board.service.BoardVO;
import co.yd.deval.board.service.Search;
import co.yd.deval.board.service.BCommentVO;

@Service("boardDao")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper map;

	@Override
	public List<BoardVO> boardSelectList(int b) {
		return map.boardSelectList(b);
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return map.boardInsert(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return map.boardDelete(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return map.boardUpdate(vo);
	}

	@Override
	public int boardRecUp(int board_no) {
		return map.boardRecUp(board_no);
	}

	@Override
	public int boardHitUp(int board_no) {
		return map.boardHitUp(board_no);
	}

	/*
	 * public static int getBoardListCnt(Search search) { // TODO Auto-generated
	 * method stub return 0; }
	 */
}

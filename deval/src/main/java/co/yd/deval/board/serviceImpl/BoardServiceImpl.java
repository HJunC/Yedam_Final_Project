package co.yd.deval.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yd.deval.board.mapper.BoardMapper;
import co.yd.deval.board.service.BoardService;
import co.yd.deval.board.service.BoardVO;

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
	public void boardHitUp(BoardVO vo) {
		map.boardHitUp(vo);
		
	}

	@Override
	public void boardRecUp(BoardVO vo) {
		map.boardRecUp(vo);
	}
	
	@Override
	public void commentInsert(BoardVO vo) {
		map.commentInsert(vo);
	}
	


	
}

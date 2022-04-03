package co.yd.deval.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.board.mapper.BoardMapper;
import co.yd.deval.board.service.BoardService;
import co.yd.deval.board.service.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardDao;

	@GetMapping("/free.do")
	public String free(Model model) {
		model.addAttribute("boardList", boardDao.boardSelectList(1));
		return "board/free";
	}

	@GetMapping("/write.do")
	public String write() {
		return "board/write";
	}

	@PostMapping("/writePost.do")
	public String write(BoardVO vo) {
		System.out.println(vo);
		boardDao.boardInsert(vo);

		if (vo.getBoardTypeNo() == 1) {
			return "redirect:free.do";
		} else if (vo.getBoardTypeNo() == 2) {
			return "redirect:notice.do";
		} else {
			return "redirect:technical.do";

		}
	}

	@GetMapping("/notice.do")
	public String notice(Model model) {
		model.addAttribute("noticeList", boardDao.boardSelectList(2));
		return "board/notice";
	}

	@GetMapping("/technical.do")
	public String technical(Model model) {
		model.addAttribute("technicList", boardDao.boardSelectList(3));
		return "board/technical";
	}

	@GetMapping("/boardDelete.do")
	public String boardDelete(BoardVO vo) {
		int i = boardDao.boardDelete(vo);
		if(i!=0) {
			return "redirect:free.do";
		}
		return "redirect:free.do";
	}

	@PostMapping("/boardSelect.do")
	public String boardSelect(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardDetail";

	}

	@PostMapping("/boardUpdateForm.do")
	public String boardUpdateForm(Model model, BoardVO vo) {
		model.addAttribute("board", vo);
		return "board/boardUpdateForm";
	}

	@PostMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo) {
		int n = boardDao.boardUpdate(vo);
		if (n != 0) {
			return "redirect:free.do";
		}
		return "redirect:boardSelect.do";
	}

	@PostMapping("/noticeSelect.do")
	public String noticeSelect(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardDetail";

	}

	@PostMapping("/technicSelect.do")
	public String technicSelect(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardDetail";

	}

	/*
	 * @RequestMapping("/boardDelete.do") public String boardDelete() {
	 * 
	 * return ""; }
	 */

}

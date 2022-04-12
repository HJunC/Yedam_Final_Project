package co.yd.deval.board.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.yd.deval.board.service.BoardService;
import co.yd.deval.board.service.BoardVO;
import co.yd.deval.comment.service.CommentService;
import co.yd.deval.comment.service.CommentVO;
import co.yd.deval.common.Criteria;
import co.yd.deval.common.PageDTO;
import co.yd.deval.review.service.ReviewVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardDao;

	@Autowired
	private CommentService commentDAO;

	@Autowired
	private String uploadPath;

	/**
	 * 자유게시판 목록
	 * 
	 * @param model
	 */
	@GetMapping("/free.do")
	
	
	
	
	
	
	
	
	public String free(Model model, BoardVO vo, Criteria cri) {
		if (cri.getPageNum() == 0)
			cri.setPageNum(1);
		if (cri.getAmount() == 0)
			cri.setAmount(10);
		vo.setBoardTypeNo(1);
		vo.setCriteria(cri);
		List<BoardVO> boardList = boardDao.getListWithPaging(vo);
		model.addAttribute("boardList", boardList);
		model.addAttribute("board", vo);
		model.addAttribute("pageMaker", new PageDTO(cri, boardDao.getTotalCount(vo)));
		return "board/free";
	}

	/**
	 * 글쓰기 화면 이동
	 */
	@GetMapping("/write.do")
	public String write() {
		return "board/write";
	}

	@RequestMapping("/boardDetail.do")
	public String boardDetail(Model model, int board_no) {
		return "board/boardDetail";
	}

	/**
	 * 컨트롤러 설명
	 * 
	 * 
	 * @PostMapping("/writePost.do") public String write(BoardVO vo ,) {
	 * System.out.println(vo); boardDao.boardInsert(vo);
	 * 
	 * if (vo.getBoardTypeNo() == 1) { return "redirect:free.do"; } else if
	 * (vo.getBoardTypeNo() == 2) { return "redirect:notice.do"; } else { return
	 * "redirect:technical.do"; }
	 * 
	 * }
	 */

	@PostMapping("/writePost.do")

	public String write(BoardVO vo, MultipartFile file) {
		String originalName = file.getOriginalFilename();
		String fileType = originalName.substring(originalName.lastIndexOf(".") + 1, originalName.length());
		String fileName = UUID.randomUUID().toString() + "." + fileType;
		String pathName = uploadPath + fileName;
		File dest = new File(pathName);

		try {
			FileCopyUtils.copy(file.getBytes(), dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		vo.setPhoto(fileName);
		int n = boardDao.boardInsert(vo);

		if (vo.getBoardTypeNo() == 1) {
			return "redirect:free.do";
		} else if (vo.getBoardTypeNo() == 2) {
			return "redirect:notice.do";
		} else {

			return "redirect:technical.do";

		}

	}

	/**
	 * 
	 * 컨트롤러 설명
	 * 
	 * @param model
	 */
	@GetMapping("/notice.do")
	public String notice(Model model) {
		model.addAttribute("noticeList", boardDao.boardSelectList(2));
		return "board/notice";
	}

	/**
	 * 컨트롤러 설명
	 * 
	 * @param model
	 */
	@GetMapping("/technical.do")
	public String technical(Model model) {
		model.addAttribute("technicList", boardDao.boardSelectList(3));
		return "board/technical";
	}

	/**
	 * 컨트롤러 설명
	 * 
	 * @param vo
	 */
	@GetMapping("/boardDelete.do")
	public String boardDelete(BoardVO vo) {
		int i = boardDao.boardDelete(vo);
		if (i != 0) {
			return "redirect:free.do";
		}
		return "redirect:free.do";
	}

	/**
	 * 컨트롤러 설명
	 * 
	 * @param vo
	 * @param model
	 */

	@PostMapping("/boardSelect.do")
	public String boardSelect(BoardVO vo, Model model, CommentVO cvo) {
		boardDao.boardHitUp(vo.getBoardNo());
		cvo.setBoardNo(vo.getBoardNo());
		model.addAttribute("board", boardDao.boardSelect(vo));
		model.addAttribute("comments", commentDAO.commentSelectList(cvo));
		return "board/boardDetail";
	}

	/*
	 * @PostMapping("/boardSelect.do") public String boardSelect(BoardVO vo, Model
	 * model, CommentVO cvo) { vo = boardDao.boardSelect(vo);
	 * model.addAttribute("board", vo); boardDao.boardHitUp(1); return
	 * "board/boardDetail";
	 * 
	 * }
	 */
	@ResponseBody
	@PostMapping("/recommend.do")
	public int recommend(BoardVO vo) {
		boardDao.boardRecUp(vo.getBoardNo());
		return boardDao.boardSelect(vo).getRecommend();
	}

	/**
	 * 컨트롤러 설명
	 * 
	 * @param vo
	 * @param model
	 */
	@PostMapping("/boardUpdateForm.do")
	public String boardUpdateForm(Model model, BoardVO vo) {
		model.addAttribute("board", vo);
		return "board/boardUpdateForm";

	}

	/**
	 * 컨트롤러 설명
	 * 
	 * @param vo
	 */
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo) {
		int n = boardDao.boardUpdate(vo);
		if (n != 0) {
			return "redirect:free.do";
		}

		return "redirect:boardSelect.do";
	}

	/**
	 * 컨트롤러 설명
	 * 
	 * @param vo
	 * @param model
	 */
	@PostMapping("/noticeSelect.do")
	public String noticeSelect(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardDetail";
	}

	/**
	 * 컨트롤러 설명
	 * 
	 * @param vo
	 * @param model
	 */
	@PostMapping("/technicSelect.do")
	public String technicSelect(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardDetail";
	}

}
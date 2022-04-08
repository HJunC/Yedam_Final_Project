package co.yd.deval.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.board.service.BoardService;
import co.yd.deval.board.service.BoardVO;
import co.yd.deval.board.service.CommentService;
import co.yd.deval.board.service.CommentVO;

@Controller
@RequestMapping("/board")
public class BoardController {
   
   @Autowired
   private BoardService boardDao;
   
   @Autowired
   private CommentService commentDao;

   /**
    * 자유게시판 목록
    * @param model
    */
   @GetMapping("/free.do")
   public String free(Model model) {
      model.addAttribute("boardList", boardDao.boardSelectList(1));
      System.out.println(model);
      return "board/free";
   }

   /**
    * 글쓰기 화면 이동
    */
   @GetMapping("/write.do")
   public String write() {
      return "board/write";
   }

   /**
    * 컨트롤러 설명 무슨일을 하는지
    * 파일업로드 화면으로 이동? (이거 파일업로드 어떤식으로 하는건지?)
    */
   
   /*
    * 컨트롤러 설명
    * @param vo
    * @param board_no
    */
   
   @RequestMapping("/boardDetail.do")
   public String boardDetail(Model model, int board_no) {
      return "board/boardDetail";
   }

   /**
    * 컨트롤러 설명
    * @param vo
    */
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

   /**
    * 컨트롤러 설명
    * @param model
    */
   @GetMapping("/notice.do")
   public String notice(Model model) {
      model.addAttribute("noticeList", boardDao.boardSelectList(2));
      return "board/notice";
   }

   /**
    * 컨트롤러 설명
    * @param model
    */
   @GetMapping("/technical.do")
   public String technical(Model model) {
      model.addAttribute("technicList", boardDao.boardSelectList(3));
      return "board/technical";
   }

   /**
    * 컨트롤러 설명
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
    * @param vo
    * @param model
    */
   @PostMapping("/boardSelect.do")
   public String boardSelect(BoardVO vo, Model model, CommentVO cvo) {
      boardDao.boardHitUp(vo.getBoardNo());
      boardDao.boardRecUp(vo.getBoardNo());
      cvo.setBoardNo(vo.getBoardNo());
      
      model.addAttribute("board", boardDao.boardSelect(vo));
      model.addAttribute("comments", commentDao.commentSelectList(cvo));
      return "board/boardDetail";
   }

   /**
    * 컨트롤러 설명
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
    * @param vo
    * @param model
    */
   @PostMapping("/technicSelect.do")
   public String technicSelect(BoardVO vo, Model model) {
      model.addAttribute("board", boardDao.boardSelect(vo));
      return "board/boardDetail";
   }

   
}
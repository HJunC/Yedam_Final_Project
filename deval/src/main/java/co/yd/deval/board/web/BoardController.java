package co.yd.deval.board.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.board.service.BoardService;
import co.yd.deval.board.service.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	private BoardService boardDao;
		
		   //자유게시판가기
	@GetMapping("/free.do")
    public String free(Model model) {
		model.addAttribute("boardList",boardDao.boardSelectList());
		return "board/free";
	}
		 
	//자유게시글 글등록하기
	@GetMapping("/write.do")
	public String write() {
		return "board/write";
	}
	
	  
    @PostMapping("/writePost.do")
	public String write(BoardVO vo) {
    	System.out.println(vo);
    	vo.setBoardTypeNo(1);
    	boardDao.boardInsert(vo);
	    return "redirect:free.do";
    } 

	
	//공지사항게시판 ㄱ ㅏ기
	@GetMapping("/notice.do")
	public String notice(Model model) {
		model.addAttribute("noticeList",boardDao.boardSelectList());
		return "board/notice";
	}
	
	
	  @GetMapping("/noticeWriter.do")
	    public String noticeWriter() {
			return "board/noticeWriter";
	}
	  
	   
	    @PostMapping("/noticeWriterPost.do")
		public String noticeWriter(BoardVO vo) {
	    	System.out.println(vo);
	    	vo.setBoardTypeNo(1);
	    	boardDao.boardInsert(vo);
		    return "redirect:notice.do";
	    } 
	
	    
	    
	    @GetMapping("/technical.do")
	    public String technical(Model model) {
			model.addAttribute("technicalList",boardDao.boardSelectList());
			return "board/technical";
		}
	    
	    
	    
	    
	    
    @PostMapping("/boardSelect.do")
	public String boardSelect(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardDetail";
	}
  
   
  


  

}




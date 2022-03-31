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
		
	//占쏙옙占쏙옙占쌉쏙옙占실곤옙占쏙옙
	@GetMapping("/free.do")
    public String free(Model model) {
		model.addAttribute("boardList",boardDao.boardSelectList());
		return "board/free";
	}
		 
	//占쏙옙占쏙옙占쌉시깍옙 占쌜듸옙占쏙옙歐占�
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

	
	//占쏙옙占쏙옙占쏙옙占쌓게쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
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
			model.addAttribute("technicList",boardDao.boardSelectList());
			return "board/technical";
		}
	    

		  @GetMapping("/technicWriter.do")
		    public String technicWriter() {
				return "board/technicWriter";
		}
		  
	    
		  @PostMapping("/technicWriterPost.do")
			public String technicWriter(BoardVO vo) {
		    	System.out.println(vo);
		    	vo.setBoardTypeNo(1);
		    	boardDao.boardInsert(vo);
			    return "redirect:technic.do";
		    } 
		
		    
	    
	    
    @PostMapping("/boardSelect.do")
	public String boardSelect(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardDetail";
	}
  
   
  


  

}




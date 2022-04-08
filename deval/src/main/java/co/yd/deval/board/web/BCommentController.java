package co.yd.deval.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.board.service.BCommentService;
import co.yd.deval.board.service.BCommentVO;

@Controller
@RequestMapping("/board")
public class BCommentController {

 @Autowired
 private BCommentService commentDao;

 
 
//  @GetMapping("/boardDetail.do")
//	public String  boardDetail(Model model) {
//		model.addAttribute("commentList");
//		System.out.println(model);
//		return "board/boardDetail";
//	}

	 
		@PostMapping("/commentPost.do")
		@ResponseBody
		public List<BCommentVO> boardDetail(BCommentVO vo, Model model) {
			System.out.println("============================" + vo);
			int n = commentDao.commentInsert(vo);
			if(n>0) {
				return commentDao.commentSelectList(vo);
			}
			return null;
		}

	
		@GetMapping("/commentDelete.do")
		public String commentDelete(BCommentVO vo) {
			commentDao.commentDelete(vo);
			return "board/boardDetail";
		}

	 
	
	 

		
		
	
}

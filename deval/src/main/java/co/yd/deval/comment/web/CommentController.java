package co.yd.deval.comment.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.comment.service.CommentService;
import co.yd.deval.comment.service.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService commentDAO;
	
	@GetMapping("/commentList.do")
	public String commentList(Model model, CommentVO vo) {
//		model.addAttribute("no", no);
		model.addAttribute("comments", commentDAO.commentSelectList(vo));
		return "comment/comment";
	}
	
	@PostMapping("/commentInsert.do")
	@ResponseBody
	public String commentInsert(Model model, CommentVO vo) {
		System.out.println("=========================================");
		commentDAO.commentInsert(vo);
		return "redirect:commentList.do";
	}
	
	@PostMapping("/commentDelete.do")
	public String commentDelete(Model model, CommentVO vo) {
		commentDAO.commentDelete(vo);
		return "redirect:commentList.do";
	}
}

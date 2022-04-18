package co.yd.deval.comment.web;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		model.addAttribute("comments", commentDAO.commentSelectList(vo));
		return "comment/comment";
	}

	@PostMapping("/commentInsert.do")
	@ResponseBody
	public int commentInsert(CommentVO vo) {
		int r = commentDAO.commentInsert(vo);
		if (r != 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@PostMapping("/commentDelete.do")
	@ResponseBody
	public String commentDelete(@RequestParam("no") int commentNo) {
		CommentVO vo = new CommentVO();
		vo.setCommentNo(commentNo);
		int r = commentDAO.commentDelete(vo);
		return "1";
	}
	

//  @GetMapping("/boardDetail.do")
//	public String  boardDetail(Model model) {
//		model.addAttribute("commentList");
//		System.out.println(model);
//		return "board/boardDetail";
//	}
	@PostMapping("/commentPost.do")
	@ResponseBody
	public List<CommentVO> boardDetail(CommentVO vo, Model model) {
		System.out.println("============================" + vo);
		int n = commentDAO.commentInsert(vo);
		if (n > 0) {
			return commentDAO.commentSelectList(vo);
		}
		return null;
	}
}

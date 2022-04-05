package co.yd.deval.comment.web;

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
//	@ResponseBody
	public String commentList(Model model, CommentVO vo) {
//		model.addAttribute("no", no);
		model.addAttribute("comments", commentDAO.commentSelectList(vo));
		return "comment/comment";
	}

	@PostMapping("/commentInsert.do")
	public String commentInsert(CommentVO vo) {
		int type = vo.getBoardTypeNo();
		int r = commentDAO.commentInsert(vo);
		if (r != 0) {
			if (type == 1) {
				return "redirect:../";
			} else if (type == 2) {
				return "redirect:../";
			} else if (type == 3) {
				return "redirect:../";
			} else if (type == 4) {
				return "redirect:../code/codeSelectOne.do?cqNo=" + vo.getBoardNo();
			} else if (type == 5) {
				return "redirect:../";
			}
			return "comment/error";
		} else {
			return "comment/error";
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
}
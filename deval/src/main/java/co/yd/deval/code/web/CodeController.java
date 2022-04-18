package co.yd.deval.code.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.code.service.CodeService;
import co.yd.deval.code.service.CodeVO;
import co.yd.deval.comment.service.CommentService;
import co.yd.deval.comment.service.CommentVO;

@Controller
@RequestMapping("/code")
public class CodeController {

	@Autowired
	private CodeService codeDAO;
	
	@Autowired
	private CommentService commentDAO;

	@GetMapping("/codeList.do")
	public String codeList(Model model) {
		model.addAttribute("codes", codeDAO.codeSelectList());
		return "code/codeList";
	}

	@GetMapping("/codeSelectOne.do")
	public String codeSelectOne(Model model, CodeVO vo, Principal principal) {
		vo = codeDAO.codeSelectOne(vo);
		if (vo != null) {
			model.addAttribute("code", vo);
			CommentVO cmVo = new CommentVO();
			cmVo.setBoardNo(vo.getCqNo());
			model.addAttribute("comments", commentDAO.commentSelectList(cmVo));
			if (principal != null) {
				model.addAttribute("username", principal.getName());
			}
			model.addAttribute("bno", vo.getCqNo());
			codeDAO.codeHitUp(vo);
			return "code/codeSelectOne";
		}
		return "code/error";
	}

	@GetMapping("/codeInsertForm.do")
	public String codeInsertForm(Model model) {
		return "code/codeInsertForm";
	}

	@PostMapping("/codeInsert.do")
	public String codeInsert(Model model, CodeVO vo) {
		int r = codeDAO.codeInsert(vo);
		if (r != 0) {
			return "redirect:codeList.do";
		} else {
			return "code/error";
		}
	}

	@GetMapping("/codeDelete.do")
	public String codeDelete(Model model, CodeVO vo) {
		int r = codeDAO.codeDelete(vo);
		if (r != 0) {
			return "redirect:codeList.do";
		}
		return "code/error";
	}
	
	@GetMapping("/codeUpdateForm.do")
	public String codeUpdateForm(Model model, CodeVO vo) {
		vo = codeDAO.codeSelectOne(vo);
		if (vo != null) {
			model.addAttribute("code", vo);
			return "code/codeUpdateForm";
		}
		return "code/error";
	}
	
	@PostMapping("/codeUpdate.do")
	public String codeUpdate(Model model, CodeVO vo) {
		int r = codeDAO.codeUpdate(vo);
		if(r != 0) {
			model.addAttribute("code", vo);
			codeDAO.codeSelectOne(vo);
			return "code/codeSelectOne";
		}
		return "code/error";
	}
	
//	@PostMapping("/reviewList.do")
//	public String reviewList(Model model, CodeVO vo) {
//		return "code/reviewList";
//	}

}

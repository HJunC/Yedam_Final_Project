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
import co.yd.deval.code.service.ReplyService;
import co.yd.deval.code.service.ReplyVO;
import co.yd.deval.comment.service.CommentService;
import co.yd.deval.comment.service.CommentVO;

@Controller
@RequestMapping("/cq")
public class CodeController {

	@Autowired
	private CodeService codeDAO;
	@Autowired
	private ReplyService replyDAO;
	@Autowired
	private CommentService commentDAO;

	@GetMapping("/cqList.do")
	public String cqList(Model model,String type) {
		if(type.equals("qna")) {
			model.addAttribute("lists", codeDAO.cqList(6));
			model.addAttribute("type",6);
		} else {
			model.addAttribute("lists",codeDAO.cqList(4));
			model.addAttribute("type",4);
		}
		return "code/cqList";
	}
	
	@GetMapping("/reviewList.do")
	public String reviewList(Model model) {
		model.addAttribute("lists",replyDAO.reviewList());
		return "code/reviewList";
	}
	
	@GetMapping("/reviewSelectList.do")
	public String reviewSelectList(Model model, ReplyVO vo) {
		model.addAttribute("lists",replyDAO.selectList(vo.getCqNo()));
		model.addAttribute("cqno",vo.getCqNo());
		return "code/reviewSelectList";
	}

	@GetMapping("/cqSelect.do")
	public String cqSelect(Model model, CodeVO vo, Principal principal) {
		vo = codeDAO.cqSelect(vo);
		if (vo != null) {
			model.addAttribute("cq", vo);
			CommentVO cmVo = new CommentVO();
			cmVo.setBoardNo(vo.getCqNo());
			model.addAttribute("comments", commentDAO.commentSelectList(cmVo));
			if(principal != null) {
				model.addAttribute("user", principal.getName());
			}
			model.addAttribute("bno", vo.getCqNo());
			codeDAO.codeHitUp(vo);
			if(vo.getBoardTypeNo() == 4) {
				return "code/codeSelect";
			} else {
				return "code/questionSelect";
			}
		}
		return "code/error";
	}
	
	@GetMapping("/reviewSelect.do")
	public String reviewSelect(Model model, ReplyVO vo, Principal user) {
		vo = replyDAO.reviewSelect(vo.getCqReplyNo());
		if(vo != null) {
			model.addAttribute("review",vo);
			CommentVO cVO = new CommentVO();
			cVO.setBoardNo(vo.getCqReplyNo());
			model.addAttribute("comments",commentDAO.commentSelectList(cVO));
			if(user != null) {
				model.addAttribute("user",user.getName());
			}
			model.addAttribute("bno",vo.getCqReplyNo());
			replyDAO.replyHitUp(vo.getCqReplyNo());
			return "code/reviewSelect";
		}
		return "code/error";
	}

	@GetMapping("/cqInsertForm.do")
	public String codeInsertForm(Model model,int type) {
		model.addAttribute("type",type);
		return "code/cqInsertForm";
	}

	@PostMapping("/cqInsert.do")
	public String codeInsert(Model model, CodeVO vo) {
		int type = vo.getBoardTypeNo();
		int r = codeDAO.codeInsert(vo);
		if (r != 0) {
			if(type == 4) {
				return "redirect:cqList.do?type=code";
			} else {
				return "redirect:cqList.do?type=qna";
			}
		} else {
			return "code/error";
		}
	}

	@PostMapping("/cqDelete.do")
	public String codeDelete(Model model, CodeVO vo) {
		int type = vo.getBoardTypeNo();
		int r = codeDAO.codeDelete(vo);
		if (r != 0) {
			if(type == 4) {
				return "redirect:cqList.do?type=code";
			} else {
				return "redirect:cqList.do?type=qna";
			}
		}
		return "code/error";
	}
	
	@GetMapping("/cqUpdateForm.do")
	public String codeUpdateForm(Model model, CodeVO vo) {
		vo = codeDAO.cqSelect(vo);
		if (vo != null) {
			model.addAttribute("cq", vo);
			return "code/cqUpdateForm";
		}
		return "code/error";
	}
	
	@PostMapping("/cqUpdate.do")
	public String codeUpdate(Model model, CodeVO vo) {
		int r = codeDAO.codeUpdate(vo);
		if(r != 0) {
			return "redirect:cqSelect.do?cqNo="+vo.getCqNo();
		}
		return "code/error";
	}
	

}

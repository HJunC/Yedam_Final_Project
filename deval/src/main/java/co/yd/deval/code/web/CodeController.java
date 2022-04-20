package co.yd.deval.code.web;

import co.yd.deval.code.service.CodeService;
import co.yd.deval.code.service.CodeVO;
import co.yd.deval.code.service.ReplyService;
import co.yd.deval.code.service.ReplyVO;
import co.yd.deval.comment.service.CommentService;
import co.yd.deval.comment.service.CommentVO;
import co.yd.deval.common.Criteria;
import co.yd.deval.common.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/cq")
public class CodeController {

	private final CodeService codeDAO;
	private final ReplyService replyDAO;
	private final CommentService commentDAO;

	public CodeController(CodeService codeDAO, ReplyService replyDAO, CommentService commentDAO) {
		this.codeDAO = codeDAO;
		this.replyDAO = replyDAO;
		this.commentDAO = commentDAO;
	}

	@GetMapping("/codeList.do")
	public String cqList(Model model, CodeVO vo, Criteria cri) {
		vo.setBoardTypeNo(4);
		vo.setCriteria(cri);
		model.addAttribute("lists", codeDAO.cqList(vo));
		model.addAttribute("type",4);
		model.addAttribute("pageMaker", new PageDTO(cri, codeDAO.getTotalCount(vo)));
		return "code/codeList";
	}
	
	@GetMapping("/questionList.do")
	public String queList(Model model) {
		CodeVO vo = new CodeVO();
		vo.setBoardTypeNo(6);
		model.addAttribute("lists", codeDAO.cqList(vo));
		model.addAttribute("type", vo.getBoardTypeNo());
		return "code/questionList";
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
	public String codeInsertForm(Model model, int type) {
		model.addAttribute("type", type);
		return "code/cqInsertForm";
	}

	@PostMapping("/cqInsert.do")
	public String codeInsert(Model model, CodeVO vo) {
		int type = vo.getBoardTypeNo();
		int r = codeDAO.codeInsert(vo);
		if (r != 0) {
			if(type == 4) {
				return "redirect:codeList.do";
			} else {
				return "redirect:questionList.do";
			}
		} else {
			return "code/error";
		}
	}

	@PostMapping("/cqDelete.do")
	public String codeDelete(Model model, CodeVO vo) {
		vo = codeDAO.cqSelect(vo);
		int type = vo.getBoardTypeNo();
		int r = codeDAO.codeDelete(vo);
		if (r != 0) {
			if(type == 4) {
				return "redirect:codeList.do";
			} else {
				return "redirect:questionList.do";
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
	
	@GetMapping("/reviewInsertForm.do")
	public String reviewInsertForm(int cqNo, Model model) {
		model.addAttribute("cqNo",cqNo);
		return "code/reviewInsertForm";
	}
	
	@PostMapping("/reviewInsert")
	public String reviewInsert(ReplyVO vo) {
		vo.setBoardTypeNo(5);
		replyDAO.replyInsert(vo);
		return "redirect:reviewList.do";
	}
	
	@GetMapping("/reviewUpdateForm.do")
	public String reviewUpdateForm(Model model, ReplyVO vo) {
		model.addAttribute("review",replyDAO.reviewSelect(vo.getCqReplyNo()));
		return "code/reviewUpdateForm";
	}
	
	@PostMapping("/reviewUpdate.do")
	public String reviewUpdate(ReplyVO vo) {
		int r = replyDAO.replyUpdate(vo);
		if(r != 0) {
			return "redirect:reviewSelect.do?cqReplyNo="+vo.getCqReplyNo();
		}
		return "code/error";
	}
	
	@PostMapping("/reviewDelete.do")
	public String reviewDelete(ReplyVO vo) {
		replyDAO.replyDelete(vo.getCqReplyNo());
		return "redirect:reviewList.do";
	}
	
}

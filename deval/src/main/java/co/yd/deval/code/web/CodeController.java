package co.yd.deval.code.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.code.service.CodeService;
import co.yd.deval.code.vo.CodeVO;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/code")
public class CodeController {

	@Autowired
	private CodeService codeDAO;

	@GetMapping("/codeList.do")
	public String codeList(Model model) {
		model.addAttribute("codes", codeDAO.codeSelectList());
		return "code/codeList";
	}

	@PostMapping("/codeSelectOne.do")
	public String codeSelectOne(Model model, CodeVO vo) {
		vo = codeDAO.codeSelectOne(vo);
		if (vo != null) {
			model.addAttribute("code", vo);
			codeDAO.codeHitUp(vo);
			return "code/codeSelectOne";
		}
		return "code/error";
	}

	@GetMapping("/codeInsertForm.do")
	public String codeInsertForm(Model model) {
		return "code/codeInsertForm";
	}

	@GetMapping("/codeInsert.do")
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

}

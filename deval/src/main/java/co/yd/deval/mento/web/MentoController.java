package co.yd.deval.mento.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.vo.MemberVO;
import co.yd.deval.mento.service.MentoService;
import co.yd.deval.mento.vo.MentoVO;

@Controller
@RequestMapping("/mento")
public class MentoController {
	@Autowired
	public MentoService mentoDAO;
	
	@Autowired
	private MemberService memberDao;
	
    @GetMapping("/main.do")
    public String main() {
        return "mento/mentoMain";
    }
    
    @RequestMapping("/mentoList.do")
    public String mentoList(Model model, @RequestParam("lang") String lang, HttpSession session) {
    	//MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	//session.setAttribute("exp", user.getExp());
    	model.addAttribute("mento", mentoDAO.mentoSelectList(lang));
    	return "mento/mentoList";
    }
    
    @GetMapping("/mentoInsertForm.do")
    public String mentoInsertForm() {
    	return "mento/mentoInsertForm";
    }
    
    @PostMapping("/mentoInsert.do")
    public String mentoInsert(Model model, MentoVO mento) {
	//	MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	//	mento.setMentoId(user.getMemberId());
    	mento.setMentoId("micol");
    	
    	int n = mentoDAO.mentoInsert(mento);
    	//model.addAttribute("mento", mentoDAO.mentoSelectList(mento.getLang()));
    	return "redirect:mentoList.do?lang=" + mento.getLang();
    }

}

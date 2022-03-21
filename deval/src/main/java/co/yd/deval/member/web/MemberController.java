package co.yd.deval.member.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberDAO;
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@PostMapping("/login.do")
	public String login(MemberVO vo, HttpSession session, Model model) {
		vo = memberDAO.memberSelect(vo);
		if(vo != null) {
			session.setAttribute("user", vo);
			return "redirect:home.do";
		}
		return "redirect:loginForm.do";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:home.do";
	}
	
	@RequestMapping("/signUpForm.do")
	public String signUpForm() {
		return "member/signUpForm";
	}
	
	@PostMapping("/signUp.do")
	public String signUp(MemberVO vo) {
		int r = memberDAO.memberInsert(vo);
		if (r != 0) {
			return "redirect:loginForm.do";
		}
		return "redirect:signUpForm.do";
		
	}
}

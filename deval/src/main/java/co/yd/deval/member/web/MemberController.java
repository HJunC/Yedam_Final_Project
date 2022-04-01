package co.yd.deval.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberDao;
	
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "member/loginForm";
	}
	

	@RequestMapping("/signUpForm.do")
	public String signUpForm() {
		return "member/signUpForm";
	}
	
	@PostMapping("/signUp.do")
	public String signUp(MemberVO vo) {
		int r = memberDao.memberInsert(vo);
		if (r != 0) {
			return "redirect:loginForm.do";
		}
		return "redirect:signUpForm.do";
		
	}

	@GetMapping("/myPage.do")
	public String myPage(Model model, @AuthenticationPrincipal UserDetails user) {
		MemberVO vo = (MemberVO) user;
		model.addAttribute("member",vo);
		return "member/myPage";
	}

	@GetMapping("/coPage.do")
	public String coPage() {
		return "member/coPage";
	}

}

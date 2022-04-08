package co.yd.deval.member.web;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;
import co.yd.deval.project.service.ProjectService;
import co.yd.deval.setleLog.service.SetleLogService;
import co.yd.deval.setleLog.service.SetleLogVO;
import co.yd.deval.study.service.StudyService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberDao;
	@Autowired
	private ProjectService projectDao;
	@Autowired
	private StudyService studyDao;
	@Autowired
	private SetleLogService setleDAO;
	
	
	@RequestMapping("/loginForm.do")
	public String loginForm(HttpServletRequest request) {
		String referer = (String) request.getHeader("REFERER");
		System.out.println(referer);
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
	public String myPage(Model model, Principal user) {
		MemberVO vo = new MemberVO();
		vo.setMemberId(user.getName());
		model.addAttribute("member",memberDao.memberSelect(vo));
		model.addAttribute("myProjects",projectDao.findProjectImLeader(vo.getMemberId()));
		model.addAttribute("myStudies",studyDao.findStudyImLeader(vo.getMemberId()));
		model.addAttribute("projects",projectDao.findProjectByNo(vo.getMemberId()));
		model.addAttribute("waitProjects",projectDao.findWaitingProject(vo.getMemberId()));
		model.addAttribute("studies",studyDao.findStudyByNo(vo.getMemberId()));
		model.addAttribute("waitStudies",studyDao.findWaitingStudy(vo.getMemberId()));
		return "member/myPage";
	}

	@GetMapping("/coPage.do")
	public String coPage() {
		return "member/coPage";
	}
	
	//포인트 등록
	@PostMapping("/updatePoint.do")
	@ResponseBody
	public void updatePoint(@RequestParam("cashPt") int cashPt, @RequestParam("memberId") String memberId, SetleLogVO svo) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", memberId);
		map.put("cashPt", cashPt);
		int r = memberDao.memberCashUpdate(map);
		if(r != 0) {
			svo.setMemberId(memberId);
			svo.setSetleAmount(cashPt);
			setleDAO.setelLogInsert(svo);
			
		}
	}
	
	
	
	
	
	
	
	
	

}

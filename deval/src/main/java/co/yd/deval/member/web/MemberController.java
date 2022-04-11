package co.yd.deval.member.web;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;
import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectVO;
import co.yd.deval.study.service.StudyService;
import co.yd.deval.study.service.StudyVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberDao;
	@Autowired
	private ProjectService projectDao;
	@Autowired
	private StudyService studyDao;
	@Autowired
	private String uploadPath;
	
	
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
		return "member/myPage";
	}
	
	@PostMapping("/myInfoUpdate.do")
	@ResponseBody
	public ResponseEntity<Integer> myInfoUpdate(MemberVO vo, MultipartFile imgFile){
		String originalName = imgFile.getOriginalFilename();
    	String fileType = originalName.substring(originalName.lastIndexOf(".") + 1, originalName.length());
    	String fileName = UUID.randomUUID().toString() + "." + fileType;
    	String pathName = uploadPath + "profile/" + fileName;
    	File dest = new File(pathName);
    	try {
    		FileCopyUtils.copy(imgFile.getBytes(), dest);
    	} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	vo.setProfileImg(fileName);
    	int r = memberDao.memberUpdate(vo);
    	if (r != 0) {
    		return ResponseEntity.ok().body(1);
    	}
		return ResponseEntity.ok().body(0);
	}
	
	@GetMapping("/myStudies.do")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> myStudies(Principal user) {
		Map<String,Object> map = new HashMap<>();
		map.put("wait", studyDao.findWaitingStudy(user.getName()));
		map.put("study", studyDao.findStudyByNo(user.getName()));
		return ResponseEntity.ok().body(map);
	}
	
	@GetMapping("/myProjects.do")
	@ResponseBody
	public ResponseEntity<List<ProjectVO>> myProjects(Principal user){
		Map<String,Object> map = new HashMap<>();
		map.put("wait", projectDao.findWaitingProject(user.getName()));
		map.put("project", projectDao.findProjectByNo(user.getName()));
		return ResponseEntity.ok().body(null);
	}

	@GetMapping("/coPage.do")
	public String coPage() {
		return "member/coPage";
	}
	
	@PostMapping("/updatePoint.do")
	@ResponseBody
	public void updatePoint(@RequestParam("cashPt") int cashPt, @RequestParam("memberId") String memberId) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", memberId);
		map.put("cashPt", cashPt);
		memberDao.memberCashUpdate(map);
	}
	
	
	
	
	
	
	
	
	
	
	

}

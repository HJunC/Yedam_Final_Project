package co.yd.deval.study.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;
import co.yd.deval.study.service.StudyInfoVO;
import co.yd.deval.study.service.StudyReqVO;
import co.yd.deval.study.service.StudyService;
import co.yd.deval.study.service.StudyVO;

@Controller
@RequestMapping("/study")
public class StudyController {
	
	@Autowired
	private StudyService studyDao;
	
	@Autowired
	private MemberService memberDao;
	
	/* STUDY */
	// 스터디 메인
    @GetMapping("/studyMain.do")
    public String main() {
        return "study/studyMain";
    }
    
    // 스터디 등록폼 호출
    @GetMapping("/addStudy.do")
    public String addStudy() {
        return "study/addStudy";
    }

    // 스터디 등록 기능
    @RequestMapping("/insertStudy.do")
    @ResponseBody
    public String insertStudy(StudyVO vo, Principal user) {
    	// 언어 2개 체크
    	if(vo.getCk_lang()!=null) {
    		if(vo.getCk_lang().length>0) {
    			vo.setLang1(vo.getCk_lang()[0]);
    		}
    		if(vo.getCk_lang().length>1) {
    			vo.setLang2(vo.getCk_lang()[1]);
    		}
    	}

    	vo.setLeaderId(user.getName());
    	int n = studyDao.studyInsert(vo);
    	return Integer.toString(n);
    }
    
    // 스터디 변경폼 호출
    @RequestMapping("/studyUpdateForm.do")
    public String studyUpdateForm(StudyVO vo, Model model) {
    	model.addAttribute("study", studyDao.studySelectNo(vo));
    	return "study/studyUpdateForm";
    }
    
    // 스터디 변경기능
    @PostMapping("/editStudy.do")
    public String editStudy(StudyVO vo) {
    	int n = studyDao.studyUpdate(vo);
    	if (n != 0) {
			/* return "redirect:studySelect.do?studyNo="+vo.getStudyNo(); -> get방식 */ 
    		return "redirect:studyList.do";
    	}
		return "study/studyError";
    }
    
    // 스터디 검색 찾기 -> 전체목록
    @RequestMapping("/studyList.do")
    public String studyList(Model model) {
    	model.addAttribute("study", studyDao.studySelectAll());
    	return "study/studyList";
    }
    
    // 스터디 상세글
    @PostMapping("/studySelect.do")
    public String studySelect(StudyVO vo, Model model) {
		vo = studyDao.studySelectNo(vo);
    	if(vo != null) {
    		model.addAttribute("study", vo);
    		return "study/studySelect";
    	} else {
    		model.addAttribute("message", "게시글존재x");
    		return "study/studytesterr";
    	}
    }
   
    /* Study Modal User Info */
    @RequestMapping("/studyUser.do")
    @ResponseBody
    public StudyInfoVO studySelectUser(StudyInfoVO vo, Model model) {
    	UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	vo.setMemberId(user.getUsername());

    	return studyDao.studySelectUser(vo);
    }
    
    @RequestMapping("/studyUserEdit.do")
    @ResponseBody
    public String studyUserEdit(StudyInfoVO vo, Principal principal) {
    	int n = 1;
    	
    	vo.setMemberId(principal.getName()); //userName = id
    	
    	StudyInfoVO existUser = studyDao.studySelectUser(vo);
    	
    	if(existUser != null) {
    		n = studyDao.studyUserUpdate(vo);
    	} else {
    		n = studyDao.studyUserInsert(vo);
    	}

    	return Integer.toString(n);
    }
    
    
    /* Study Request */
    
    @PostMapping("/studyReqInsert.do")
    @ResponseBody
    public ResponseEntity<StudyReqVO> studyReqInsert(int sno, StudyReqVO rvo, Principal principal) {
    	MemberVO membervo =new MemberVO(); //아이디, 프사
    	membervo.setMemberId(principal.getName());
    	membervo = memberDao.memberSelect(membervo);
    	
    	rvo.setStudyNo(sno);
    	rvo.setMemberId(membervo.getMemberId()); //멤버 아이디
    	rvo.setCollege(rvo.getCollege());
    	rvo.setCareer(rvo.getCareer());
    	rvo.setLicense(rvo.getLicense());
    	rvo.setPresent(rvo.getPresent());
    	rvo.setProfileImg(membervo.getProfileImg()); //프사
    	
    	int r = studyDao.studyTeamMemberInsert(rvo);
    	
    	return ResponseEntity.ok().body(rvo);
    }
    
    @RequestMapping("/studyReqDel.do")
    @ResponseBody
    public ResponseEntity<Integer> studyReqDel(StudyReqVO vo) {
    	
    	int n = studyDao.studyTeamMemberDelete(vo);
    	
    	return ResponseEntity.ok().body(n);
    }
    
    @RequestMapping("/studyReq.do")
    public String studyReq(Model model) {
    	model.addAttribute("study", studyDao.studyReqSelectAll());
    	return "study/studyReq";
    }
    
    @RequestMapping("/studyMember.do")
    public String studyMember(Model model) {
    	//model.addAttribute("", );
    	return "study/studyMember";
    } 
}

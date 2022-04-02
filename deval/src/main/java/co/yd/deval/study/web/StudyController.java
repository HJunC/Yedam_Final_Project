package co.yd.deval.study.web;

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
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.member.service.MemberVO;
import co.yd.deval.study.service.StudyInfoVO;
import co.yd.deval.study.service.StudyService;
import co.yd.deval.study.service.StudyVO;


@Controller
@RequestMapping("/study")
public class StudyController {
	
	@Autowired
	private StudyService studyDao;
	
    @GetMapping("/studyMain.do")
    public String main() {
        return "study/studyMain";
    }
    
    @GetMapping("/addStudy.do")
    public String addStudy() {
        return "study/addStudy";
    }

    @RequestMapping("/insertStudy.do")
    @ResponseBody
    public String insertStudy(StudyVO vo) {

    	if(vo.getCk_lang()!=null) {
    		if(vo.getCk_lang().length>0) {
    			vo.setLang1(vo.getCk_lang()[0]);
    		}
    		if(vo.getCk_lang().length>1) {
    			vo.setLang2(vo.getCk_lang()[1]);
    		}
    	}

    	vo.setLeaderId("popo");
    	int n = studyDao.studyInsert(vo);
    	return Integer.toString(n);
    }
    
    @RequestMapping("/studyUpdateForm.do")
    public String studyUpdateForm(StudyVO vo, Model model) {
    	model.addAttribute("study", studyDao.studySelectNo(vo));
    	return "study/studyUpdateForm";
    }
    
    @PostMapping("/editStudy.do")
    public String editStudy(StudyVO vo) {
    	int n = studyDao.studyUpdate(vo);
    	if (n != 0) {
			/* return "redirect:studySelect.do?studyNo="+vo.getStudyNo(); -> get방식 */ 
    		return "redirect:studyList.do";
    	}
		return "study/studyError";
    }
    
    @RequestMapping("/studyList.do")
    public String studyList(Model model) {
    	model.addAttribute("study", studyDao.studySelectAll());
    	return "study/studyList";
    }
    
    @PostMapping("/studySelect.do")
    public String studySelect(StudyVO vo, Model model) {
		/*
		 * StudyInfoVO ivo = infoDao.getInfo(memberid); model.addAttribute("info",ivo);
		 */
    	
    	vo = studyDao.studySelectNo(vo);
    	if(vo != null) {
    		model.addAttribute("study", vo);
    		return "study/studySelect";
    	} else {
    		model.addAttribute("message", "게시글존재x");
    		return "study/studytesterr";
    	}
    }
   
    // Study User Info
    @RequestMapping("/studyUser.do")
    @ResponseBody
    public StudyInfoVO studySelectUser(StudyInfoVO vo, Model model) {
    	UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	// UserDetails에 id를 추가 필요
    	// user.getUsername() 이 아닌 user.getUserid() 로 변경
    	vo.setMemberId(user.getUsername());

    	return studyDao.studySelectUser(vo);
    }
    
    @RequestMapping("/studyUserEdit.do")
    @ResponseBody
    public String studyUserEdit(StudyInfoVO vo) {
    	int n = 1;
    	UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	// UserDetails에 id를 추가 필요
    	// user.getUsername() 이 아닌 user.getUserid() 로 변경
    	vo.setMemberId(user.getUsername());
    	
    	StudyInfoVO existUser = studyDao.studySelectUser(vo);
    	
    	if(existUser != null) {
    		n = studyDao.studyUserUpdate(vo);
    	} else {
    		n = studyDao.studyUserInsert(vo);
    	}

    	return Integer.toString(n);
    }
}

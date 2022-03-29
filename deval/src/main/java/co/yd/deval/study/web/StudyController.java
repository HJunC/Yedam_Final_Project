package co.yd.deval.study.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    @RequestMapping("/studyList.do")
    public String studyList(Model model) {
    	model.addAttribute("study", studyDao.studySelectAll());
    	return "study/studyList";
    }
    
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

}

package co.yd.deval.mento.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;
import co.yd.deval.mento.service.MentoService;
import co.yd.deval.mento.service.MentoVO;

@Controller
@RequestMapping("/mento")
public class MentoController {
	@Autowired
	private MentoService mentoDAO;
	
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private String uploadPath;
	
    @GetMapping("/main.do")
    public String main() {
        return "mento/mentoMain";
    }
    
    @RequestMapping("/mentoList.do")
    public String mentoList(Model model, @RequestParam("lang") String lang) {
    	//MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	model.addAttribute("mento", mentoDAO.mentoSelectList(lang));
    	return "mento/mentoList";
    }
    
    @GetMapping("/mentoInsertForm.do")
    public String mentoInsertForm() {
    	return "mento/mentoInsertForm";
    }
    
    @PostMapping("/mentoInsert.do")
    public String mentoInsert(MentoVO mento, MultipartFile file) {
		MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	mento.setMentoId(user.getUsername());
    	String originalName = file.getOriginalFilename();
    	String fileType = originalName.substring(originalName.lastIndexOf(".") + 1, originalName.length());
    	String fileName = UUID.randomUUID().toString() + "." + fileType;
    	String pathName = uploadPath + fileName;
    	File dest = new File(pathName);
    	try {
    		FileCopyUtils.copy(file.getBytes(), dest);
    	} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    	mento.setPhoto(fileName);
    	int n = mentoDAO.mentoInsert(mento);
    	return "redirect:mentoList.do?lang=" + mento.getLang();
    }
    
    @GetMapping("/mentoSelect.do")
    public String mentoSelect(Model model, MentoVO vo) {
    	model.addAttribute("mento", mentoDAO.mentoSelectOne(vo));
    	return "mento/mentoSelect";
    }
}


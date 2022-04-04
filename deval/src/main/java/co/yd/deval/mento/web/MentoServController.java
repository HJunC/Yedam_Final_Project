package co.yd.deval.mento.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.member.service.MemberVO;
import co.yd.deval.mento.service.MentoServService;
import co.yd.deval.mento.service.MentoVO;

@Controller
@RequestMapping("/mento")
public class MentoServController {
	@Autowired
	private MentoServService mentoServDAO;
	
	
	@GetMapping("/mentoServChart.do")
	@ResponseBody
	public Map<String,Object> mentoServChart(@RequestParam Map<String,Object> param) {
		String id = (String) param.get("id");
		
		Map<String,Object> satis = new HashMap<String,Object>();
		Double value = mentoServDAO.allSatisAvg();
		Double value2 = mentoServDAO.oneSatisAvg(id);
		
		satis.put("all", value);
		satis.put("one", value2);
		
		return satis;
	}
	
	//멘티 리스트
	@RequestMapping("/mentiCheck.do")
	public String mentiCheckForm(Model model, MentoVO vo) {
		MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String mentoId = user.getMemberId();
		model.addAttribute("price", vo.getPrice());
		model.addAttribute("mentis", mentoServDAO.mentoServList(mentoId, 0));
		return "mento/mentiCheckForm";
	}
	
	@PostMapping("/mentoServInsert.do")
	public void mentoServInsert() {
		
		
	}
	
	//계약 최종성립
	@PostMapping("/mentoServConstract.do")
	public String mentoServUpdate() {
		MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		return "redirect:mentiCheckForm?mento_id=" + user.getMemberId() + "&state=0";
	}
}

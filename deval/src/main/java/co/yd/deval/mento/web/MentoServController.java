package co.yd.deval.mento.web;

import java.util.Calendar;
import java.util.Date;
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
import co.yd.deval.mento.service.MentoServVO;
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
	public String mentoServInsert(MentoServVO service) {
		String getTerm = service.getServiceTerm();
		String term = getTerm.substring(getTerm.length()-1, getTerm.length());
		Date startDate = service.getStartDate();
		int intTerm = Integer.parseInt(getTerm.substring(0,getTerm.length()-1));
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		if(term == "일") {
			cal.add(Calendar.DATE, intTerm);
		}else if(term == "주") {
			cal.add(Calendar.WEEK_OF_MONTH,intTerm);
		}else if(term == "달") {
			cal.add(Calendar.MONTH, intTerm);
		}
		service.setEndDate((java.util.Date) cal.getTime());
		//mentoServDAO.mentoServInsert(service);
		System.out.println(service+ " -------------------");
		System.out.println(term);
		System.out.println(startDate);
		
		System.out.println(cal);
		return "mento/mentoSuccess";
	}
	
	//계약 최종성립
	@PostMapping("/mentoServConstract.do")
	public String mentoServUpdate() {
		MemberVO user = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		return "redirect:mentiCheckForm?mento_id=" + user.getMemberId() + "&state=0";
	}
	
	//서비스창 결제하기
	@PostMapping("/mentoPayment.do")
	@ResponseBody
	public String mentoPayment(int cashPt, String memberId) {
		Map<String,Object> buyer = new HashMap<>(); 
		
		//회원 캐쉬포인트 차감
		buyer.put("cashPt", cashPt);
		buyer.put("memberId", memberId);
		
		int r = mentoServDAO.buyerPayment(buyer);
		//신청완료창으로 return
		if(r != 0 ) {
			return "success";
		}else {
			return "fail";
		}
	}
}

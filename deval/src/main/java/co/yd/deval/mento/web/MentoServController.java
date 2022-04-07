package co.yd.deval.mento.web;


import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.member.service.MemberVO;
import co.yd.deval.mento.service.MentoServService;
import co.yd.deval.mento.service.MentoServVO;
import co.yd.deval.mento.service.MentoVO;
import co.yd.deval.tradeLog.service.TradeLogService;
import co.yd.deval.tradeLog.service.TradeLogVO;

@Controller
@RequestMapping("/mento")
public class MentoServController {
	@Autowired
	private MentoServService mentoServDAO;
	@Autowired
	private TradeLogService tradeDAO;
	
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
	public String mentiCheckForm(Model model, MentoVO vo, Principal principal) {
		MemberVO user = new MemberVO();
		
		if(principal != null) {
			user.setMemberId(principal.getName());
		}
		String mentoId = user.getMemberId();
		model.addAttribute("mentis", mentoServDAO.mentoServList(mentoId));
		return "mento/mentiCheck";
	}
	
	@PostMapping("/mentoServInsert.do")
	public String mentoServInsert(MentoServVO service,TradeLogVO trade) {
		int n = mentoServDAO.mentoServInsert(service);
		if(n != 0) {
			trade.setBuyer(service.getMentiId());
			trade.setSeller(service.getMentoId());
			tradeDAO.insertTradeLog(trade);
			return "mento/mentoSuccess";
		}else {
			return "notFoundPage";
		}
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
	//서비스 거절check.do
	@PostMapping("/mentoServDeleto.do")
	public void mentoServDelete(int mentoServiceNo) {
		int n = mentoServDAO.mentoServDelete(mentoServiceNo);
	}
	
	@PostMapping("/serviceRefuse.do")
	@ResponseBody
	public int serviceRefuse(int mentoServiceNo) {
		System.out.println(mentoServiceNo + "dddddddddddddddddddddddddddd");
		int n = mentoServDAO.mentoServUpdate(mentoServiceNo);
		
		return n;
	}
	
	@PostMapping("/serviceAccept.do")
	@ResponseBody
	public String serviceAccept(@RequestBody List<MentoServVO> vo) {
		
		int n = mentoServDAO.mentoServAccept(vo);
		if (n != 0) {
			return "서비스가 성공적으로 되었습니다";
		} else {
			return "실패!";
		}
	
	
	
	}
}

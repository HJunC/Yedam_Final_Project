package co.yd.deval.mento.web;


import java.security.Principal;
import java.util.Calendar;
import java.util.Date;
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

import co.yd.deval.chat.service.ChatRoomService;
import co.yd.deval.chat.service.ChatRoomVO;
import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;
import co.yd.deval.mento.service.MentoServService;
import co.yd.deval.mento.service.MentoServVO;
import co.yd.deval.mento.service.MentoService;
import co.yd.deval.mento.service.MentoVO;
import co.yd.deval.mento.service.TestService;
import co.yd.deval.tradeLog.service.TradeLogService;
import co.yd.deval.tradeLog.service.TradeLogVO;

@Controller
@RequestMapping("/mento")
public class MentoServController {
	@Autowired
	private MentoServService mentoServDAO;
	@Autowired
	private TradeLogService tradeDAO;
	@Autowired
	private TestService testDAO;
	@Autowired
	private MemberService memberDao;
	@Autowired
	private ChatRoomService chatRoomDAO;
	@Autowired
	private MentoService mentoDAO;
	
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
	
	//거절시 환불 
	@PostMapping("/serviceRefuse.do")
	@ResponseBody
	public int serviceRefuse(int mentoServiceNo, String memberId, int cashPt, int tradeLogNo) {
		System.out.println(mentoServiceNo + "dddddddddddddddddddddddddddd");
		int n = mentoServDAO.mentoServUpdate(mentoServiceNo);
		if(n != 0) {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("memberId", memberId);
			map.put("cashPt", cashPt);
			memberDao.refund(map);
			tradeDAO.updateRefuse(tradeLogNo);
		}
		return n;
	}
	
	@RequestMapping("/serviceAccept.do")
	@ResponseBody
	public String serviceAccept(@RequestBody List<MentoServVO> list) {
		int count = 0;
		for(MentoServVO vo : list) {
			//수락할려고 하는 서비스에 대해 가능한지 확인
			int n = testDAO.timeCheck(vo);
			System.out.println(vo);
			if(n == 0) {
				//수락시 피블 + 1
				mentoDAO.mentoUpdate(vo.getMentoId());
				//수락시 채팅방 생성
				ChatRoomVO chatVo = new ChatRoomVO();
				chatVo.setOwnerId(vo.getMentoId());
				chatVo.setEntryId(vo.getMentiId());
				chatRoomDAO.makeChatRoom(chatVo);
				// tradeLog 상태 변경 '처리전'-> '처리중'
				tradeDAO.AcceptTradeLog(vo.getTradeLogNo());
				//해당 서비스의 시작날짜 부터 종료날짜까지 for문을 돌립니다.
				for(Date sDate = vo.getStartDate(); sDate.before(datePuls(vo.getEndDate(), 1)); sDate = datePuls(sDate, 1)) {
					//해당 서비스의 선택날짜의 시작시간 부터 종료시간까지 for문을 돌립니다.
					for(int sTime = vo.getStartTm(); sTime <= vo.getEndTm(); sTime +=1) {
						//해당 서비스의 선택날짜의 선택시간 -> DB의 한 row
						MentoServVO temp = new MentoServVO();
						//해당 서비스의 멘토와 멘티 정보를 복사
						temp.setMentoId(vo.getMentoId());
						temp.setMentiId(vo.getMentiId());
						//해당 서비스의 선택날짜 입력
						temp.setStartDate(sDate);
						//해당 서비스의 선택시간 입력
						temp.setStartTm(sTime);
						
						//해당 서비스의 정보를 이용하여 DB에 입력
						testDAO.insertMentoring(temp);
						
						count++;
					}
				}
				if(n != 0) {
					list.remove(vo);
				}

			}
		}
		
		
		if (count > 0) {
			mentoServDAO.mentoServAccept(list);
			return "서비스가 성공적으로 되었습니다";
		} else {
			return "시간 또는 기간이 겹칩니다!";
		}
	
	}
	
	Date datePuls(Date date, int days) {
		Calendar cal = Calendar.getInstance();
		
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		
		return cal.getTime();
	}
	
	
	
}

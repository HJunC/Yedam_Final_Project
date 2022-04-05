package co.yd.deval.trade.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.trade.service.TradeService;
import co.yd.deval.trade.service.TradeVO;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/trade")
public class TradeController {

	@Autowired
	private TradeService tradeDAO;
	
	@GetMapping("/tradeList.do")
	public String tradeList(Model model) {
		model.addAttribute("trades", tradeDAO.tradeList());
		return "trade/tradeList";
	}
	
	@PostMapping("/tradeSelectOne.do")
	public String tradeSelectOne(Model model, TradeVO vo) {
		vo = tradeDAO.tradeSelectOne(vo);
		if(vo != null) {
			model.addAttribute("trade", vo);
			tradeDAO.tradeHitUp(vo);
			return "trade/tradeSelectOne";
		}
		return "trade/error";
	}
	
	@GetMapping("/tradeInsertForm.do")
	public String tradeInsertForm(Model model) {
		return "trade/tradeInsertForm";
	}
	
	@PostMapping("/tradeInsert.do")
	public String tradeInsert(Model model, TradeVO vo) {
		int r = tradeDAO.tradeInsert(vo);
		if(r != 0) {
			model.addAttribute("trade", tradeDAO.tradeSelectOne(vo));
			return "trade/tradeSelectOne";
		}
		return "trade/error";
	}
	
	@GetMapping("/tradeDelete.do")
	public String tradeDelete(Model model, TradeVO vo) {
			int r = tradeDAO.tradeDelete(vo);
			if(r != 0) {
				return "redirect:tradeList.do";
			}
		return "trade/error";
	}
	
	@GetMapping("/tradeUpdateForm.do")
	public String tradeUpdateForm(Model model, TradeVO vo) {
		vo = tradeDAO.tradeSelectOne(vo);
		if(vo != null) {
			model.addAttribute("trade", vo);
			return "trade/tradeUpdateForm";
		}
		return "trade/error";
	}
	
	@PostMapping("/tradeUpdate.do")
	public String tradeUpdate(Model model, TradeVO vo) {
		int r = tradeDAO.tradeUpdate(vo);
		if(r != 0) {
			model.addAttribute("trade", vo);
			tradeDAO.tradeSelectOne(vo);
			return "trade/tradeSelectOne";
		}
		return "trade/error";
	}
	
}

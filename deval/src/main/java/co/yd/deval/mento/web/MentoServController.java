package co.yd.deval.mento.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.mento.service.MentoServService;

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
	
	@GetMapping("/mentiCheck.do")
	public String mentiCheck() {
		
		return "mento/mentiCheck";
	}
	
}

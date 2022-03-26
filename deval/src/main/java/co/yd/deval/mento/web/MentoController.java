package co.yd.deval.mento.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mento")
public class MentoController {

    @GetMapping("/main.do")
    public String main() {
        return "mento/mentoMain";
    }
    
    @GetMapping("/mentoList.do")
    public String mentoList() {
    	return "mento/mentoList";
    }

}

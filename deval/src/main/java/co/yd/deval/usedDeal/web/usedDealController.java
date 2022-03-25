package co.yd.deval.usedDeal.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class usedDealController {

    @GetMapping("/usedDeal.do")
    public String usedDeal() {
        return "board/usedDeal";
    }

}

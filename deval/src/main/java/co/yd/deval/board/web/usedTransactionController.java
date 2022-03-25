package co.yd.deval.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class usedTransactionController {

    @GetMapping("/usedTransaction.do")
    public String usedTransaction() {
        return "board/usedTransaction";
    }

}

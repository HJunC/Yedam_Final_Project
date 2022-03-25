package co.yd.deval.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/free.do")
    public String free() {
        return "board/free";
    }

    @GetMapping("/notice.do")
    public String notice() {
        return "board/notice";
    }

    @GetMapping("/technical.do")
    public String technical() {
        return "board/technical";
    }
    
    @GetMapping("/write.do")
    public String write() {
    	return "board/write";
    }

}

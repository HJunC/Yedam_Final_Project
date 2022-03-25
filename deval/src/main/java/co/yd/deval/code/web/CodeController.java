package co.yd.deval.code.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/code")
public class CodeController {

    @GetMapping("/shared.do")
    public String shared() {
        return "code/shared";
    }

    @GetMapping("/review.do")
    public String review() {
        return "code/review";
    }

    @GetMapping("/question.do")
    public String question() {
        return "code/question";
    }

    @GetMapping("/answer.do")
    public String answer() {
        return "code/answer";
    }

}

package co.yd.deval.study.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/study")
public class StudyController {

    @GetMapping("/main.do")
    public String main() {
        return "study/studyMain";
    }

    @GetMapping("/addStudy.do")
    public String addStudy() {
        return "study/addStudy";
    }

}

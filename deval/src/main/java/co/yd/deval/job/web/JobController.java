package co.yd.deval.job.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/job")
public class JobController {

    @GetMapping("main.do")
    public String main() {
        return "job/jobMain";
    }

}

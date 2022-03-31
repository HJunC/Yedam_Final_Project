package co.yd.deval.project.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/project")
public class RestProjectController {

    @GetMapping("/api/search")
    public String searchApi() {
        return "1";
    }

}

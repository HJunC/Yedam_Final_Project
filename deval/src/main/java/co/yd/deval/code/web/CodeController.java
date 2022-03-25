package co.yd.deval.code.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/code")
public class CodeController {

	@GetMapping("/codeList.do")
	public String shared() {
		return "code/codeList";
	}
}

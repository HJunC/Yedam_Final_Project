package co.yd.deval;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
* @package : co.yd.deval
* @name : HomeController.java
* @date : 2022-04-02 오전 1:12
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed : ByungHo Park
**/
@Controller
public class HomeController {
	
	
	public String mainPage() {
		return "home/home";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return mainPage();
	}
	
	@RequestMapping("/home.do")
	public String main() {
		return mainPage();
	}
	
	
	
}

package co.yd.deval;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.yd.deval.chat.service.ChatRoomService;

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
	@Autowired
	private ChatRoomService chatRoomDAO;
	
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
	
	@RequestMapping("/chat.do")
	public String chat() {
		return "chat/chat";
	}
	@GetMapping("/chatList.do")
	public String chatList(Model model, Principal principal) { 
		
		model.addAttribute("list", chatRoomDAO.selectListChat(principal.getName()));
		
		return "chat/chatList";
	}
	
}

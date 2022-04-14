package co.yd.deval.chat.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.chat.service.ChatLogService;
import co.yd.deval.chat.service.ChatRoomService;
import co.yd.deval.member.service.MemberVO;

@Controller
public class ChatController {
	@Autowired
	private ChatRoomService chatRoomDAO;
	
	@Autowired
	private ChatLogService chatLogDAO;
	
	@RequestMapping("/chatSelect.do")
	public String chat(int roomId, Model model, Principal principal) {
		model.addAttribute("roomId", roomId);
		MemberVO user = new MemberVO();
		if(principal != null) {
			user.setMemberId(principal.getName());
			System.out.println(user.getMemberId());
		}
		
		model.addAttribute("userId", user.getMemberId());
		model.addAttribute("chats", chatLogDAO.selectChat(roomId));
		return "chat/chat";
	}
	
	@GetMapping("/chatList.do")
	public String chatList(Model model, Principal principal) { 
		
		model.addAttribute("list", chatRoomDAO.selectListChat(principal.getName()));
		
		return "chat/chatList";
	}
}

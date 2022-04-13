package co.yd.deval.study.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class chatController {
	
    // 채팅방 컨트롤러
    public class ChatController {
    	@RequestMapping(value = "/chat.do", method = { RequestMethod.GET })
    	public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
    		return "study/chat";
    	}
    }

}

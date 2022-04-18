package co.yd.deval.study.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.chat.service.ChatRoomService;
import co.yd.deval.chat.service.ChatRoomVO;

@Controller
public class studyChatController {

	/*
	 * @Autowired private ChatRoomService chatRoomService;
	 */
	 // 채팅 서비스
		/*
		 * @RequestMapping("/studyChat.do")
		 * public String studyChat(Model model,
		 * Principal User, StudyVO vo, StudyReqVO rvo){
		 * ChatRoomVO chatVO = new ChatRoomVO();
		 * 
		 * chatVO = chatRoomDao.selectChatRoom(chatVO.getRoomId());
		 * 
		 * // if 스터디 방 번호가 없을 경우 insert
		 * if (chatVO == null) {
		 * chatVO.setOwnerId(User.getName());
		 * chatVO.setEntryId(rvo.getMemberId());
		 * chatRoomDao.makeChatRoom(chatVO);
		 * } else {
		 * // else 스터디 방 번호가 있을 경우 스터디 채팅방을 불러온다
		 * chatRoomDao.selectChatRoom(chatVO.getRoomId()); }
		 * 
		 * // studyReq 신청자페이지, studyMember 그룹원페이지, studySelect 상세글 페이지 // 버튼 적용
		 * 
		 * return "chat/chat"; }
		 */
	    
	    // 채팅
//	    @RequestMapping("/studyChat.do")
//	    @ResponseBody
//	    public String studyChat(Principal User, ChatRoomVO vo) {
//	    	System.out.println("==================================== " + vo.getOwnerId());
//	    	System.out.println("==================================== " + User.getName());
//
//	    	vo.setEntryId(User.getName());
//
//	    	//ChatRoomVO chatVO = new ChatRoomVO();
//	    	//chatVO.setOwnerId(vo.getOwnerId());
//	    	//chatVO.setEntryId(User.getName());
//	    	
//	      	//ChatRoomService chatRoomDao = null; 
//	    	chatRoomService.makeChatRoom(vo);
//	    	
//	    	return "1";
//	    }
}

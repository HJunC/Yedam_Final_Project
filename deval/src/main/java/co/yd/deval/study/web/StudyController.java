package co.yd.deval.study.web;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yd.deval.chat.service.ChatLogService;
import co.yd.deval.chat.service.ChatRoomService;
import co.yd.deval.chat.service.ChatRoomVO;
import co.yd.deval.common.Criteria;
import co.yd.deval.common.PageDTO;
import co.yd.deval.member.service.MemberService;
import co.yd.deval.member.service.MemberVO;
import co.yd.deval.study.service.StudyInfoVO;
import co.yd.deval.study.service.StudyReqVO;
import co.yd.deval.study.service.StudyService;
import co.yd.deval.study.service.StudyTeamVO;
import co.yd.deval.study.service.StudyVO;

@Controller
@RequestMapping("/study")
public class StudyController {
	@Autowired
	private StudyService studyDao;
	
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private StudyMailSender mail;
	
	@Autowired
	private ChatRoomService chatRoomDAO;
	
	@Autowired
	private ChatLogService chatLogDAO;
	
	/* STUDY MAIN */
	// 스터디 메인
    @GetMapping("/studyMain.do")
    public String main(StudyVO vo, StudyReqVO rvo, Model model, Principal User) {
    	if(User != null) {
	    	model.addAttribute("study", studyDao.studyLeaderBtn(User.getName()));
	    	model.addAttribute("member", User);
	    	model.addAttribute("list", studyDao.studyUnfinedTeamBtn(User.getName()));
    	}

        return "study/studyMain";
    }
    
    // 스터디 등록폼 호출
    @GetMapping("/addStudy.do")
    public String addStudy() {
        return "study/addStudy";
    }

    // 스터디 등록 기능
    @RequestMapping("/insertStudy.do")
    @ResponseBody
    public String insertStudy(StudyVO vo, StudyReqVO reqvo, StudyInfoVO invo, Principal user, HttpSession session) {
    	
    	int n = 0;
    	invo.setMemberId(user.getName());
    	invo = studyDao.studySelectUser(invo);
    	// 언어 2개 체크
    	if(vo.getCk_lang()!=null) {
    		if(vo.getCk_lang().length>0) {
    			vo.setLang1(vo.getCk_lang()[0]);
    		}
    		if(vo.getCk_lang().length>1) {
    			vo.setLang2(vo.getCk_lang()[1]);
    		}
    	}
    	
    	vo.setLeaderId(user.getName());
    	n = studyDao.studyInsert(vo);
    	
    	if(n != 0) {
    		reqvo.setMemberId(user.getName());
    		reqvo.setStudyNo(studyDao.findMaxStudyNo());
    		reqvo.setCareer(invo.getCareer());
    		reqvo.setCollege(invo.getCollege());
    		reqvo.setLicense(invo.getLicense());
    		reqvo.setPresent(invo.getPresent());
    		n = studyDao.studyTeamLeaderInsert(reqvo);
    	}
    	return Integer.toString(n);
    }
    
    // 스터디 변경폼 호출
    @RequestMapping("/studyUpdateForm.do")
    public String studyUpdateForm(StudyVO vo, Model model) {
    	model.addAttribute("study", studyDao.studySelectNo(vo));
    	return "study/studyUpdateForm";
    }
    
    // 스터디 변경기능
    @PostMapping("/editStudy.do")
    public String editStudy(StudyVO vo) {
    	
    	if(vo.getCk_lang()!=null) {
    		if(vo.getCk_lang().length>0) {
    			vo.setLang1(vo.getCk_lang()[0]);
    		}
    		if(vo.getCk_lang().length>1) {
    			vo.setLang2(vo.getCk_lang()[1]);
    		}
    	}
    	int n = studyDao.studyUpdate(vo);
    	if (n != 0) {
			return "redirect:studyList.do";
    	}
		return "study/studyError";
    }
    
    // 스터디 검색 찾기 -> 전체목록
    @GetMapping("/studyList.do")
    public String studyList(StudyVO vo, Model model, Principal User, Criteria cri) {
    	// 페이지 처리
    	if (cri.getPageNum() == 0) cri.setPageNum(1);
        if (cri.getAmount() == 0) cri.setAmount(10);
    	vo.setCriteria(cri);
    	if (vo.getStudyNm() != null) {
    		vo.setStudyNm(vo.getStudyNm().trim());
    	}
    	model.addAttribute("study", studyDao.getListWithPaging(vo));
    	model.addAttribute("pageMaker", new PageDTO(cri, studyDao.getTotalCount(vo)));
    	model.addAttribute("list", studyDao.studyMemberFind(User.getName()));
    	model.addAttribute("studyfind", vo);
    	model.addAttribute("member", User);
    	return "study/studyList";
    }
    
    // 스터디 지역 찾기 (지도사용)
    @GetMapping("/locationList.do")
    @ResponseBody
    public List<StudyVO> locationList(StudyVO vo) {
    	return studyDao.studyLocSearch(vo.getLocation());
    }
    
    // 스터디 상세글
    @GetMapping("/studySelect.do")
    public String studySelect(StudyVO vo, StudyReqVO rvo, Model model, Principal User) {
		vo = studyDao.studySelectNo(vo);
		List<StudyReqVO> list = studyDao.teamAllMember(rvo);
		System.out.println("=============================="+list);
    	if(vo != null) {
    		model.addAttribute("study", vo);
    		model.addAttribute("studyreq", list);
    		model.addAttribute("member", User);
    		model.addAttribute("list", studyDao.studyMemberFind(User.getName()));
    		return "study/studySelect";
    	} else {
    		model.addAttribute("message", "게시글존재x");
    		return "study/studytesterr";
    	}
    }
   
    /* Study Modal User Info */
    @RequestMapping("/studyUser.do")
    @ResponseBody
    public StudyInfoVO studySelectUser(StudyInfoVO vo, Model model) {
    	UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	vo.setMemberId(user.getUsername());

    	return studyDao.studySelectUser(vo);
    }
    
    @RequestMapping("/studyUserEdit.do")
    @ResponseBody
    public String studyUserEdit(StudyInfoVO vo, Principal principal) {
    	int n = 1;
    	
    	vo.setMemberId(principal.getName()); //userName = id
    	
    	StudyInfoVO existUser = studyDao.studySelectUser(vo);
    	
    	if(existUser != null) {
    		n = studyDao.studyUserUpdate(vo);
    	} else {
    		n = studyDao.studyUserInsert(vo);
    	}

    	return Integer.toString(n);
    }
    
    
    /* Study Request */
    @PostMapping("/studyReqInsert.do")
    @ResponseBody
    public ResponseEntity<StudyReqVO> studyReqInsert(int sno, StudyReqVO rvo, Principal principal) {
    	MemberVO membervo =new MemberVO(); //아이디, 프사
    	membervo.setMemberId(principal.getName());
    	membervo = memberDao.memberSelect(membervo);
    	
    	rvo.setStudyNo(sno);
    	rvo.setMemberId(membervo.getMemberId()); //멤버 아이디
    	rvo.setCollege(rvo.getCollege());
    	rvo.setCareer(rvo.getCareer());
    	rvo.setLicense(rvo.getLicense());
    	rvo.setPresent(rvo.getPresent());
    	rvo.setProfileImg(membervo.getProfileImg()); //프사
    	
    	int r = studyDao.studyTeamMemberInsert(rvo);
    	
    	return ResponseEntity.ok().body(rvo);
    }
    
    @RequestMapping("/studyReqDel.do")
    @ResponseBody
    public ResponseEntity<Integer> studyReqDel(StudyReqVO vo) {
    	int n = studyDao.studyTeamMemberDelete(vo);
    	
    	return ResponseEntity.ok().body(n);
    }
    
	 @RequestMapping("/studyReqRefuse.do")
	 @ResponseBody
	 public ResponseEntity<Integer> studyReqRefuse(StudyReqVO vo, StudyVO svo) throws Exception {
		 int n = studyDao.studyTeamMemberUpdateRefuse(vo);
		 svo.setStudyNo(vo.getStudyNo());
		 svo = studyDao.studySelectNo(svo);
		 if (n != 0) {
			 mail.sendMailTest(memberDao.memberMailGet(vo.getMemberId()),0,vo.getMemberId(),vo.getStudyNo(), svo.getStudySdt(), svo.getStudyEdt());
		 }
		 
		 return ResponseEntity.ok().body(n);
	 }
	 
	 @RequestMapping("/studyReqAccept.do")
	 @ResponseBody
	 public ResponseEntity<Integer> studyReqAccept(StudyReqVO rvo, StudyVO vo) throws Exception {
		 		 
		 vo.setStudyNo(rvo.getStudyNo());
		 vo = studyDao.studySelectNo(vo);
		 
		 if(vo.getRcnt() == vo.getMaxRcnt()) {
			 int r = studyDao.studyEnd(vo);
			 
			 if(r != 0) {
				 studyDao.studyTeamMemberDelete(rvo);
			 }
			 return ResponseEntity.ok().body(0);
			 
		 } else {
			 studyDao.rcntMember(vo);
			 int n= studyDao.studyTeamMemberUpdateAccept(rvo);
			  if(vo.getRcnt()+1 == vo.getMaxRcnt()) {
				  
				  int r = studyDao.studyEnd(vo);
				  
				  if(r != 0) {
						 studyDao.studyTeamMemberDelete(rvo);
					 }
			  }
			 
			 // 메일발송 시간 지연으로 인해 디자인 로딩창 넣기
			 if (n != 0) {
				 mail.sendMailTest(memberDao.memberMailGet(rvo.getMemberId()),1,rvo.getMemberId(),vo.getStudyNo(), vo.getStudySdt(), vo.getStudyEdt());
			 }
			 return ResponseEntity.ok().body(n);
		 }
	 }
    
    @RequestMapping("/studyReq.do")
    public String studyReq(StudyVO vo, StudyReqVO rvo, Model model, Principal User) {
    	model.addAttribute("study", studyDao.studyLeaderReqPage(User.getName()));
    	
    	return "study/studyReq";
    }
    
    @RequestMapping("/studyMember.do")
    public String studyMember(Model model, Principal User) {
    	List<StudyTeamVO> list = studyDao.studyTeamMember(User.getName());
    	if (!list.isEmpty()) {
    		model.addAttribute("study", list);
    		StudyVO vo = new StudyVO();
    		vo.setStudyNo(list.get(0).getStudyNo());
        	model.addAttribute("leaderId", studyDao.studySelectNo(vo));
        	model.addAttribute("user", User.getName());
    	}
    	return "study/studyMember";
    }
    
    
    /* Chat Service */
    
    @RequestMapping("/chatForm.do")
    public String chatStudy(Model model,int roomId, Principal user) {
    	model.addAttribute("roomId",roomId);
    	model.addAttribute("userId",user.getName());
    	model.addAttribute("chats", chatLogDAO.selectChat(roomId));
    	return "chat/chat";
    }
    
    
    @RequestMapping("/studyChat.do")
    @ResponseBody
    public int studyChat(Principal User, ChatRoomVO vo) {
    	System.out.println("==================================== " + vo.getOwnerId());	// 화면에서 가져오는
    	System.out.println("==================================== " + User.getName());	// 로그인
    	
    	vo.setEntryId(User.getName());	// 값 세팅
    	
    	// 채팅이 존재하는가 존재하지 않는가
    	ChatRoomVO cvo = chatRoomDAO.selectChat(vo);
    	
    	if(cvo == null){
    		// 새로운 채팅 만들기
    		chatRoomDAO.makeChatRoom(vo);
    		return vo.getRoomId();
    	}
    	return cvo.getRoomId();
    }
    
    @RequestMapping("/studyReqMemberChat.do")
    @ResponseBody
    public int studyReqMemberChat(Principal User, ChatRoomVO vo) {
    	System.out.println("==================================== " + vo.getEntryId());	// 화면에서 가져오는
    	System.out.println("==================================== " + User.getName());	// 로그인
    	
    	vo.setOwnerId(User.getName());	// 값 세팅
    	
    	// 채팅이 존재하는가 존재하지 않는가
    	ChatRoomVO cvo = chatRoomDAO.selectChat(vo);
    	
    	if(cvo == null){
    		// 새로운 채팅 만들기
    		chatRoomDAO.makeChatRoom(vo);
    		return vo.getRoomId();
    	}
    	return cvo.getRoomId();
    }
    
    @PostMapping("/studyPause")
    @ResponseBody
    public int studyPause(StudyVO vo) {
    	int r = studyDao.studyPause(vo);
    	return r;
    }
    
    @PostMapping("/studyRestart")
    @ResponseBody
    public int studyRestart(StudyVO vo) {
    	int r = studyDao.studyRestart(vo);
    	return r;
    }
    
    @PostMapping("/studyteambye")
    @ResponseBody
    public int studyteambye(StudyReqVO vo) {
    	int no = vo.getStudyNo();
    	int r = studyDao.studyTeamDel(vo);
    	
    	if (r != 0) {
    		studyDao.minusRcnt(no);
    	}
    	return r;
    }
    
    @GetMapping("/infochecking")
    @ResponseBody
    public int infochecking(Principal user) {
    	int r = studyDao.addInfoCheck(user.getName());
    	return r;
    }
    
   // 디자인 테스트
    @RequestMapping("/designList.do")
    public String designList(Model model) {
    	
    	return "study/designList";
    }
    
    @RequestMapping("/test.do")
    public String test(Model model) {
    	
    	return "study/test";
    }
    
}

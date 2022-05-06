package co.yd.deval;


import co.yd.deval.board.service.BoardService;

import co.yd.deval.board.service.BoardVO;
import oracle.jdbc.proxy.annotation.Post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
* @package : co.yd.deval
* @name : HomeController.java
* @date : 2022-04-02 �삤�쟾 1:12
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed : ByungHo Park
**/
@Controller
public class HomeController {
	
	private final BoardService boardDao;

	public HomeController(BoardService boardDao) {
		this.boardDao = boardDao;
	}

	public String mainPage(Model model) {
		List<BoardVO> boardVOList =  boardDao.getMainPageList();
		List<BoardVO> noticeList = new ArrayList<>();
		List<BoardVO> techList = new ArrayList<>();
		List<BoardVO> codeList = new ArrayList<>();
		for (BoardVO vo : boardVOList) {
			switch (vo.getBoardTypeNo()) {
				case 1:
					noticeList.add(vo);
					break;
				case 3:
					techList.add(vo);
					break;
				case 4:
					codeList.add(vo);
					break;
			}
		}
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("techList", techList);
		model.addAttribute("codeList", codeList);
		return "home/home";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		return mainPage(model);
	}
	
	@RequestMapping("/home.do")
	public String main(Model model) {
		return mainPage(model);
	}
	
	@GetMapping("/notFoundPage.do")
	public String notFoundPage() {
		return "notFoundPage";
	}
	
	
}

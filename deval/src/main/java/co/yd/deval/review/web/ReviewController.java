package co.yd.deval.review.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.code.service.CodeVO;
import co.yd.deval.review.service.ReviewService;
import co.yd.deval.review.service.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewDAO;
	
	@GetMapping("/reviewSelectList.do")
	public String reviewSelectList(Model model, CodeVO cvo) {
		ReviewVO rvo = new ReviewVO();
		rvo.setCqNo(cvo.getCqNo());
		model.addAttribute("reviews", reviewDAO.reviewSelectList(rvo));
		return "review/reviewList";
	}
	
	@PostMapping("/reviewInsertForm.do")
	public String reviewInsertForm(Model model, ReviewVO vo) {
		model.addAttribute("review", reviewDAO.reviewSelectList(vo));
		return "review/reviewInsertForm";
	}
	
	@PostMapping("/reviewInsert.do")
	public String reviewInsert(Model model, ReviewVO vo) {
		int r = reviewDAO.reviewInsert(vo);
		if (r != 0) {
			return "redirect:reviewSelectList.do";
		}
		return "review/error";
	}
	
}

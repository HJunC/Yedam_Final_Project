package co.yd.deval.review.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yd.deval.code.vo.CodeVO;
import co.yd.deval.review.service.ReviewService;
import co.yd.deval.review.service.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewService reviewDAO;
	
	@GetMapping("/reviewSelectList.do")
	public String reviewSelectList(Model model, CodeVO vo) {
		ReviewVO vo2 = new ReviewVO();
		vo2.setCqNo(vo.getCqNo());
		model.addAttribute("reviews", reviewDAO.reviewSelectList(vo2));
		return "review/reviewList";
	}
}

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
		model.addAttribute("cqno", cvo.getCqNo());
		return "review/reviewList";
	}

	@PostMapping("/reviewSelectOne.do")
	public String reviewSelectOne(Model model, ReviewVO vo) {
		vo = reviewDAO.reviewSelectOne(vo);
		if (vo != null) {
			model.addAttribute("review", vo);
			reviewDAO.reviewHitUp(vo);
			return "review/reviewSelectOne";
		}
		return "review/error";
	}

	@PostMapping("/reviewInsertForm.do")
	public String reviewInsertForm(Model model, int cqNo) {
		ReviewVO vo = new ReviewVO();
		vo.setCqNo(cqNo);
		model.addAttribute("review", reviewDAO.cqNoSelect(vo));
		System.out.println("==========================페이지 이동" + vo.getCqNo());
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

	@GetMapping("/reviewDelete.do")
	public String reviewDelete(Model model, ReviewVO vo) {
		int no = vo.getCqNo();
		int r = reviewDAO.reviewDelete(vo);
		if (r != 0) {

			return "redirect:reviewSelectList.do?cqNo=" + no;
		}
		return "review/error";
	}

	@GetMapping("/reviewUpdateForm.do")
	public String reviewUpdateForm(Model model, ReviewVO vo) {
		vo = reviewDAO.reviewSelectOne(vo);
		if (vo != null) {
			model.addAttribute("review", vo);
			return "review/reviewUpdateForm";
		}
		return "review/error";
	}

	@GetMapping("/reviewUpdate.do")
	public String reviewUpdate(Model model, ReviewVO vo) {
		int r = reviewDAO.reviewUpdate(vo);
		if (r != 0) {
			model.addAttribute("review", vo);
			reviewDAO.reviewSelectOne(vo);
			return "review/reviewSelectOne";
		}
		return "review/error";
	}
}

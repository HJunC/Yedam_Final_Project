package co.yd.deval.review.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.review.mapper.ReviewMapper;
import co.yd.deval.review.service.ReviewService;
import co.yd.deval.review.service.ReviewVO;

@Repository("reviewDAO")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper map;
	
	@Override
	public List<ReviewVO> reviewSelectList(ReviewVO vo) {
		return map.reviewSelectList(vo);
	}

	@Override
	public ReviewVO reviewSelectOne(ReviewVO vo) {
		return map.reviewSelectOne(vo);
	}

	@Override
	public int reviewInsert(ReviewVO vo) {
		return map.reviewInsert(vo);
	}

	@Override
	public int reviewUpdate(ReviewVO vo) {
		return map.reviewUpdate(vo);
	}

	@Override
	public int reviewDelete(ReviewVO vo) {
		return map.reviewDelete(vo);
	}

	@Override
	public void reviewHitUp(ReviewVO vo) {
		map.reviewHitUp(vo);
	}

	@Override
	public void reviewRecommendUp(ReviewVO vo) {
		map.reviewRecommendUp(vo);
	}

	@Override
	public ReviewVO cqNoSelect(ReviewVO vo) {
		return map.cqNoSelect(vo);
	}

}

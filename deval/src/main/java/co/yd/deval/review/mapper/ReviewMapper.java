package co.yd.deval.review.mapper;

import java.util.List;

import co.yd.deval.review.service.ReviewVO;

public interface ReviewMapper {

	List<ReviewVO> reviewSelectList(ReviewVO vo);
	ReviewVO reviewSelectOne(ReviewVO vo);
	int reviewInsert(ReviewVO vo);
	int reviewUpdate(ReviewVO vo);
	int reviewDelete(ReviewVO vo);
	
	ReviewVO cqNoSelect(ReviewVO vo);
	
	void reviewHitUp(ReviewVO vo);
	void reviewRecommendUp(ReviewVO vo);
	
}

package co.yd.deval.code.mapper;

import java.util.List;

import co.yd.deval.code.service.ReplyVO;

public interface ReplyMapper {
		//코드 리뷰 관련 기능
		List<ReplyVO> reviewList();
		ReplyVO reviewSelect(int replyNo);
		
		//공통 기능
		List<ReplyVO> selectList(int cqNo);
		int replyInsert(ReplyVO vo);
		int replyUpdate(ReplyVO vo);
		int replyDelete(int replyNo);	
		void replyHitUp(int cqNo);
		void replyRecommendUp(int cqNo);
}

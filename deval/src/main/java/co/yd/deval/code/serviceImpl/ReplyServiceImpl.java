package co.yd.deval.code.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import co.yd.deval.code.mapper.ReplyMapper;
import co.yd.deval.code.service.ReplyService;
import co.yd.deval.code.service.ReplyVO;

@Controller("replyDAO")
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper map;
	
	@Override
	public List<ReplyVO> reviewList() {
		return map.reviewList();
	}

	@Override
	public List<ReplyVO> selectList(int cqNo) {
		return map.selectList(cqNo);
	}

	@Override
	public ReplyVO reviewSelect(int replyNo) {
		return map.reviewSelect(replyNo);
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		return map.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return map.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int replyNo) {
		return map.replyDelete(replyNo);
	}

	@Override
	public void replyHitUp(int cqNo) {
		map.replyHitUp(cqNo);
	}

	@Override
	public void replyRecommendUp(int cqNo) {
		map.replyRecommendUp(cqNo);
	}

}

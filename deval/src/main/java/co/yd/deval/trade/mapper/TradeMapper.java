package co.yd.deval.trade.mapper;

import java.util.List;

import co.yd.deval.trade.service.TradeVO;

public interface TradeMapper {

	List<TradeVO> tradeList();
	TradeVO tradeSelectOne(TradeVO vo);
	int tradeInsert(TradeVO vo);
	int tradeUpdate(TradeVO vo);
	int tradeDelete(TradeVO vo);
	
	void tradeHitUp(TradeVO vo);
	
}

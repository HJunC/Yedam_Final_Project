package co.yd.deval.trade.service;

import java.util.List;

public interface TradeService {

	List<TradeVO> tradeList();
	TradeVO tradeSelectOne(TradeVO vo);
	int tradeInsert(TradeVO vo);
	int tradeUpdate(TradeVO vo);
	int tradeDelete(TradeVO vo);
	
	void tradeHitUp(TradeVO vo);
	
}

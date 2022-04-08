package co.yd.deval.trade.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.trade.mapper.TradeMapper;
import co.yd.deval.trade.service.TradeService;
import co.yd.deval.trade.service.TradeVO;

@Repository("tradeDAO")
public class TradeServiceImpl implements TradeService{

	@Autowired
	private TradeMapper map;
	
	@Override
	public List<TradeVO> tradeList() {
		return map.tradeList();
	}

	@Override
	public TradeVO tradeSelectOne(TradeVO vo) {
		return map.tradeSelectOne(vo);
	}

	@Override
	public int tradeInsert(TradeVO vo) {
		return map.tradeInsert(vo);
	}

	@Override
	public int tradeUpdate(TradeVO vo) {
		return map.tradeUpdate(vo);
	}

	@Override
	public int tradeDelete(TradeVO vo) {
		return map.tradeDelete(vo);
	}

	@Override
	public void tradeHitUp(TradeVO vo) {
		map.tradeHitUp(vo);
	}

}

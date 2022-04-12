package co.yd.deval.tradeLog.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.tradeLog.mapper.TradeLogMapper;
import co.yd.deval.tradeLog.service.TradeLogService;
import co.yd.deval.tradeLog.service.TradeLogVO;

@Repository("tradeDAO")
public class TradeLogServiceImpl implements TradeLogService {
	@Autowired
	private TradeLogMapper map;
	
	@Override
	public List<TradeLogVO> selectTradeLog() {
		return map.selectTradeLog();
	}

	@Override
	public int insertTradeLog(TradeLogVO vo) {
		return map.insertTradeLog(vo);
	}

	@Override
	public List<TradeLogVO> mentiList(String seller) {
		return map.mentiList(seller);
	}

	@Override
	public int updateRefuse(int tradeNo) {
		return map.updateRefuse(tradeNo);
	}

	@Override
	public int AcceptTradeLog(int tradeNo) {
		return map.AcceptTradeLog(tradeNo);
	}

}

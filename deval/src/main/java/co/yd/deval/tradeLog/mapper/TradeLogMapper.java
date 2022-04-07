package co.yd.deval.tradeLog.mapper;

import java.util.List;

import co.yd.deval.tradeLog.service.TradeLogVO;

public interface TradeLogMapper {
	List<TradeLogVO> selectTradeLog();
	List<TradeLogVO> mentiList(String seller);
	int insertTradeLog(TradeLogVO vo);
}

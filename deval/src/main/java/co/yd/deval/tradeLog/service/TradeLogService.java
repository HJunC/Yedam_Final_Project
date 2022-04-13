package co.yd.deval.tradeLog.service;

import java.util.List;

public interface TradeLogService {
	List<TradeLogVO> selectTradeLog();
	//멘테체크리스트 들어갈 값
	List<TradeLogVO> mentiList(String seller);
	int insertTradeLog(TradeLogVO vo);
	
	//환불 후 상태 변경
	int updateRefuse(int tradeNo);
	//수락 후 상태변경
	int AcceptTradeLog(int tradeNo);
}

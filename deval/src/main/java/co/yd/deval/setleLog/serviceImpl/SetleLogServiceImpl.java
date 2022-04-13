package co.yd.deval.setleLog.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.setleLog.mapper.SetleLogMapper;
import co.yd.deval.setleLog.service.SetleLogService;
import co.yd.deval.setleLog.service.SetleLogVO;

@Repository("setleDAO")
public class SetleLogServiceImpl implements SetleLogService {
	@Autowired
	private SetleLogMapper map;
	
	@Override
	public int setelLogInsert(SetleLogVO vo) {
		return map.setelLogInsert(vo);
	}

}

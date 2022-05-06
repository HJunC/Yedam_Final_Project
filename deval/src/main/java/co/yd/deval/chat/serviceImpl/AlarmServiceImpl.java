package co.yd.deval.chat.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yd.deval.chat.mapper.AlarmMapper;
import co.yd.deval.chat.service.AlarmService;
import co.yd.deval.chat.service.AlarmVO;

@Repository("alarmDAO")
public class AlarmServiceImpl implements AlarmService {
	@Autowired
	private AlarmMapper map;
	
	@Override
	public int insertAlarm(AlarmVO vo) {
		return map.insertAlarm(vo);
	}

	@Override
	public int updateAlarm(String id) {
		return map.updateAlarm(id);
	}

	@Override
	public List<AlarmVO> alarmList(String id) {
		return map.alarmList(id);
	}

}

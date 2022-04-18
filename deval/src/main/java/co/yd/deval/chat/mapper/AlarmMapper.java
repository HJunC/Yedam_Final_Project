package co.yd.deval.chat.mapper;

import java.util.List;

import co.yd.deval.chat.service.AlarmVO;

public interface AlarmMapper {
	int insertAlarm(AlarmVO vo);
	int updateAlarm(String id);
	List<AlarmVO> alarmList(String id);
}

package co.yd.deval.chat.service;

import java.util.List;

public interface AlarmService {
	int insertAlarm(AlarmVO vo);
	int updateAlarm(String id);
	List<AlarmVO> alarmList(String id);
}

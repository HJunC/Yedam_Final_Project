package co.yd.deval.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import co.yd.deval.scheduler.map.SchedulerMapper;

@Component
public class AutoScheduler {

	@Autowired
	private SchedulerMapper dao;
	
	@Scheduled(cron = "0 0/10 * * * *")
	public void updateStates() {
		dao.updateMentoServieState();
		dao.updateProjectState();
		dao.updateStudyState();
		dao.updateTradeState();
	}
}

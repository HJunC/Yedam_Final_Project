package co.yd.deval.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import co.yd.deval.scheduler.map.SchedulerMapper;

@Component
public class AutoScheduler {

	@Autowired
	private SchedulerMapper dao;
	
	@Scheduled(cron = "0/1 * * * * *")
	public void updateStates() {
		dao.updateProjectState();
	}
}

package co.yd.deval.scheduler;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import co.yd.deval.project.service.ProjectService;
import co.yd.deval.study.service.StudyService;

@Component
public class AutoScheduler {

	@Autowired
	private StudyService studyDao;
	@Autowired
	private ProjectService projectDao;
	
	@Scheduled(cron = "0/1 * * * * *")
	public void updateStates() {
		
	}
}

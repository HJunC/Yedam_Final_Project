package co.yd.deval.member;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import co.yd.deval.member.mapper.LoginMapper;
import co.yd.deval.scheduler.map.SchedulerMapper;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml")
@PropertySource("classpath:/config/db.properties")
public class IdCheckTest {

//	@Autowired
//	SchedulerMapper map;
	
	@Test
	public void idCheck() {
//		map.updateProjectState();
	}

}

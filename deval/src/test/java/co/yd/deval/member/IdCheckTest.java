package co.yd.deval.member;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import co.yd.deval.member.mapper.LoginMapper;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml")
@PropertySource("classpath:/config/db.properties")
public class IdCheckTest {
/*
	@Autowired
	LoginMapper map;*/
	
	@Test
	public void idCheck() {
		/*System.out.println(map.idCheck("view"));*/
	}

}

package co.yd.deval.project;

import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Date;

import static org.junit.Assert.*;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml")
@PropertySource("classpath:/config/db.properties")
public class ProjectServiceImplTest {

/*
    @Autowired
    private ProjectService projectService;
*/

    @Test
    public void insertProject() {
/*        ProjectVO vo = new ProjectVO();
        vo.setProjectName("테스트용 프로젝트4000");
        vo.setRecruitEdt(new Date());
        vo.setLeaderId("test71");
        vo.setLeaderPosition("BE");
        vo.setFrontRcnt(1);
        vo.setBackRcnt(0);
        vo.setFullRcnt(1);
        vo.setDesignRcnt(1);
        vo.setPlannerRcnt(1);
        vo.setTotalRcnt(5);
        vo.setLang("Java, figma, React, spring");
        vo.setProcess("ON");
        vo.setSubject("아무나오세요");
        vo.setProjectTerm(30);
        System.out.println(projectService.insertProject(vo));*/
    }
}
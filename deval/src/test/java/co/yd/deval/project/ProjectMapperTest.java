package co.yd.deval.project;

import co.yd.deval.common.Criteria;
import co.yd.deval.common.PageDTO;
import co.yd.deval.project.mapper.ProjectMapper;
import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.ProjectStateEnum;
import co.yd.deval.project.service.ProjectVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

/**
* @package : co.yd.deval.project.mapper
* @name : ProjectMapperTest.java
* @date : 2022-04-01 오후 3:08
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed : ByungHo Park
**/

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml")
@PropertySource("classpath:/config/db.properties")
public class ProjectMapperTest {

    @Autowired
    ProjectMapper mapper;
    @Autowired
    ProjectTeamMapper teamMapper;
    @Autowired
    ProjectRequestMapper requestMapper;

    @Test
    public void getListWithPaging() {
        Criteria cri = new Criteria();
        cri.setPageNum(1);
        cri.setAmount(10);

        ProjectVO vo = new ProjectVO();
        vo.setProjectName("부동산");
        vo.setCriteria(cri);
        List<ProjectVO> list = mapper.getListWithPaging(vo);
        System.out.println(new PageDTO(cri, mapper.getTotalCount(vo)));

        list.forEach(item -> System.out.println("=========================================" + item));

    }

    @Test
    public void getProject() {
        System.out.println("지원중");
    }
}
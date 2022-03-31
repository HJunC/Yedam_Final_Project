package co.yd.deval.project.mapper;

import co.yd.deval.common.Criteria;
import co.yd.deval.project.service.ProjectVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml")
@PropertySource("classpath:/config/db.properties")
public class ProjectMapperTest {

    @Autowired
    ProjectMapper mapper;

    @Test
    public void getListWithPaging() {
        Criteria cri = new Criteria();
        cri.setPageNum(3);
        cri.setAmount(10);

        List<ProjectVO> list = mapper.getListWithPaging(cri);

        list.forEach(item -> System.out.println(item.getProjectNo()));

    }
}
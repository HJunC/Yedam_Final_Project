package co.yd.deval.project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*-context.xml")
@PropertySource("classpath:/config/db.properties")
public class ProjectServiceImplTest {

/*    @Autowired
    private BoardMapper map;*/

    @Test
    public void insertProject() {
/*        List<BoardVO> testList = map.getMainPageList();
        for (BoardVO vo : testList) {
            System.out.println(vo);
        }*/
    }
}
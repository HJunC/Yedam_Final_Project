package co.yd.deval.project.web;

import co.yd.deval.HomeController;
import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectVO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/project")
public class ProjectController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    private final ProjectService projectDao;

    public ProjectController(ProjectService projectDao) {
        this.projectDao = projectDao;
    }

    @GetMapping("/main.do")
    public String projectMain(Model model) {
        List<ProjectVO> list = projectDao.findByLeaderIdAndState("hong", "1");
        if (list == null) {
            logger.info("list null");
        } else {
            for (ProjectVO projectInfo : list) {
                System.out.println(projectInfo);
            }
        }
        return "project/projectMain";
    }

    @GetMapping("/projectInsertForm.do")
    public String projectInsertForm() {
        return "project/projectInsertForm";
    }

    @PostMapping("/projectInsert.do")
    public String projectInsert(ProjectVO vo) {
        vo.setTotalRcnt(
                vo.getFrontRcnt()
                + vo.getBackRcnt()
                + vo.getFullRcnt()
                + vo.getDesignRcnt()
                + vo.getPlannerRcnt()
        );
        // todo 로그인 유저 입력
        vo.setLeaderId("hong");
        int result = projectDao.insertProject(vo);
        if (result != 0) {
            System.out.println(vo);
            return "redirect:main.do";
        } else {
            System.out.println("error");
            return "redirect:main.do";
        }

    }

}

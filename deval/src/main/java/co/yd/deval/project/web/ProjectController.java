package co.yd.deval.project.web;

import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectTeamService;
import co.yd.deval.project.service.ProjectTeamVO;
import co.yd.deval.project.service.ProjectVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/project")
public class ProjectController {

    private final ProjectService projectDao;

    public ProjectController(ProjectService projectDao) {
        this.projectDao = projectDao;
    }

    @GetMapping("/main.do")
    public String projectMain(Model model) {
        String userId = "hong";
        ProjectVO userProject = projectDao.getNowUserProject(userId);
        if (userProject != null) {
            if (userProject.getLeaderId().equals(userId)) {
                model.addAttribute("isLeader", "true");
            } else {
                model.addAttribute("isLeader", "false");
            }
            model.addAttribute("userProject", userProject);
        }
        ProjectVO searchVo = new ProjectVO();
        //List<ProjectVO> projectList = projectDao.searchMainPageProject(searchVo);
        List<ProjectVO> projectList = projectDao.selectProjectAll();
        model.addAttribute("projectList", projectList);
        return "project/projectMain";
    }

    @GetMapping("/projectInsertForm.do")
    public String projectInsertForm() {
        return "project/projectInsertForm";
    }

    @PostMapping("/projectInsert.do")
    public String projectInsert(ProjectVO vo) {
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

    @GetMapping("/projectDetail.do")
    public String projectDetail(Model model, @RequestParam("no") int projectNo) {
        model.addAttribute("project", projectDao.selectProject(projectNo));
        return "project/projectDetail";
    }

}

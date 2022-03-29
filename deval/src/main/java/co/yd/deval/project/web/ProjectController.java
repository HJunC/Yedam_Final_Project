package co.yd.deval.project.web;

import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
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
        List<ProjectVO> myProjectList = projectDao.findByLeaderIdAndState("2222", "1");
        HashMap<String, String> userState = new HashMap<>();

        if (!myProjectList.isEmpty()) {
            // 리더일때
            userState.put("isLeader", "true");
            model.addAttribute("userState", userState);
            model.addAttribute("myProjectInfo", myProjectList);
        } else {
            userState.put("isLeader", "false");
            // 팀원일때

            // 속한 프로젝트가 아무것도 없을때
            ProjectVO searchVO = new ProjectVO();
            LocalDate now = LocalDate.now();
            System.out.println("==================================="+Date.valueOf(now));
            searchVO.setRecruitEdt(Date.valueOf(now));
            List<ProjectVO> projectList = projectDao.searchProject(searchVO);
            model.addAttribute("projectList", projectList);
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

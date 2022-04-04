package co.yd.deval.project.web;

import co.yd.deval.common.Criteria;
import co.yd.deval.common.PageDTO;
import co.yd.deval.project.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

/**
* @package : co.yd.deval.project.web
* @name : ProjectController.java
* @date : 2022-04-01 오후 3:04
* @author : ByungHo
* @version : 1.0.0
* @modifyed : ByungHo
**/

@Controller
@RequestMapping("/project")
public class ProjectController {

    private final ProjectService projectDao;

    public ProjectController(ProjectService projectDao) {
        this.projectDao = projectDao;
    }

    /***
     * 프로젝트 메인화면
     * @param model
     * @param principal
     * @return project/projectMain.jsp
     */
    @GetMapping("/main.do")
    public String projectMain(Model model, Principal principal) {
        if (principal != null) {
            ProjectVO userProject = projectDao.getOngoingProject(principal.getName());
            if (userProject != null) {
                if (userProject.getLeaderId().equals(principal.getName())) {
                    model.addAttribute("isLeader", "true");
                } else {
                    model.addAttribute("isLeader", "false");
                }
                model.addAttribute("userProject", userProject);
            } else {
                // todo 지원 여부
                if (true) {
                    model.addAttribute("isRecruit", "true");
                }
            }
        }

        ProjectVO searchVO = new ProjectVO();
        List<ProjectVO> projectList = projectDao.searchMainPageProject(searchVO);
        model.addAttribute("projectList", projectList);
        return "project/projectMain";
    }

    /***
     * 프로젝트 추가화면 이동
     * @return project/projectInsertForm.jsp
     */
    @GetMapping("/projectInsertForm.do")
    public String projectInsertForm() {
        return "project/projectInsertForm";
    }

    /***
     * 프로젝트 추가
     * @param vo
     * @param principal
     * @return redirect:main.do
     */
    @PostMapping("/addProject.do")
    public String addProject(ProjectVO vo, Principal principal) {
        vo.setLeaderId(principal.getName());
        int result = projectDao.insertProject(vo);
        if (result != 0) {
            System.out.println(vo);
            return "redirect:main.do";
        } else {
            System.out.println("error");
            return "redirect:main.do";
        }
    }

    /***
     * 프로젝트 삭제
     * @param vo
     * @param principal
     * @return redirect:main.do
     */
    @PostMapping("/deleteProject.do")
    public String deleteProject(ProjectVO vo, Principal principal) {
        if (principal != null) {
            if(principal.getName().equals(vo.getLeaderId())) {
                int result = projectDao.deleteProject(vo);
            }
        }
        return "redirect:main.do";
    }

    /***
     * 프로젝트 상세화면
     * @param model
     * @param projectNo
     * @return project/projectDetail.jsp
     */
    @GetMapping("/projectDetail.do")
    public String projectDetail(Model model, @RequestParam("no") int projectNo) {
        ProjectInfoDTO dto = projectDao.getProjectInfo(projectNo);
        model.addAttribute("project", dto);
        model.addAttribute("team", dto.getProjectTeam());



        return "project/projectDetail";
    }

    /***
     * 프로젝트 검색
     * @param model
     * @param vo
     * @param cri
     * @return project/projectSearch.jsp
     */
    @GetMapping("/search")
    public String projectSearch(Model model, ProjectVO vo, Criteria cri) {
        vo.setCriteria(cri);
        List<ProjectVO> projectList = projectDao.getListWithPaging(vo);
        PageDTO pageDTO = new PageDTO(cri, projectDao.getTotalCount(vo));

        model.addAttribute("projectList", projectList);
        model.addAttribute("search", vo);
        model.addAttribute("pageMaker", new PageDTO(cri, projectDao.getTotalCount(vo)));
        return "project/projectSearch";
    }

}

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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

    private final ProjectService projectService;
    private final ProjectRequestService projectRequestService;

    public ProjectController(ProjectService projectService, ProjectRequestService projectRequestService) {
        this.projectService = projectService;
        this.projectRequestService = projectRequestService;
    }

    /***
     * 프로젝트 메인화면
     * @param model
     * @param principal
     * @return project/projectMain.jsp
     */
    @GetMapping("/main.do")
    public String projectMain(Model model, Principal principal, HttpServletRequest request) {
        if (principal != null) {
            HttpSession session = request.getSession();
            String state = (String) session.getAttribute("userProjectState");
            if (state == null) {
                ProjectVO userProject = projectService.getOngoingProject(principal.getName());
                // 진행중인 프로젝트가 있을 때
                if (userProject != null) {
                    if (userProject.getLeaderId().equals(principal.getName())) {
                        session.setAttribute("userProjectState", ProjectStateEnum.P5);
                    } else {
                        session.setAttribute("userProjectState", ProjectStateEnum.P6);
                    }
                    model.addAttribute("userProject", userProject);
                } else {
                    ProjectRequestVO rvo = new ProjectRequestVO();
                    rvo.setMemberId(principal.getName());
                    rvo.setState("1"); // 검토중
                    List<ProjectRequestVO> requestList = projectRequestService.selectProjectRequest(rvo);
                    // 검토중인 요청이 있을 떄
                    if (!requestList.isEmpty()) {
                        session.setAttribute("userProjectState", ProjectStateEnum.P2);
                        model.addAttribute("userRequestProject", requestList);
                    }
                }
            }
            System.out.println("=============================================="+state);
        }

        ProjectVO searchVO = new ProjectVO();
        List<ProjectVO> projectList = projectService.searchMainPageProject(searchVO);
        model.addAttribute("projectList", projectList);
        return "project/projectMain";
    }

    /***
     * 프로젝트 추가화면 이동
     * @param principal 로그인 유저정보
     * @return project/projectInsertForm.jsp
     */
    @GetMapping("/projectInsertForm.do")
    public String projectInsertForm(Principal principal) {
        if (principal != null) {
            // todo 프로젝트 진행여부 체크
            return "project/projectInsertForm";
        } else {
            return "redirect:../loginForm.do";
        }
    }

    /***
     * 프로젝트 생성
     * @param vo 프로젝트 vo
     * @param principal 로그인 유저정보
     * @return redirect:main.do
     */
    /*@PostMapping("/insertProject.do")
    public String addProject(ProjectVO vo, Principal principal) {
        if (principal != null) {
            System.out.println("============================================"+vo);
            vo.setLeaderId(principal.getName());
            int result = projectService.insertProject(vo);
        }
        return "redirect:main.do";
    }*/

    /***
     * 프로젝트 삭제
     * @param vo 프로젝트 vo
     * @param principal 로그인 유저정보
     * @return redirect:main.do
     */
    /*@PostMapping("/deleteProject.do")
    public String deleteProject(ProjectVO vo, Principal principal) {
        if (principal.getName().equals(vo.getLeaderId())) {
            projectService.deleteProject(vo);
            return "redirect:main.do";
        } else {
            return "redirect:main.do";
        }
    }*/

    /***
     * 프로젝트 상세화면
     * @param model
     * @param projectNo
     * @return project/projectDetail.jsp
     */
    @GetMapping("/projectDetail.do")
    public String projectDetail(Model model, @RequestParam("no") int projectNo) {
        ProjectInfoDTO dto = projectService.getProjectInfo(projectNo);
        model.addAttribute("project", dto);
        model.addAttribute("team", dto.getProjectTeam());
        return "project/projectDetail";
    }

    /***
     * 프로젝트 검색
     * @param model
     * @param vo 프로젝트 객체
     * @param cri
     * @return project/projectSearch.jsp
     */
    @GetMapping("/search")
    public String projectSearch(Model model, ProjectVO vo, Criteria cri) {
        vo.setCriteria(cri);
        List<ProjectVO> projectList = projectService.getListWithPaging(vo);
        PageDTO pageDTO = new PageDTO(cri, projectService.getTotalCount(vo));

        model.addAttribute("projectList", projectList);
        model.addAttribute("search", vo);
        model.addAttribute("pageMaker", new PageDTO(cri, projectService.getTotalCount(vo)));
        return "project/projectSearch";
    }

}

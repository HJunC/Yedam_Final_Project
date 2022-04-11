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
import java.util.ArrayList;
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
    public String projectMain(Model model, Principal principal, HttpSession session) {
        if (principal != null) {
            String state = (String) session.getAttribute("userProjectState");

            int projectNo = 0;
            if (state == null) {
                ProjectTeamVO userTeam = projectService.getOngoingProject(principal.getName());
                // 대기, 진행중인 프로젝트가 있을 때
                if (userTeam != null) {
                    if (userTeam.getIsLeader().equals("1")) {
                        session.setAttribute("userProjectState", "팀장");
                        session.setAttribute("isWait", !userTeam.getState().equals("2"));
                    } else {
                        session.setAttribute("userProjectState", "팀원");
                    }
                    projectNo = userTeam.getProjectNo();
                } else {
                    session.setAttribute("userProjectState", "");
                }
            }

            state = (String) session.getAttribute("userProjectState");
            if (state.equals("팀장") || state.equals("팀원")) {
                if (projectNo == 0) {
                    ProjectTeamVO userTeam = projectService.getOngoingProject(principal.getName());
                    projectNo = userTeam.getProjectNo();
                }
                model.addAttribute("userProject", projectService.selectProject(projectNo));
                if ((boolean) session.getAttribute("isWait")) {
                    // 지원자 리스트
                    ProjectRequestVO requestVO = ProjectRequestVO.builder()
                            .projectNo(projectNo)
                            .state("1").build();
                    model.addAttribute("requestList", projectRequestService.selectProjectRequest(requestVO));
                }
            }
            // 지원한 프로젝트 리스트
            ProjectRequestVO rvo = ProjectRequestVO.builder()
                    .memberId(principal.getName())
                    .state("1")
                    .build();
            List<ProjectRequestVO> requestList = projectRequestService.selectProjectRequest(rvo);
            model.addAttribute("userRequest", requestList);
        }
        // 팀 프로젝트 찾기
        ProjectVO searchVO = new ProjectVO();
        List<ProjectVO> projectList = projectService.searchMainPageProject(searchVO);
        model.addAttribute("projectList", projectList);
        return "project/projectMain";
    }

    /***
     * 프로젝트 추가화면 이동
     * @return 진행중인 프로젝트가 없으면 projectInsertForm.jsp로 이동
     */
    @GetMapping("/projectInsertForm.do")
    public String projectInsertForm() {
        return "project/projectInsertForm";
    }

    /***
     * 프로젝트 상세화면
     * @param model
     * @param projectNo
     * @return project/projectDetail.jsp
     */
    @GetMapping("/projectDetail.do")
    public String projectDetail(Model model, @RequestParam("no") int projectNo) {
        ProjectInfoDTO dto = projectService.getProject(projectNo);
        projectService.updateHit(projectNo);
        model.addAttribute("project", dto);
        model.addAttribute("team", dto.getProjectTeam());
        return "project/projectDetail";
    }

    /***
     * 프로젝트 검색
     * @param model
     * @param vo 프로젝트 객체
     * @param cri 페이지 객체
     * @return project/projectSearch.jsp
     */
    @GetMapping("/search.do")
    public String projectSearch(Model model, ProjectVO vo, Criteria cri) {
        vo.setCriteria(cri);
        model.addAttribute("search", vo);
        List<ProjectVO> projectList = projectService.getListWithPaging(vo);
        model.addAttribute("projectList", projectList);
        model.addAttribute("pageMaker", new PageDTO(cri, projectService.getTotalCount(vo)));
        return "project/projectSearch";
    }

}

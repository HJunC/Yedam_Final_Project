package co.yd.deval.project.web;

import co.yd.deval.project.service.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

/**
* @package : co.yd.deval.project.web
* @name : RestProjectController.java
* @date : 2022-04-01 오후 3:09
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed : ByungHo Park
**/

@RestController
@RequestMapping("/api/project")
public class RestProjectController {

    private final ProjectService projectService;
    private final ProjectRequestService projectRequestService;

    public RestProjectController(ProjectService projectService, ProjectRequestService projectRequestService) {
        this.projectService = projectService;
        this.projectRequestService = projectRequestService;
    }

    @GetMapping("/detail")
    public ProjectInfoDTO detailProject(@RequestParam("no") int projectNo) {
        return projectService.getProjectInfo(projectNo);
    }

    /***
     * 프로젝트 참가 요청
     * @param vo 프로젝트 요청 vo
     * @param principal 로그인 유저정보
     * @return ProjectRequestVO
     */
    @PostMapping("/request")
    public ResponseEntity<ProjectRequestVO> request(ProjectRequestVO vo, Principal principal) {
        if (principal != null) {
            projectRequestService.insertProjectRequest(vo);
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

    /***
     * 프로젝트 참가 요청 삭제
     * @param vo 프로젝트 요청 vo
     * @param principal 로그인 유저정보
     * @return ProjectRequestVO
     */
    @PostMapping("/requestDelete")
    public ResponseEntity<ProjectRequestVO> requestDelete(ProjectRequestVO vo, Principal principal) {
        if (principal != null) {
            projectRequestService.deleteProjectRequest(vo);
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

    /***
     * 프로젝트 생성
     * @param vo 프로젝트 vo
     * @param principal 로그인 유저정보
     * @return redirect:main.do
     */
    @PostMapping("/insert")
    public ResponseEntity<Map<String, Object>> addProject(ProjectVO vo, Principal principal) {
        Map<String, Object> returnBody = new HashMap<>();
        if (principal.getName().equals(vo.getLeaderId())) {
            if (projectService.getOngoingProject(principal.getName()) == null) {
                int projectNo = projectService.insertProject(vo);
                vo.setProjectNo(projectNo);
                returnBody.put("data", vo);
                return ResponseEntity.ok().body(returnBody);
            } else {
                returnBody.put("error", "이미 프로젝트가 존재합니다.");
            }
        } else {
            returnBody.put("error", "잘못된 접근입니다.");
        }
        return ResponseEntity.badRequest().body(returnBody);
    }

    /***
     * 프로젝트 삭제
     * @param vo 프로젝트 vo
     * @param principal 로그인 유저정보
     * @return
     */
    @PostMapping("/delete")
    public ResponseEntity<ProjectVO> deleteProject(ProjectVO vo, Principal principal) {
        if (principal.getName().equals(vo.getLeaderId())) {
            projectService.deleteProject(vo);
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

    /***
     * 프로젝트 업데이트
     * @param vo 프로젝트 vo
     * @param principal 로그인 유저정보
     * @return
     */
    @PostMapping("/update")
    public ResponseEntity<ProjectVO> progressProject(ProjectVO vo, Principal principal) {
        if (principal.getName().equals(vo.getLeaderId())) {
            // projectNo, 업데이트 내용
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

}

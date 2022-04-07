package co.yd.deval.project.web;

import co.yd.deval.project.service.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    public ResponseEntity<Object> detailProject(@RequestParam("no") int projectNo) {
        try {
            ProjectInfoDTO dto = projectService.getProject(projectNo);
            return ResponseEntity.ok().body(dto);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body("error");
        }
    }

    /***
     * 프로젝트 생성
     * @param vo 프로젝트 vo
     * @param principal 로그인 유저정보
     * @return
     */
    @PostMapping("/insert")
    public ResponseEntity<Map<String, Object>> addProject(ProjectVO vo, Principal principal, HttpSession session) {
        Map<String, Object> res = new HashMap<>();
        if (principal.getName().equals(vo.getLeaderId())) {
            if (session.getAttribute("userProjectState").equals("없음")
                    || session.getAttribute("userProjectState").equals("지원중")) {
                try {
                    int createPno = projectService.create(vo);
                    if (createPno > 0) {
                        session.setAttribute("userProjectState", "대기팀장");
                        res.put("result", "success");
                        res.put("projectNo", createPno);
                        return ResponseEntity.ok().body(res);
                    } else {
                        res.put("message", "에러");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    res.put("message", "양식 에러");
                }
            } else {
                res.put("message", "이미 프로젝트가 존재합니다.");
            }
        } else {
            res.put("message", "잘못된 접근입니다.");
        }
        return ResponseEntity.badRequest().body(res);
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
            projectService.remove(vo);
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

    /***
     * 프로젝트 시작
     * @param vo 프로젝트 vo
     * @param principal 로그인 유저정보
     * @return
     */
    @PostMapping("/start")
    public ResponseEntity<ProjectVO> progressProject(ProjectVO vo, Principal principal) {
        if (principal.getName().equals(vo.getLeaderId())) {
            // todo 프로젝트 시작
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

    /***
     * 팀원 추방
     */

    /***
     * 프로젝트 나가기
     */

    /***
     * 프로젝트 참가 요청
     * @param vo 프로젝트 요청 vo
     * @param principal 로그인 유저정보
     * @return
     */
    @PostMapping("/request")
    public ResponseEntity<Map<String, Object>> request(ProjectRequestVO vo, Principal principal, HttpSession session) {
        Map<String, Object> returnBody = new HashMap<>();
        if (principal != null) {
            int result = projectRequestService.request(vo);
            if (result > 0) {
                projectService.updateApplyCount(vo.getProjectNo());
                session.setAttribute("userProjectState", "지원중");
                returnBody.put("result", "success");
                return ResponseEntity.ok().body(returnBody);
            } else {
                returnBody.put("result", "fail");
                returnBody.put("message", "입력 실패하였습니다.");
                return ResponseEntity.badRequest().body(returnBody);
            }
        } else {
            returnBody.put("message", "잘못된 접근입니다.");
            return ResponseEntity.badRequest().body(returnBody);
        }
    }

    /***
     * 프로젝트 참가 요청 거절
     * @param vo 프로젝트 요청 vo
     * @param principal 로그인 유저정보
     * @return
     */
    @PostMapping("/refuseRequest")
    public ResponseEntity<ProjectRequestVO> deleteRequest(ProjectRequestVO vo, Principal principal) {
        if (principal != null) {
            projectRequestService.remove(vo);
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

    /***
     * 프로젝트 참가 요청 승인 (팀 합류)
     * @param vo
     * @param principal
     * @return
     */
    @PostMapping("/approveRequest")
    public ResponseEntity<ProjectRequestVO> approveRequest(ProjectRequestVO vo, Principal principal) {
        projectRequestService.approve(vo);
        return ResponseEntity.ok().body(vo);
    }
}

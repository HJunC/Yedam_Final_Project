package co.yd.deval.project.web;

import co.yd.deval.project.service.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<Map<String, Object>> insertProject(ProjectVO vo, Principal principal, HttpSession session) {
        Map<String, Object> res = new HashMap<>();
        if (principal.getName().equals(vo.getLeaderId())) {
            try {
                int createPno = projectService.create(vo);
                if (createPno > 0) {
                    session.setAttribute("isTeam", true);
                    session.setAttribute("isWait", true);
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
    public ResponseEntity<ProjectVO> deleteProject(ProjectVO vo, Principal principal, HttpSession session) {
        if (principal.getName().equals(vo.getLeaderId())) {
            projectService.remove(vo);
            session.setAttribute("isTeam", false);
            session.setAttribute("isWait", false);
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
    public ResponseEntity<ProjectVO> startProject(ProjectVO vo, Principal principal, HttpSession session) {
        if (principal.getName().equals(vo.getLeaderId())) {
            try {
                int result = projectService.startProject(vo);
                if (result > 0) session.setAttribute("isWait", false);
                return ResponseEntity.ok().body(vo);
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.badRequest().body(vo);
            }
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

     /**
     * 프로젝트 업데이트
     * @param vo
     * @return
     */
    @PostMapping("/update")
    public ResponseEntity<Integer> updateProject(ProjectVO vo) {
        int result = projectService.updateProject(vo);
        if (result > 0) {
            return ResponseEntity.ok().body(result);
        }
        return ResponseEntity.badRequest().body(result);
    }

    @PostMapping("/complete")
    public ResponseEntity<Map<String, Object>> completeProject(ProjectVO vo, Principal user, HttpSession session) {
        Map<String, Object> returnBody = new HashMap<>();
        if (user.getName().equals(vo.getLeaderId())) {
           try {
               int result = projectService.completeProject(vo);
               if (result > 0) {
                   returnBody.put("result", "success");
                   return ResponseEntity.ok().body(returnBody);
               } else {
                   returnBody.put("result", "fail");
                   returnBody.put("message", "입력 실패하였습니다.");
                   return ResponseEntity.badRequest().body(returnBody);
               }
           } catch (Exception e) {
               e.printStackTrace();
               returnBody.put("message", "양식 에러");
               return ResponseEntity.badRequest().body(returnBody);
           }
        } else {
            returnBody.put("message", "잘못된 접근입니다.");
            return ResponseEntity.badRequest().body(returnBody);
        }
    }

    /***
     * 팀원 추방
     */
    @PostMapping("/expulsion")
    public ResponseEntity<ProjectVO> expulsion(ProjectVO vo) {
        return ResponseEntity.ok().body(vo);
    }

    /***
     * 프로젝트 나가기
     */
    @PostMapping("/exit")
    public ResponseEntity<ProjectVO> exit(ProjectVO vo) {
        return ResponseEntity.ok().body(vo);
    }

    /***
     * 프로젝트 참가 요청
     * @param vo 프로젝트 요청 vo
     * @param principal 로그인 유저정보
     * @return
     */
    @PostMapping("/request")
    public ResponseEntity<Map<String, Object>> request(ProjectRequestVO vo, Principal principal) {
        Map<String, Object> returnBody = new HashMap<>();
        if (principal != null) {
            int result = projectRequestService.request(vo);
            if (result > 0) {
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
    public ResponseEntity<Integer> deleteRequest(ProjectRequestVO vo, Principal principal) {
        if (principal != null) {
            vo.setUpdateState("3");
            int result = projectRequestService.updateRequest(vo);
            return ResponseEntity.ok().body(result);
        } else {
            return ResponseEntity.badRequest().body(0);
        }
    }

    /***
     * 프로젝트 참가 요청 승인 (팀 합류)
     * @param vo
     * @return
     */
    @PostMapping("/approveRequest")
    public ResponseEntity<ProjectRequestVO> approveRequest(ProjectRequestVO vo) {
        int result = projectRequestService.approve(vo);
        if (result > 0) {
            return ResponseEntity.ok().body(vo);
        } else {
            return ResponseEntity.badRequest().body(vo);
        }
    }

    @PostMapping("/deleteRequest")
    public ResponseEntity<ProjectRequestVO> deleteRequest(ProjectRequestVO vo) {
        projectRequestService.remove(vo);
        return ResponseEntity.ok().body(vo);
    }

}

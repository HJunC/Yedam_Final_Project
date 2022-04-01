package co.yd.deval.project.web;

import co.yd.deval.project.mapper.ProjectMapper;
import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.lang.annotation.Target;
import java.util.List;

/**
* @package : co.yd.deval.project.web
* @name : RestProjectController.java
* @date : 2022-04-01 오후 3:09
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed : ByungHo Park
**/

@RestController
@RequestMapping("/project")
public class RestProjectController {

    private final ProjectService projectDao;

    public RestProjectController(ProjectService projectDao) {
        this.projectDao = projectDao;
    }

    @GetMapping("/api/detailProject")
    public ProjectInfoDTO detailProject(@RequestParam("no") int projectNo) {
        return projectDao.getProjectInfo(projectNo);
    }

    @PostMapping("/api/request")
    public ResponseEntity<String> request(ProjectRequestVO vo) {
        // todo 참가 요청
        return ResponseEntity.ok("success");
    }

    @PostMapping("/api/requestDelete")
    public ResponseEntity<String> requestDelete(ProjectRequestVO vo) {
        // todo 참가 취소
        return ResponseEntity.ok("success");
    }

    // todo 프로젝트 삭제 요청

    // todo 프로젝트 진행 요청

}

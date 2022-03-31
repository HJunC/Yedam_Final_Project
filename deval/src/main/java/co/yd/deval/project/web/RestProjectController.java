package co.yd.deval.project.web;

import co.yd.deval.project.mapper.ProjectMapper;
import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/project")
public class RestProjectController {

    private final ProjectService projectDao;
    final
    ProjectMapper mapper;
    final
    ProjectTeamMapper teamMapper;
    final
    ProjectRequestMapper requestMapper;

    public RestProjectController(ProjectService projectDao, ProjectTeamMapper teamMapper, ProjectRequestMapper requestMapper, ProjectMapper mapper) {
        this.projectDao = projectDao;
        this.teamMapper = teamMapper;
        this.requestMapper = requestMapper;
        this.mapper = mapper;
    }

    @GetMapping("/api/searchProject")
    public List<ProjectVO> searchApi(ProjectVO vo) {
        return projectDao.searchProject(vo);
    }

    @GetMapping("/api/detailProject")
    public ProjectInfoDTO detailProject(@RequestParam("no") int projectNo) {
        ProjectInfoDTO dto = mapper.getProject(projectNo);
        ProjectTeamVO searchTeamVo = new ProjectTeamVO();
        searchTeamVo.setProjectNo(projectNo);
        dto.setProjectTeam(teamMapper.selectProjectTeam(searchTeamVo));
        return dto;
    }
}

package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.ProjectRequestService;
import co.yd.deval.project.service.ProjectRequestVO;
import co.yd.deval.project.service.ProjectTeamVO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @package : co.yd.deval.project.serviceImpl
* @name : ProjectRequestServiceImpl.java
* @date : 2022-04-04 오후 4:34
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed :
**/
@Service("projectRequestService")
public class ProjectRequestServiceImpl implements ProjectRequestService {

    private final ProjectRequestMapper mapper;
    private final ProjectTeamMapper teamMapper;

    public ProjectRequestServiceImpl(ProjectRequestMapper mapper, ProjectTeamMapper teamMapper) {
        this.mapper = mapper;
        this.teamMapper = teamMapper;
    }

    @Override
    public List<ProjectRequestVO> selectProjectRequest(ProjectRequestVO vo) {
        return mapper.selectProjectRequest(vo);
    }

    @Override
    public int request(ProjectRequestVO vo) {
        // todo 지원자수 증가
        // todo 같은 지원자 인지 체크
        return mapper.insertProjectRequest(vo);
    }

    @Override
    public int remove(ProjectRequestVO vo) {
        return mapper.deleteProjectRequest(vo);
    }

    @Override
    public int approve(ProjectRequestVO vo) {
        // todo 프로젝트 포지션 카운트 - 1

        // todo 프로젝트 팀에 추가
        ProjectTeamVO teamVO = ProjectTeamVO.builder().build();
        teamMapper.insertProjectTeam(teamVO);
        vo.setUpdateState("3");
        return mapper.updateProjectRequest(vo);
    }

}

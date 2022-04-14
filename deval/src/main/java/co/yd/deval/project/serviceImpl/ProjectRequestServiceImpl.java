package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.mapper.ProjectMapper;
import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.ProjectRequestService;
import co.yd.deval.project.service.ProjectRequestVO;
import co.yd.deval.project.service.ProjectTeamVO;
import co.yd.deval.project.service.ProjectVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    private final ProjectMapper projectMapper;

    public ProjectRequestServiceImpl(ProjectRequestMapper mapper, ProjectTeamMapper teamMapper, ProjectMapper projectMapper) {
        this.mapper = mapper;
        this.teamMapper = teamMapper;
        this.projectMapper = projectMapper;
    }

    @Override
    public List<ProjectRequestVO> selectProjectRequest(ProjectRequestVO vo) {
        return mapper.selectProjectRequest(vo);
    }

    @Override
    public int request(ProjectRequestVO vo) {
        // 지원자수 증가
        projectMapper.updateApplyCount(vo.getProjectNo());
        return mapper.insertProjectRequest(vo);
    }

    @Override
    public int remove(ProjectRequestVO vo) {
        return mapper.deleteProjectRequest(vo);
    }

    @Override
    @Transactional
    public int approve(ProjectRequestVO vo) {
        // 프로젝트 포지션 카운트 - 1
        ProjectVO projectVO = ProjectVO.builder()
                .projectNo(vo.getProjectNo()).build();
        switch (vo.getPosition()) {
            case "FE":
                projectVO.setFrontRcnt(1);
                break;
            case "BE":
                projectVO.setBackRcnt(1);
                break;
            case "FS":
                projectVO.setFullRcnt(1);
                break;
            case "DE":
                projectVO.setDesignRcnt(1);
                break;
            case "PL":
                projectVO.setPlannerRcnt(1);
                break;
        }

        // 모집완료 시 상태변경
        ProjectVO currVo = projectMapper.selectProject(vo.getProjectNo());
        if (currVo.getTotalRcnt() == currVo.getCrntRcnt() - 1) {
            projectVO.setUpdateState("2");
        }
        projectMapper.updatePositionCount(projectVO);

        // 프로젝트 팀에 추가
        ProjectTeamVO teamVO = ProjectTeamVO.builder()
                .position(vo.getPosition())
                .memberId(vo.getMemberId())
                .isLeader("0")
                .projectNo(vo.getProjectNo())
                .state("1").build();
        teamMapper.insertProjectTeam(teamVO);

        // 요청 상태 변경
        vo.setUpdateState("2"); // 승인
        return mapper.updateProjectRequest(vo);
    }

    @Override
    public int updateRequest(ProjectRequestVO vo) {
        return mapper.updateProjectRequest(vo);
    }

}

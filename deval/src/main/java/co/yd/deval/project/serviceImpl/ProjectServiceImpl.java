package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.mapper.ProjectMapper;
import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.ProjectInfoDTO;
import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectTeamVO;
import co.yd.deval.project.service.ProjectVO;

import org.springframework.stereotype.Service;

import java.util.List;

/**
* @package : co.yd.deval.project.serviceImpl
* @name : ProjectServiceImpl.java
* @date : 2022-04-01 오후 3:09
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed : ByungHo Park
**/

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

    private final ProjectMapper mapper;
    private final ProjectTeamMapper teamMapper;

    public ProjectServiceImpl(ProjectMapper mapper, ProjectTeamMapper teamMapper) {
        this.mapper = mapper;
        this.teamMapper = teamMapper;
    }

    @Override
    public List<ProjectVO> selectProjectAll() {
        return mapper.selectProjectAll();
    }

    @Override
    public ProjectVO selectProject(int projectNo) {
        return mapper.selectProject(projectNo);
    }

    @Override
    public int insertProject(ProjectVO vo) {
        switch (vo.getLeaderPosition()) {
            case "FE":
                vo.setFrontRcnt(vo.getFrontRcnt() - 1);
                break;
            case "BE":
                vo.setBackRcnt(vo.getBackRcnt() - 1);
                break;
            case "FS":
                vo.setFullRcnt(vo.getFullRcnt() - 1);
                break;
            case "DE":
                vo.setDesignRcnt(vo.getDesignRcnt() - 1);
                break;
            case "PL":
                vo.setPlannerRcnt(vo.getPlannerRcnt() - 1);
                break;
        }
        int result = mapper.insertProject(vo);
        ProjectTeamVO teamVo = new ProjectTeamVO();
        teamVo.setProjectNo(vo.getProjectNo());
        teamVo.setMemberId(vo.getLeaderId());
        teamVo.setIsLeader("1"); // true
        teamVo.setPosition(vo.getLeaderPosition());
        teamVo.setState("0"); // 팀장 대기
        return (teamMapper.insertProjectTeam(teamVo) == 1) ? teamVo.getProjectNo() : 0;
    }

    @Override
    public int deleteProject(ProjectVO vo) {
        // todo 팀을 먼저 지우고 지워야함
        return mapper.deleteProject(vo);
    }

    @Override
    public int updateProject(ProjectVO vo) {
        return mapper.updateProject(vo);
    }

    @Override
    public ProjectTeamVO getOngoingProject(String memberId) {
        return teamMapper.getOngoingProject(memberId); // 진행중인 프로젝트
    }

    @Override
    public List<ProjectVO> searchMainPageProject(ProjectVO vo) {
        return mapper.searchMainPageProject(vo);
    }

    @Override
    public ProjectInfoDTO getProjectInfo(int projectNo) {
        mapper.updateHit(projectNo);
        ProjectInfoDTO dto = mapper.getProject(projectNo);
        ProjectTeamVO searchTeamVo = new ProjectTeamVO();
        searchTeamVo.setProjectNo(projectNo);
        dto.setProjectTeam(teamMapper.selectProjectTeam(searchTeamVo));
        return dto;
    }

    @Override
    public List<ProjectVO> getListWithPaging(ProjectVO vo) {
        return mapper.getListWithPaging(vo);
    }

    @Override
    public int getTotalCount(ProjectVO vo) {
        return mapper.getTotalCount(vo);
    }

	@Override
	public List<ProjectVO> findProjectImLeader(String id) {
		return mapper.findProjectImLeader(id);
	}

	@Override
	public List<ProjectVO> findProjectByNo(String id) {
		return mapper.findProjectByNo(id);
	}

	@Override
	public List<ProjectVO> findWaitingProject(String id) {
		return mapper.findWaitingProject(id);
	}

}

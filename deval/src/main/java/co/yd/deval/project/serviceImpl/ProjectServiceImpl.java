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

@Service("projectDao")
public class ProjectServiceImpl implements ProjectService {

    private final ProjectMapper mapper;
    private final ProjectTeamMapper teamMapper;
    private final ProjectRequestMapper requestMapper;

    public ProjectServiceImpl(ProjectMapper mapper, ProjectTeamMapper teamMapper, ProjectRequestMapper requestMapper) {
        this.mapper = mapper;
        this.teamMapper = teamMapper;
        this.requestMapper = requestMapper;
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
        vo.setTotalRcnt(
                vo.getFrontRcnt()
                + vo.getBackRcnt()
                + vo.getFullRcnt()
                + vo.getDesignRcnt()
                + vo.getPlannerRcnt()
        );
        int projectNo = mapper.insertProject(vo);

        ProjectTeamVO teamVo = new ProjectTeamVO();
        teamVo.setProjectNo(projectNo);
        teamVo.setMemberId(vo.getLeaderId());
        teamVo.setIsLeader("1"); // true
        teamVo.setPosition(vo.getLeaderPosition());
        teamVo.setState("0"); // 팀장 대기
        return teamMapper.insertProjectTeam(teamVo);
    }

    @Override
    public int deleteProject(ProjectVO vo) {
        return mapper.deleteProject(vo);
    }

    @Override
    public int updateProject(ProjectVO vo) {
        return mapper.updateProject(vo);
    }

    @Override
    public ProjectVO getOngoingProject(String memberId) {
        ProjectTeamVO ongoingProject = teamMapper.getOngoingProject(memberId); // 진행중인 프로젝트
        if (ongoingProject == null) {
            return null;
        } else {
            return mapper.selectProject(ongoingProject.getProjectNo());
        }
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

}

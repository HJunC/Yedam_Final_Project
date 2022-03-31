package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.mapper.ProjectMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectTeamVO;
import co.yd.deval.project.service.ProjectVO;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("projectDao")
public class ProjectServiceImpl implements ProjectService {

    private final ProjectMapper map;
    private final ProjectTeamMapper teamMapper;

    public ProjectServiceImpl(ProjectMapper map, ProjectTeamMapper teamMapper) {
        this.map = map;
        this.teamMapper = teamMapper;
    }

    @Override
    public List<ProjectVO> selectProjectAll() {
        return map.selectProjectAll();
    }

    @Override
    public ProjectVO selectProject(int projectNo) {
        map.updateHit(projectNo);
        return map.selectProject(projectNo);
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
        int projectNo = map.insertProject(vo);
        System.out.println("============================projectNo" + projectNo);

        ProjectTeamVO teamVo = new ProjectTeamVO();
        teamVo.setProjectNo(projectNo);
        teamVo.setMemberId(vo.getLeaderId());
        teamVo.setIsLeader("1");
        teamVo.setPosition(vo.getLeaderPosition());
        return teamMapper.insertProjectTeam(teamVo);
    }

    @Override
    public int deleteProject(ProjectVO vo) {
        return map.deleteProject(vo);
    }

    @Override
    public int updateProject(ProjectVO vo) {
        return map.updateProject(vo);
    }

    @Override
    public ProjectVO getNowUserProject(String memberId) {
        // todo
        List<ProjectTeamVO> team;
        List<ProjectVO> userProjectList = map.findByLeaderIdAndState(memberId, "1");
        return userProjectList.get(0);
    }

    @Override
    public List<ProjectVO> searchMainPageProject(ProjectVO vo) {
        return map.searchProject(vo);
    }

    @Override
    public List<ProjectVO> findByLeaderIdAndState(String leaderId, String state) {
        return map.findByLeaderIdAndState(leaderId, state);
    }

    @Override
    public List<ProjectVO> searchProject(ProjectVO vo) {
        return map.searchProject(vo);
    }

}

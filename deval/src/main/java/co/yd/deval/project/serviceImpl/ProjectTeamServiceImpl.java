package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.service.ProjectTeamMapper;
import co.yd.deval.project.service.ProjectTeamService;
import co.yd.deval.project.vo.ProjectTeamVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("projectTeamDao")
public class ProjectTeamServiceImpl implements ProjectTeamService {

    private final ProjectTeamMapper map;

    public ProjectTeamServiceImpl(ProjectTeamMapper map) {
        this.map = map;
    }

    @Override
    public List<ProjectTeamVO> selectProjectTeamAll() {
        return map.selectProjectTeamAll();
    }

    @Override
    public ProjectTeamVO selectProjectTeam(ProjectTeamVO vo) {
        return map.selectProjectTeam(vo);
    }

    @Override
    public int insertProjectTeam(ProjectTeamVO vo) {
        return map.insertProjectTeam(vo);
    }

    @Override
    public int updateProjectTeam(ProjectTeamVO vo) {
        return map.updateProjectTeam(vo);
    }

    @Override
    public int deleteProjectTeam(ProjectTeamVO vo) {
        return map.deleteProjectTeam(vo);
    }
}

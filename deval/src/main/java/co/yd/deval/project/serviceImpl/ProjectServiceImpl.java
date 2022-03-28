package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.service.ProjectMapper;
import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.vo.ProjectVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("projectDao")
public class ProjectServiceImpl implements ProjectService {

    private final ProjectMapper map;

    public ProjectServiceImpl(ProjectMapper map) {
        this.map = map;
    }

    @Override
    public List<ProjectVO> selectProjectAll() {
        return map.selectProjectAll();
    }

    @Override
    public ProjectVO selectProject(ProjectVO vo) {
        return map.selectProject(vo);
    }

    @Override
    public int insertProject(ProjectVO vo) {
        return map.insertProject(vo);
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
    public List<ProjectVO> findByLeaderIdAndState(String leaderId, String state) {
        return map.findByLeaderIdAndState(leaderId, state);
    }

    @Override
    public int updateHit(ProjectVO vo) {
        return map.updateHit(vo);
    }
}

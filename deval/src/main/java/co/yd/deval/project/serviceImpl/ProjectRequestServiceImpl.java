package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.service.ProjectRequestService;
import co.yd.deval.project.service.ProjectRequestVO;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("projectRequestDao")
public class ProjectRequestServiceImpl implements ProjectRequestService {

    private final ProjectRequestMapper map;

    public ProjectRequestServiceImpl(ProjectRequestMapper map) {
        this.map = map;
    }

    @Override
    public List<ProjectRequestVO> selectProjectRequestAll() {
        return map.selectProjectRequestAll();
    }

    @Override
    public ProjectRequestVO selectProjectRequest(ProjectRequestVO vo) {
        return map.selectProjectRequest(vo);
    }

    @Override
    public int insertProjectRequest(ProjectRequestVO vo) {
        return map.insertProjectRequest(vo);
    }

    @Override
    public int deleteProjectRequest(ProjectRequestVO vo) {
        return map.deleteProjectRequest(vo);
    }

    @Override
    public int updateProjectRequest(ProjectRequestVO vo) {
        return map.updateProjectRequest(vo);
    }
}

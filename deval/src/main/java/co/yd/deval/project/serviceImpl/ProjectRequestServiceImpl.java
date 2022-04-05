package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.service.ProjectRequestService;
import co.yd.deval.project.service.ProjectRequestVO;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private ProjectRequestMapper mapper;

    @Override
    public List<ProjectRequestVO> selectProjectRequest(ProjectRequestVO vo) {
        return mapper.selectProjectRequest(vo);
    }

    @Override
    public int insertProjectRequest(ProjectRequestVO vo) {
        // 지원자수 증가
        // 같은 지원자 인지 체크
        return mapper.insertProjectRequest(vo);
    }

    @Override
    public int deleteProjectRequest(ProjectRequestVO vo) {
        return mapper.deleteProjectRequest(vo);
    }

    @Override
    public int updateProjectRequest(ProjectRequestVO vo) {
        return mapper.updateProjectRequest(vo);
    }
}

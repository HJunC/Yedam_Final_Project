package co.yd.deval.project.serviceImpl;

import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.service.ProjectRequestService;
import co.yd.deval.project.service.ProjectRequestVO;
import org.springframework.beans.factory.annotation.Autowired;

/**
* @package : co.yd.deval.project.serviceImpl
* @name : ProjectRequestServiceImpl.java
* @date : 2022-04-04 오후 4:34
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed :
**/
public class ProjectRequestServiceImpl implements ProjectRequestService {

    @Autowired
    private ProjectRequestMapper mapper;

    @Override
    public int insertProjectRequest(ProjectRequestVO vo) {
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

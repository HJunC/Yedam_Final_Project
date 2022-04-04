package co.yd.deval.project.service;

import java.util.List;

public interface ProjectRequestService {
    List<ProjectRequestVO> selectProjectRequest(ProjectRequestVO vo);
    int insertProjectRequest(ProjectRequestVO vo);
    int deleteProjectRequest(ProjectRequestVO vo);
    int updateProjectRequest(ProjectRequestVO vo);
}

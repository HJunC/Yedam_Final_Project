package co.yd.deval.project.service;

import co.yd.deval.project.vo.ProjectRequestVO;

import java.util.List;

public interface ProjectRequestService {
    List<ProjectRequestVO> selectProjectRequestAll();
    ProjectRequestVO selectProjectRequest(ProjectRequestVO vo);
    int insertProjectRequest(ProjectRequestVO vo);
    int deleteProjectRequest(ProjectRequestVO vo);
    int updateProjectRequest(ProjectRequestVO vo);
}

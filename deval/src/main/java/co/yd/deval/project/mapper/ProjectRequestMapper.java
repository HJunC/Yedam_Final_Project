package co.yd.deval.project.mapper;

import java.util.List;

import co.yd.deval.project.service.ProjectRequestVO;

public interface ProjectRequestMapper {
    List<ProjectRequestVO> selectProjectRequestAll();
    ProjectRequestVO selectProjectRequest(ProjectRequestVO vo);
    int insertProjectRequest(ProjectRequestVO vo);
    int deleteProjectRequest(ProjectRequestVO vo);
    int updateProjectRequest(ProjectRequestVO vo);
}

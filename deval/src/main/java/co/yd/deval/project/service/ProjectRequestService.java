package co.yd.deval.project.service;

import co.yd.deval.project.vo.ProjectRequestVO;

import java.util.List;

public interface ProjectRequestService {
    List<ProjectRequestVO> projectRequestSelectList();
    ProjectRequestVO projectRequestSelect(ProjectRequestVO vo);
    int projectRequestInsert(ProjectRequestVO vo);
    int projectRequestDelete(ProjectRequestVO vo);
    int projectRequestUpdate(ProjectRequestVO vo);
}

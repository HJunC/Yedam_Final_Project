package co.yd.deval.project.service;

import co.yd.deval.project.vo.ProjectVO;

import java.util.List;

public interface ProjectService {
    List<ProjectVO> projectSelectList();
    ProjectVO projectSelect(ProjectVO vo);
    int projectInsert(ProjectVO vo);
    int projectDelete(ProjectVO vo);
    int projectUpdate(ProjectVO vo);

    ProjectVO findByLeaderId(String leaderId);
}

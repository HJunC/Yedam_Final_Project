package co.yd.deval.project.service;

import co.yd.deval.project.vo.ProjectTeamVO;

import java.util.List;

public interface ProjectTeamService {
    List<ProjectTeamVO> projectTeamSelectList();
    ProjectTeamVO projectTeamSelect(ProjectTeamVO vo);
    int projectTeamInsert(ProjectTeamVO vo);
    int projectTeamDelete(ProjectTeamVO vo);
    int projectTeamUpdate(ProjectTeamVO vo);
}

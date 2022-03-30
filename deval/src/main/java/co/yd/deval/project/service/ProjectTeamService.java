package co.yd.deval.project.service;

import java.util.List;

public interface ProjectTeamService {
    List<ProjectTeamVO> selectProjectTeamAll();
    ProjectTeamVO selectProjectTeam(ProjectTeamVO vo);
    int insertProjectTeam(ProjectTeamVO vo);
    int updateProjectTeam(ProjectTeamVO vo);
    int deleteProjectTeam(ProjectTeamVO vo);
}

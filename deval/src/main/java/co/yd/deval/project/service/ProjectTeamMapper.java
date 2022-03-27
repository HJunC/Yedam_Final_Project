package co.yd.deval.project.service;

import co.yd.deval.project.vo.ProjectTeamVO;

import java.util.List;

public interface ProjectTeamMapper {
    List<ProjectTeamVO> selectProjectTeamAll();
    ProjectTeamVO selectProjectTeam(ProjectTeamVO vo);
    int insertProjectTeam(ProjectTeamVO vo);
    int updateProjectTeam(ProjectTeamVO vo);
    int deleteProjectTeam(ProjectTeamVO vo);
}

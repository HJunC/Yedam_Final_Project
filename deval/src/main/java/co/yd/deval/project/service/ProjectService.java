package co.yd.deval.project.service;

import java.util.List;

public interface ProjectService {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(ProjectVO vo);
    int insertProject(ProjectVO vo);
    int deleteProject(ProjectVO vo);
    int updateProject(ProjectVO vo);

    int updateHit(ProjectVO vo);
    List<ProjectVO> findByLeaderIdAndState(String leaderId, String state);
    List<ProjectVO> searchProject(ProjectVO vo);
}

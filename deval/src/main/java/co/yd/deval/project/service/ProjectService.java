package co.yd.deval.project.service;

import co.yd.deval.project.vo.ProjectVO;

import java.util.List;

public interface ProjectService {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(ProjectVO vo);
    int insertProject(ProjectVO vo);
    int deleteProject(ProjectVO vo);
    int updateProject(ProjectVO vo);

    List<ProjectVO> findByLeaderIdAndState(String leaderId, String state);
    int updateHit(ProjectVO vo);
}

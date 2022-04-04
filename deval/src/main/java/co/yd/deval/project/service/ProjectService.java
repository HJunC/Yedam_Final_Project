package co.yd.deval.project.service;

import java.util.List;

public interface ProjectService {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(int projectNo);
    int insertProject(ProjectVO vo);
    int deleteProject(ProjectVO vo);
    int updateProject(ProjectVO vo);

    ProjectVO getOngoingProject(String memberId);
    List<ProjectVO> searchMainPageProject(ProjectVO vo);
    List<ProjectVO> findByLeaderIdAndState(String leaderId, String state);
    List<ProjectVO> searchProject(ProjectVO vo);
    
    List<ProjectVO> findProjectImLeader(String id);
    List<ProjectVO> findProjectByNo(String id);
    List<ProjectVO> findWaitingProject(String id);
}

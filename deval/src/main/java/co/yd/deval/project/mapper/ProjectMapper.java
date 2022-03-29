package co.yd.deval.project.mapper;

import org.apache.ibatis.annotations.Param;

import co.yd.deval.project.service.ProjectVO;

import java.util.List;

public interface ProjectMapper {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(ProjectVO vo);
    int insertProject(ProjectVO vo);
    int deleteProject(ProjectVO vo);
    int updateProject(ProjectVO vo);

    List<ProjectVO> findByLeaderIdAndState(@Param("leaderId") String leaderId, @Param("state") String state);
    int updateHit(ProjectVO vo);
}

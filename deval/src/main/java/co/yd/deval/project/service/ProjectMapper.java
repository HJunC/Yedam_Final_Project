package co.yd.deval.project.service;

import co.yd.deval.project.vo.ProjectVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectMapper {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(ProjectVO vo);
    int insertProject(ProjectVO vo);
    int deletePproject(ProjectVO vo);
    int updateProject(ProjectVO vo);

    List<ProjectVO> findByLeaderIdAndState(@Param("leaderId") String leaderId, @Param("state") String state);
    int updateHit(ProjectVO vo);
}

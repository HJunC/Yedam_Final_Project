package co.yd.deval.project.mapper;

import java.util.List;

import co.yd.deval.project.service.ProjectTeamVO;
import co.yd.deval.project.service.ProjectVO;
import org.apache.ibatis.annotations.Param;

public interface ProjectTeamMapper {
    List<ProjectTeamVO> selectProjectTeamAll();
    ProjectTeamVO selectProjectTeam(ProjectTeamVO vo);
    int insertProjectTeam(ProjectTeamVO vo);
    int updateProjectTeam(ProjectTeamVO vo);
    int deleteProjectTeam(ProjectTeamVO vo);

    List<ProjectTeamVO> findByMemberIdAndState(@Param("memberId") String memberId, @Param("state") String state);
    ProjectTeamVO getOngoingProject(String memberId);
}

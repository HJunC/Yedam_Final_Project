package co.yd.deval.project.mapper;

import co.yd.deval.common.Criteria;
import co.yd.deval.project.service.ProjectInfoDTO;
import org.apache.ibatis.annotations.Param;

import co.yd.deval.project.service.ProjectVO;

import java.util.List;

public interface ProjectMapper {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(int projectNo);
    int insertProject(ProjectVO vo);
    int deleteProject(ProjectVO vo);
    int updateProject(ProjectVO vo);

    int updatePositionCount(ProjectVO vo);
    int updateHit(int projectNo);
    int updateApplyCount(int projectNo);

    List<ProjectVO> findProjectImLeader(String id);
    List<ProjectVO> findProjectByNo(String id);
    List<ProjectVO> findWaitingProject(String id);

    List<ProjectVO> searchMainPageProject(ProjectVO vo);
    ProjectInfoDTO getProject(int projectNo);

    // 검색 페이징 처리
    List<ProjectVO> getListWithPaging(ProjectVO vo);
    int getTotalCount(ProjectVO vo);
}

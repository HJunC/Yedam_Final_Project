package co.yd.deval.project.service;

import java.util.List;

public interface ProjectService {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(int projectNo);

    /***
     * 프로젝트 추가
     * @param vo 프로젝트 vo
     * @return projectNo
     */
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

    ProjectTeamVO getOngoingProject(String memberId); // 로그인 유저의 프로젝트 정보
    List<ProjectVO> searchMainPageProject(ProjectVO vo); // 메인화면 프로젝트 구성

    /***
     * 프로젝트 팀원 포함한 정보
     * @param projectNo 프로젝트 번호
     * @return ProjectInfoDTO
     */
    ProjectInfoDTO getProjectInfo(int projectNo);

    // 검색 페이징 처리
    List<ProjectVO> getListWithPaging(ProjectVO vo);
    int getTotalCount(ProjectVO vo);

}

package co.yd.deval.project.service;

import java.util.List;

public interface ProjectService {
    List<ProjectVO> selectProjectAll();
    ProjectVO selectProject(int projectNo);
    int insertProject(ProjectVO vo);
    int deleteProject(ProjectVO vo);
    int updateProject(ProjectVO vo);

    ProjectVO getOngoingProject(String memberId); // 로그인 유저의 프로젝트 정보
    List<ProjectVO> searchMainPageProject(ProjectVO vo); // 메인화면 프로젝트 구성
    List<ProjectVO> findByLeaderIdAndState(String leaderId, String state);
    List<ProjectVO> searchProject(ProjectVO vo); // 검색 서비스

    ProjectInfoDTO getProjectInfo(int projectNo); // 프로젝트 상세정보 (projectDetail.jsp)
}

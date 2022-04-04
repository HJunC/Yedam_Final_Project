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

    ProjectVO getOngoingProject(String memberId); // 로그인 유저의 프로젝트 정보
    List<ProjectVO> searchMainPageProject(ProjectVO vo); // 메인화면 프로젝트 구성

    ProjectInfoDTO getProjectInfo(int projectNo); // 프로젝트 상세정보 (projectDetail.jsp)

    // 검색 페이징 처리
    List<ProjectVO> getListWithPaging(ProjectVO vo);
    int getTotalCount(ProjectVO vo);
}

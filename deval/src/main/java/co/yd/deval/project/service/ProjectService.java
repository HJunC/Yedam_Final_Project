package co.yd.deval.project.service;

import java.util.List;

public interface ProjectService {
    /***
     * 프로젝트 추가
     * @param vo 프로젝트 vo
     * @return projectNo
     */
    int create(ProjectVO vo);

    /***
     * 프로젝트 제거
     * @param vo 프로젝트 vo
     * @return projectNo
     */
    int remove(ProjectVO vo);

    int updateProject(ProjectVO vo);

  /***
     * 유저의 대기,진행 중인 프로젝트 여부 (프로젝트 정보가 반환되지 않음)
     * @param memberId
     * @return 프로젝트 역할정보 반환
     */
    ProjectTeamVO getOngoingProject(String memberId);

    /***
     * 메인화면 프로젝트 구성
     * @param vo 프로젝트 vo
     * @return List<ProjectVO>
     */
    List<ProjectVO> searchMainPageProject(ProjectVO vo);

    /***
     * 단순 프로젝트 정보
     * @param projectNo
     * @return
     */
    ProjectVO selectProject(int projectNo);

    /***
     * 프로젝트 팀원 포함한 정보
     * @param projectNo 프로젝트 번호
     * @return ProjectInfoDTO
     */
    ProjectInfoDTO getProject(int projectNo);

  /**
   * 완료된 프로젝트 리스트
   * @return
   */
  ProjectVO completedProjectList();

    /***
     * 검색 서비스 / 페이징 처리
     * @param vo
     * @return List<ProjectVO>
     */
    List<ProjectVO> getListWithPaging(ProjectVO vo);
    int getTotalCount(ProjectVO vo);

    /***
     * 프로젝트 시작
     * @param vo
     * @return
     */
    int startProject(ProjectVO vo);

    /***
     * 프로젝트 완료
     * @return
     */
    int completeProject(ProjectVO vo);

    void updateHit(int projectNo);
    void updateApplyCount(int projectNo);

    List<ProjectVO> findEndProject(String id);
    List<ProjectVO> findDoingProject(String id);
    List<ProjectVO> findWaitingProject(String id);

    void cancelRequest(String memberId, int exceptionProjectNo);
}

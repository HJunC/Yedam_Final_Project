package co.yd.deval.project.service;

import java.util.List;
import java.util.Map;

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

    List<ProjectVO> findProjectByNo(String id);
    List<ProjectVO> findWaitingProject(String id);

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

    /***
     * 검색 서비스 / 페이징 처리
     * @param vo
     * @return List<ProjectVO>
     */
    List<ProjectVO> getListWithPaging(ProjectVO vo);
    int getTotalCount(ProjectVO vo);

    int startProject(ProjectVO vo);

    void updateHit(int projectNo);
    void updateApplyCount(int projectNo);

    List<ProjectVO> findProjectByNo(String id);
    List<ProjectVO> findWaitingProject(String id);
}

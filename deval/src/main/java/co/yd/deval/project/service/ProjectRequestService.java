package co.yd.deval.project.service;

import java.util.List;

public interface ProjectRequestService {
    List<ProjectRequestVO> selectProjectRequest(ProjectRequestVO vo);

    /***
     * 프로젝트 참가 요청
     * @param vo
     * @return
     */
    int request(ProjectRequestVO vo);

    /***
     * 프로젝트 참가 요청 삭제
     * @param vo
     * @return
     */
    int remove(ProjectRequestVO vo);

    /***
     * 프로젝트 참가 요청 승인
     * @param vo
     * @return
     */
    int approve(ProjectRequestVO vo);

}

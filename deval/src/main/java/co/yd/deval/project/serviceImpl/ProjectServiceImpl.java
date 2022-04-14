package co.yd.deval.project.serviceImpl;

import co.yd.deval.member.service.MemberService;
import co.yd.deval.project.mapper.ProjectMapper;
import co.yd.deval.project.mapper.ProjectRequestMapper;
import co.yd.deval.project.mapper.ProjectTeamMapper;
import co.yd.deval.project.service.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* @package : co.yd.deval.project.serviceImpl
* @name : ProjectServiceImpl.java
* @date : 2022-04-01 오후 3:09
* @author : ByungHo Park
* @version : 1.0.0
* @modifyed : ByungHo Park
**/

@Service("projectService")
public class ProjectServiceImpl implements ProjectService {

    private final ProjectMapper mapper;
    private final ProjectTeamMapper teamMapper;
    private final ProjectRequestMapper requestMapper;

    public ProjectServiceImpl(ProjectMapper mapper, ProjectTeamMapper teamMapper, ProjectRequestMapper requestMapper) {
        this.mapper = mapper;
        this.teamMapper = teamMapper;
        this.requestMapper = requestMapper;
    }

    @Override
    @Transactional
    public int create(ProjectVO vo) {
        switch (vo.getLeaderPosition()) {
            case "FE":
                vo.setFrontRcnt(vo.getFrontRcnt() - 1);
                break;
            case "BE":
                vo.setBackRcnt(vo.getBackRcnt() - 1);
                break;
            case "FS":
                vo.setFullRcnt(vo.getFullRcnt() - 1);
                break;
            case "DE":
                vo.setDesignRcnt(vo.getDesignRcnt() - 1);
                break;
            case "PL":
                vo.setPlannerRcnt(vo.getPlannerRcnt() - 1);
                break;
            default:
                return 0;
        }

        // 검토중인 모든 참여요청 취소처리
        cancelRequest(vo.getLeaderId(), 0);

        // 프로젝트 등록
        mapper.insertProject(vo);

        // 프로젝트 팀 등록
        ProjectTeamVO teamVo = ProjectTeamVO.builder()
                                .projectNo(vo.getProjectNo())
                                .memberId(vo.getLeaderId())
                                .isLeader("1") // true
                                .position(vo.getLeaderPosition())
                                .state("0") // 팀장 대기
                                .build();
        return (teamMapper.insertProjectTeam(teamVo) == 1) ? teamVo.getProjectNo() : 0;
    }

    @Override
    @Transactional
    public int remove(ProjectVO vo) {
        ProjectTeamVO teamVO = ProjectTeamVO.builder()
                                .projectNo(vo.getProjectNo())
                                .build();
        teamMapper.deleteProjectTeam(teamVO);
        ProjectRequestVO requestVO = ProjectRequestVO.builder()
                                     .projectNo(vo.getProjectNo()).build();
        requestMapper.deleteProjectRequest(requestVO);
        return mapper.deleteProject(vo);
    }

    @Override
    public int updateProject(ProjectVO vo) {
        return mapper.updateProject(vo);
    }

    @Override
    public ProjectTeamVO getOngoingProject(String memberId) {
        return teamMapper.getOngoingProject(memberId); // 진행중인 프로젝트
    }

    @Override
    public List<ProjectVO> searchMainPageProject(ProjectVO vo) {
        return mapper.searchMainPageProject(vo);
    }

    @Override
    public ProjectVO selectProject(int projectNo) {
        return mapper.selectProject(projectNo);
    }

    @Override
    public ProjectInfoDTO getProject(int projectNo) {
        ProjectInfoDTO dto = mapper.getProject(projectNo);
        ProjectTeamVO searchTeamVo = ProjectTeamVO.builder()
                                    .projectNo(projectNo)
                                    .build();
        ProjectRequestVO searchRequestVo = ProjectRequestVO.builder()
                                            .projectNo(projectNo)
                                            .build();
        dto.setProjectTeam(teamMapper.selectProjectTeam(searchTeamVo));
        dto.setRequestList(requestMapper.selectProjectRequest(searchRequestVo));
        return dto;
    }

    @Override
    public List<ProjectVO> getListWithPaging(ProjectVO vo) {
        return mapper.getListWithPaging(vo);
    }

    @Override
    public int getTotalCount(ProjectVO vo) {
        return mapper.getTotalCount(vo);
    }

    @Override
    @Transactional
    public int startProject(ProjectVO vo) {
        // 팀원들 상태 변경
        ProjectTeamVO teamVO = ProjectTeamVO.builder()
                .projectNo(vo.getProjectNo())
                .updateState("2").build();
        teamMapper.updateProjectTeam(teamVO);
        // 프로젝트 상태 변경
        // 프로젝트 시작날짜, 종료날짜
        vo.setUpdateState("3");
        if (vo.getProjectSdt() == null || vo.getProjectEdt() == null) return 0;
        return mapper.updateProject(vo);
    }

    @Override
    @Transactional
    public int completeProject(ProjectVO vo) {
        // 팀원들 상태 변경, 경험치
        teamMapper.completeProject(vo.getProjectNo(), 300);
        // 프로젝트 상태 변경
        vo.setUpdateState("4");
        return mapper.updateProject(vo);
    }

    @Override
    public void updateHit(int projectNo) {
        mapper.updateHit(projectNo);
    }

    @Override
    public void updateApplyCount(int projectNo) {
        mapper.updateApplyCount(projectNo);
    }


	@Override
	public List<ProjectVO> findProjectByNo(String id) {
		return mapper.findProjectByNo(id);
	}

	@Override
	public List<ProjectVO> findWaitingProject(String id) {
		return mapper.findWaitingProject(id);
	}

    /***
     * 유저의 검토중인 요청을 취소 처리
     * @param memberId 유저 아이디
     * @param exceptionProjectNo 프로젝트 번호를 제외
     */
    public void cancelRequest(String memberId, int exceptionProjectNo) {
        ProjectRequestVO requestVO = new ProjectRequestVO();
        requestVO.setMemberId(memberId);
        requestVO.setState("1");
        requestVO.setUpdateState("9");
        if (exceptionProjectNo != 0) requestVO.setExceptionProjectNo(exceptionProjectNo);
        requestMapper.updateProjectRequest(requestVO);
    }
}

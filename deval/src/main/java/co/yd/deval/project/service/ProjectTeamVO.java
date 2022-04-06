package co.yd.deval.project.service;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class ProjectTeamVO {
    private int projectNo;
    private String memberId;
    private String position;
    private String isLeader;
    private String state;
}

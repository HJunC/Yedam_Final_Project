package co.yd.deval.project.service;

import lombok.Data;

@Data
public class ProjectTeamVO {
    private int projectNo;
    private String memberId;
    private String position;
    private String isLeader;
}

package co.yd.deval.project.service;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProjectTeamVO {
    private int projectNo;
    private String memberId;
    private String position;
    private String isLeader;
    private String state;
}

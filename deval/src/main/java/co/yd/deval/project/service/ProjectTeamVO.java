package co.yd.deval.project.service;

import lombok.*;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProjectTeamVO {
    private int projectNo;
    private String memberId;
    private String position;
    private String isLeader;
    private String state;

    private String updateState;
}

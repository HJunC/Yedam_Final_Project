package co.yd.deval.project.service;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProjectRequestVO {
    private int projectNo;
    private String memberId;
    private String state;
    private String subject;
    private String position;
    private Date requestDt;

    private String updateState;
    private int exceptionProjectNo;
}

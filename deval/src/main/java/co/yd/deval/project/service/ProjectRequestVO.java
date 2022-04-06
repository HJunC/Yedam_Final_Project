package co.yd.deval.project.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
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

package co.yd.deval.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class ProjectVO {
    private int projectNo;
    private String leaderId;
    private String projectName;
    private String state;
    private String process;
    private String subject;
    private String lang;
    private int totalRcnt;
    private int frontRcnt;
    private int backRcnt;
    private int designRcnt;
    private int plannerRcnt;
    private int fullRcnt;
    private Date projectSdt;
    private Date projectEdt;
    private int projectTerm;
    private int hit;
    private int applyRcnt;
    private Date recruitSdt;
    private Date recruitEdt;
}

package co.yd.deval.project.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Data
public class ProjectVO {
    private int projectNo;
    private String projectName;
    private String state;
    private String process;
    private Date recruitSdt;
    private Date recruitEdt;
    private String subject;
    private String lang;
    private int totalRcnt;
    private Date projectSdt;
    private int frontRcnt;
    private int backRcnt;
    private int designRcnt;
    private Date projectEdt;
    private int fullRcnt;
    private int plannerRcnt;
    private int projectTerm;
    private int hit;
    private int applyRcnt;
    private String leaderId;
}

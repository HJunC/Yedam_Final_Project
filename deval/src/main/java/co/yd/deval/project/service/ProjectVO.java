package co.yd.deval.project.service;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
public class ProjectVO {
    private int projectNo;
    private String projectName;
    private String state;
    private String process;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date recruitSdt;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date recruitEdt;

    private String subject;
    private String lang;
    private int totalRcnt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date projectSdt;

    private int frontRcnt;
    private int backRcnt;
    private int designRcnt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date projectEdt;

    private int fullRcnt;
    private int plannerRcnt;
    private int projectTerm;
    private int hit;
    private int applyRcnt;
    private String leaderId;
    private String leaderPosition;
}

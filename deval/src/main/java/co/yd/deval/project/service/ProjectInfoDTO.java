package co.yd.deval.project.service;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class ProjectInfoDTO {
    private int projectNo;
    private String projectName;
    private String state;
    private String process;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
    private Date recruitSdt;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9")
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

    private List<ProjectTeamVO> projectTeam;
}

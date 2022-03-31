package co.yd.deval.project.service;

import lombok.Data;

import java.sql.Date;

@Data
public class ProjectRequestVO {
    private int projectNo;
    private String memberId;
    private String state;
    private String subject;
    private String position;
    private Date requestDt;
}

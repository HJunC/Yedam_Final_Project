package co.yd.deval.project.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class ProjectRequestVO {
    private int projectNo;
    private String memberId;
    private String state;
    private String subject;
    private String position;
    private Date requestDt;
}

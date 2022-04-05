package co.yd.deval.project.service;

import co.yd.deval.common.Criteria;
import co.yd.deval.common.PageDTO;
import com.fasterxml.jackson.annotation.JsonFormat;
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

    // 테이블에 없는 데이터
    private String leaderPosition;
    private int rn;
    private Criteria criteria;
}

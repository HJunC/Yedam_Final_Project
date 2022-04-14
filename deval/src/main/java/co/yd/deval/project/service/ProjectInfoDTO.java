package co.yd.deval.project.service;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProjectInfoDTO {
    private int projectNo;
    private String projectName;
    private String state;
    private String process;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
    private Date recruitSdt;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
    private Date recruitEdt;

    private String subject;
    private String lang;
    private int totalRcnt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+9")
    private Date projectSdt;

    private int frontRcnt;
    private int backRcnt;
    private int designRcnt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+9")
    private Date projectEdt;

    private int fullRcnt;
    private int plannerRcnt;
    private int projectTerm;
    private int hit;
    private int applyRcnt;
    private String leaderId;
    private int crntRcnt;
    private String gitUri;

    private List<ProjectTeamVO> projectTeam;
    private List<ProjectRequestVO> requestList;

    private List<String> langArray;

    /***
     * DB에서 받은 lang 값을 langArray에 List로 저장
     * @param lang 문자형태의 언어데이터
     */
    public void setLang(String lang) {
        this.lang = lang;
        String[] temp = lang.split(",");
        this.langArray = new ArrayList<>();
        this.langArray.addAll(Arrays.asList(temp));
    }
}

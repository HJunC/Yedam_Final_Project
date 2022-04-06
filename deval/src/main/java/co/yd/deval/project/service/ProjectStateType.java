package co.yd.deval.project.service;

public enum ProjectStateType {
    P1("없음"),
    P2("지원중"),
    P3("대기팀원"),
    P4("진행중팀원"),
    P5("대기팀장"),
    P6("진행중팀장"),
    ;

    ProjectStateType(String val) {
    }
}
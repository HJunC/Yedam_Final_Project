package co.yd.deval.project.service;

public enum ProjectStateEnum {
    RECRUITING(1),
    COMPLETION_RECRUITMENT(2),
    PROJECT_PROGRESS(3),
    COMPLETED(4),
    STOP_PROJECT(9);

    ProjectStateEnum(int i) {
    }
}
package co.yd.deval.common;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

    private int startPage;
    private int endPage;
    private boolean prev, next;
    private int total;
    private Criteria cri;

}

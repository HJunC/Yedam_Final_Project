package co.yd.deval.common;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

    private final int startPage;
    private int endPage;
    private final boolean prev, next;
    private final int total;
    private final Criteria cri;

    public PageDTO(Criteria cri, int total) {
        this.total = total;
        this.cri = cri;

        this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10;
        this.startPage = this.endPage - 9;
        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

        if (realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;

    }
}

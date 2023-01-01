package mypage.domain;

public class Basket {

    private Long me_id;
    private Long ps_id;
    private int bk_amount;

    public Basket(long me_id, long ps_id, int bk_amount) {
        this.me_id = me_id;
        this.ps_id = ps_id;
        this.bk_amount = bk_amount;
    }



    public long getMe_id() {
        return me_id;
    }

    public long getPs_id() {
        return ps_id;
    }

    public int getBk_amount() {
        return bk_amount;
    }
}

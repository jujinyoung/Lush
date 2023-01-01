package product.domian;

public class Basket {

    private int bk_id;
    private int me_id;
    private int ps_id;
    private int bk_amount;

    public Basket(int me_id, int ps_id, int bk_amount) {
        this.me_id = me_id;
        this.ps_id = ps_id;
        this.bk_amount = bk_amount;
    }

    public int getBk_id() {
        return bk_id;
    }

    public int getMe_id() {
        return me_id;
    }

    public int getPs_id() {
        return ps_id;
    }

    public int getBk_amount() {
        return bk_amount;
    }
}

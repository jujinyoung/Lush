package categories.domain;

public class Categories {

    private int pc_id;
    private String pc_cate1;
    private String pc_cate2;
    private int pc_order;

    public Categories(int pc_id, String pc_cate1, String pc_cate2) {
        this.pc_id = pc_id;
        this.pc_cate1 = pc_cate1;
        this.pc_cate2 = pc_cate2;
    }

    public int getPc_id() {
        return pc_id;
    }

    public String getPc_cate1() {
        return pc_cate1;
    }

    public String getPc_cate2() {
        return pc_cate2;
    }

    public int getPc_order() {
        return pc_order;
    }
}

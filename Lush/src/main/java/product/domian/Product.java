package product.domian;

import com.util.DateFormmater;

import java.util.Date;

public class Product {

    private int pd_id;
    private int pc_id;
    private String pd_name;
    private String pd_vegan;
    private String pd_domestic;
    private String pd_cate3;
    private String pd_rdate;
    private String pd_event;
    private String pd_naked;
    private String pd_curation;
    private String pd_recommend;
    private int pd_review;
    private int pd_price;
    private int pd_trade;

    public Product(int pd_id, int pc_id, String pd_name, String pd_vegan, String pd_domestic, String pd_cate3, String pd_rdate, String pd_event, String pd_naked, String pd_curation, String pd_recommend, int pd_review, int pd_price, int pd_trade) {
        this.pd_id = pd_id;
        this.pc_id = pc_id;
        this.pd_name = pd_name;
        this.pd_vegan = pd_vegan;
        this.pd_domestic = pd_domestic;
        this.pd_cate3 = pd_cate3;
        this.pd_rdate = pd_rdate;
        this.pd_event = pd_event;
        this.pd_naked = pd_naked;
        this.pd_curation = pd_curation;
        this.pd_recommend = pd_recommend;
        this.pd_review = pd_review;
        this.pd_price = pd_price;
        this.pd_trade = pd_trade;
    }

    public int getPd_id() {
        return pd_id;
    }

    public int getPc_id() {
        return pc_id;
    }

    public String getPd_name() {
        return pd_name;
    }

    public String getPd_vegan() {
        return pd_vegan;
    }

    public String getPd_domestic() {
        return pd_domestic;
    }

    public String getPd_cate3() {
        return pd_cate3;
    }

    public String getPd_rdate() {
        return pd_rdate;
    }

    public String getPd_event() {
        return pd_event;
    }

    public String getPd_naked() {
        return pd_naked;
    }

    public String getPd_curation() {
        return pd_curation;
    }

    public String getPd_recommend() {
        return pd_recommend;
    }

    public int getPd_review() {
        return pd_review;
    }

    public int getPd_price() {
        return pd_price;
    }

    public int getPd_trade() {
        return pd_trade;
    }
}

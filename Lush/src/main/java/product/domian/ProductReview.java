package product.domian;

public class ProductReview {

    private int pdr_id;
    private int me_id;
    private int pd_id;
    private String pdr_date;
    private int pdr_grade;
    private String pdr_content;


    public ProductReview(int me_id, int pd_id, int pdr_grade, String pdr_content) {
        this.me_id = me_id;
        this.pd_id = pd_id;
        this.pdr_grade = pdr_grade;
        this.pdr_content = pdr_content;
    }

    public ProductReview(int pdr_id, int me_id, int pd_id, String pdr_date, int pdr_grade, String pdr_content) {
        this.pdr_id = pdr_id;
        this.me_id = me_id;
        this.pd_id = pd_id;
        this.pdr_date = pdr_date;
        this.pdr_grade = pdr_grade;
        this.pdr_content = pdr_content;
    }

    public int getPdr_id() {
        return pdr_id;
    }

    public int getMe_id() {
        return me_id;
    }

    public int getPd_id() {
        return pd_id;
    }

    public String getPdr_date() {
        return pdr_date;
    }

    public int getPdr_grade() {
        return pdr_grade;
    }

    public String getPdr_content() {
        return pdr_content;
    }

    public void setPdr_id(int pdr_id) {
        this.pdr_id = pdr_id;
    }
}

package product.domian;

public class ProductReviewImages {

    private int pri_id;
    private int pdr_id;
    private String pri_image;

    public ProductReviewImages(int pri_id, int pdr_id, String pri_image) {
        this.pri_id = pri_id;
        this.pdr_id = pdr_id;
        this.pri_image = pri_image;
    }

    public int getPri_id() {
        return pri_id;
    }

    public int getPdr_id() {
        return pdr_id;
    }

    public String getPri_image() {
        return pri_image;
    }
}

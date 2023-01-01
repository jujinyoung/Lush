package product.domian;

import order.domain.Member;

import java.util.ArrayList;

public class ProductReviewImage {

    private ProductReview productReview;
    private ArrayList<String> imgPath;
    private Member member;

    public ProductReviewImage(ProductReview productReview, ArrayList<String> imgPath, Member member) {
        this.productReview = productReview;
        this.imgPath = imgPath;
        this.member = member;
    }

    public ProductReview getProductReview() {
        return productReview;
    }

    public ArrayList<String> getImgPath() {
        return imgPath;
    }

    public Member getMember() {
        return member;
    }

    @Override
    public String toString() {
        return "ProductReviewImage{" +
                "productReview=" + productReview.toString() +
                ", imgPath=" + imgPath +
                ", member=" + member.toString() +
                '}';
    }
}

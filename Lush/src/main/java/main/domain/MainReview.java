package main.domain;

import order.domain.Member;
import product.domian.Product;
import product.domian.ProductReview;
import product.domian.ProductReviewImages;

public class MainReview {

    private ProductReview productReview;
    private ProductReviewImages productReviewImages;
    private Member member;
    private Product product;


    public MainReview(ProductReview productReview, ProductReviewImages productReviewImages, Member member, Product product) {
        this.productReview = productReview;
        this.productReviewImages = productReviewImages;
        this.member = member;
        this.product = product;
    }

    public ProductReview getProductReview() {
        return productReview;
    }

    public ProductReviewImages getProductReviewImages() {
        return productReviewImages;
    }

    public Member getMember() {
        return member;
    }

    public Product getProduct() {
        return product;
    }
}


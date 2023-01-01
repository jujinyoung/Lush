package product.exception;

public class ProductReviewUpdateException extends Exception{

    public ProductReviewUpdateException(String message) {
        super(message);
    }

    public ProductReviewUpdateException(String message, Throwable cause) {
        super(message, cause);
    }
}

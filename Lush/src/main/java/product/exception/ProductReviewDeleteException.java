package product.exception;

public class ProductReviewDeleteException extends Exception{

    public ProductReviewDeleteException(String message) {
        super(message);
    }

    public ProductReviewDeleteException(String message, Throwable cause) {
        super(message, cause);
    }
}

package product.exception;

public class ProductReviewInsertException extends Exception{
    public ProductReviewInsertException(String message) {
        super(message);
    }

    public ProductReviewInsertException(String message, Throwable cause) {
        super(message, cause);
    }
}

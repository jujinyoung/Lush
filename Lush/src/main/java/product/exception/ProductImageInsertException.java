package product.exception;

public class ProductImageInsertException extends Exception{

    public ProductImageInsertException(String message) {
        super(message);
    }

    public ProductImageInsertException(String message, Throwable cause) {
        super(message, cause);
    }
}

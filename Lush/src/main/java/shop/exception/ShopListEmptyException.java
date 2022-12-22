package shop.exception;

public class ShopListEmptyException extends Exception{

    public ShopListEmptyException(String message) {
        super(message);
    }

    public ShopListEmptyException(String message, Throwable cause) {
        super(message, cause);
    }
}

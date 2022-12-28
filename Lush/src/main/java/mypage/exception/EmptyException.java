package mypage.exception;

public class EmptyException extends Exception{

    public EmptyException(String message) {
        super(message);
    }

    public EmptyException(String message, Throwable cause) {
        super(message, cause);
    }
}

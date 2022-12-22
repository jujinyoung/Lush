package event.exception;

public class EventReviewException extends Exception{
    public EventReviewException(String message) {
        super(message);
    }

    public EventReviewException(String message, Throwable cause) {
        super(message, cause);
    }
}

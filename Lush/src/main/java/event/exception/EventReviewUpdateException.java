package event.exception;

public class EventReviewUpdateException extends Exception{

    public EventReviewUpdateException(String message) {
        super(message);
    }

    public EventReviewUpdateException(String message, Throwable cause) {
        super(message, cause);
    }
}

package event.exception;

public class EventReviewInsertException extends Exception{
    public EventReviewInsertException(String message) {
        super(message);
    }

    public EventReviewInsertException(String message, Throwable cause) {
        super(message, cause);
    }
}

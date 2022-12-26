package event.exception;

public class EventReviewDeleteException extends Exception{

    public EventReviewDeleteException(String message) {
        super(message);
    }

    public EventReviewDeleteException(String message, Throwable cause) {
        super(message, cause);
    }
}

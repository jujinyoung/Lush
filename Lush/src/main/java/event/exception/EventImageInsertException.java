package event.exception;

public class EventImageInsertException extends Exception{

    public EventImageInsertException(String message) {
        super(message);
    }

    public EventImageInsertException(String message, Throwable cause) {
        super(message, cause);
    }
}

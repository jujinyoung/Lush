package event.exception;

public class EventListEmptyException extends Exception{

    public EventListEmptyException(String message) {
        super(message);
    }

    public EventListEmptyException(String message, Throwable cause) {
        super(message, cause);
    }
}

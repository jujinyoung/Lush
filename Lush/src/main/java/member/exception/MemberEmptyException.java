package member.exception;

public class MemberEmptyException extends Exception{

    public MemberEmptyException(String message) {
        super(message);
    }

    public MemberEmptyException(String message, Throwable cause) {
        super(message, cause);
    }
}

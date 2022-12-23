package inquiry.service;

public class ServiceException extends Exception {
	 private static final long serialVersionUID = -2408539214300123218L;

	   public ServiceException( String message ) {
	      super(message);
	   }
	   
	   public ServiceException( String message , Exception e ) {
	      super(message, e);
	   }

}

package managernotice.service;

public class ServiceException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1615042117797594533L;

	 public ServiceException( String message ) {
	      super(message);
	   }
	   
	   public ServiceException( String message , Exception e ) {
	      super(message, e);
	   }

	}
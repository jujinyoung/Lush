package article.service;

//서비스 클래스에서 예외가 발생할 때 처리할 사용자 예외 클래스
public class ServiceException extends RuntimeException{
	
	private static final long serialVersionUID = -2408539214300123218L;

	   public ServiceException( String article ) {
	      super(article);
	   }
	   
	   public ServiceException( String article , Exception e ) {
	      super(article, e);
	   }

}

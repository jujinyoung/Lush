package article.domain;

public class Article {

    private long st_id;
    private String st_title;
    private String st_stitle;
    private String st_content;
    private String st_image;
    private String st_product;
    private long adm_id;
    
    
    
	public Article(long st_id, String st_title, String st_stitle, String st_content, String st_image, String st_product,
			long adm_id) {
		super();
		this.st_id = st_id;
		this.st_title = st_title;
		this.st_stitle = st_stitle;
		this.st_content = st_content;
		this.st_image = st_image;
		this.st_product = st_product;
		this.adm_id = adm_id;
	}


	public long getSt_id() {
		return st_id;
	}



	public String getSt_title() {
		return st_title;
	}



	public String getSt_stitle() {
		return st_stitle;
	}



	public String getSt_content() {
		return st_content;
	}



	public String getSt_image() {
		return st_image;
	}



	public String getSt_product() {
		return st_product;
	}



	public long getAdm_id() {
		return adm_id;
	}
	
	
    //getter, setter
    
   
    
    
    
}

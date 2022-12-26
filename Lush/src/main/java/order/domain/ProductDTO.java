package order.domain;

public class ProductDTO {
	
	private Long pd_id;
	private String pd_name;
	private String pd_vegan;
	private String pd_domestic;
	private String pd_category1;
	private String pd_category2;
	private String pd_category3;
	private String pd_image;
	
	
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
	public Long getPd_id() {
		return pd_id;
	}
	public void setPd_id(Long pd_id) {
		this.pd_id = pd_id;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getPd_vegan() {
		return pd_vegan;
	}
	public void setPd_vegan(String pd_vegan) {
		this.pd_vegan = pd_vegan;
	}
	public String getPd_domestic() {
		return pd_domestic;
	}
	public void setPd_domestic(String pd_domestic) {
		this.pd_domestic = pd_domestic;
	}
	public String getPd_category1() {
		return pd_category1;
	}
	public void setPd_category1(String pd_category1) {
		this.pd_category1 = pd_category1;
	}
	public String getPd_category2() {
		return pd_category2;
	}
	public void setPd_category2(String pd_category2) {
		this.pd_category2 = pd_category2;
	}
	public String getPd_category3() {
		return pd_category3;
	}
	public void setPd_category3(String pd_category3) {
		this.pd_category3 = pd_category3;
	}
	public String getPd_image() {
		return pd_image;
	}
	public void setPd_image(String pd_image) {
		this.pd_image = pd_image;
	}
	
	

}

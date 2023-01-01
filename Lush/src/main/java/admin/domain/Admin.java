package admin.domain;

public class Admin {
	
	private int adm_id;
	private String adm_pw;
	private String adm_name;
	
	public int getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(int adm_id) {
		this.adm_id = adm_id;
	}
	public String getAdm_pw() {
		return adm_pw;
	}
	public void setAdm_pw(String adm_pw) {
		this.adm_pw = adm_pw;
	}
	public String getAdm_name() {
		return adm_name;
	}
	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}
	public Admin(int adm_id, String adm_pw, String adm_name) {
		
		this.adm_id = adm_id;
		this.adm_pw = adm_pw;
		this.adm_name = adm_name;
	}
	public Admin(int adm_id, String adm_pw) {
		this.adm_id = adm_id;
		this.adm_pw = adm_pw;
	}
	public boolean matchPassword(String password) {
		return adm_pw.equals(password);
	}

}

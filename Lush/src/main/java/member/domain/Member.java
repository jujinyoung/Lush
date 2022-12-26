
package member.domain;

public class Member { // DTO / VO
	private int me_id;
	private String me_pass;
	private String me_name;
	private String me_add;
	private String me_tel;
	private String me_email;
	private String me_nick;
	private String me_loginid;
	
	
	
	
	
	public Member() {
		
	}

	public Member(String me_pass, String me_name, String me_add, String me_tel, String me_email, String me_nick,
			String me_loginid) {
	
		this.me_pass = me_pass;
		this.me_name = me_name;
		this.me_add = me_add;
		this.me_tel = me_tel;
		this.me_email = me_email;
		this.me_nick = me_nick;
		this.me_loginid = me_loginid;
	}
	
	public Member(String me_pass, String me_loginid) {
		this.me_pass = me_pass;
		this.me_loginid = me_loginid;
	}




	public Member(String me_name, String me_email, String me_loginid) {
		this.me_name = me_name;
		this.me_email = me_email;
		this.me_loginid = me_loginid;
	}


	public int getMe_id() {
		return me_id;
	}
	public void setMe_id(int me_id) {
		this.me_id = me_id;
	}
	public String getMe_pass() {
		return me_pass;
	}
	public void setMe_pass(String me_pass) {
		this.me_pass = me_pass;
	}
	public String getMe_name() {
		return me_name;
	}
	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}
	public String getMe_add() {
		return me_add;
	}
	public void setMe_add(String me_add) {
		this.me_add = me_add;
	}
	public String getMe_tel() {
		return me_tel;
	}
	public void setMe_tel(String me_tel) {
		this.me_tel = me_tel;
	}
	public String getMe_email() {
		return me_email;
	}
	public void setMe_email(String me_email) {
		this.me_email = me_email;
	}
	public String getMe_nick() {
		return me_nick;
	}
	public void setMe_nick(String me_nick) {
		this.me_nick = me_nick;
	}
	public String getMe_loginid() {
		return me_loginid;
	}
	public void setMe_loginid(String me_loginid) {
		this.me_loginid = me_loginid;
	}
	
	
	public boolean matchPassword(String password) {
		return me_pass.equals(password);
	}

	public void changePassword(String newPwd) {
		this.me_pass = newPwd;
	}
	
}

package managerpage.domain;

public class Member {
	private long me_id;
	private String me_pass;
	private String me_name;
	private String me_add;
	private String me_tel;
	private String me_email;
	private String me_nick;
	private String me_loginid;
	
	public Member(long me_id, String me_pass, String me_name, String me_add, String me_tel, String me_email,
			String me_nick, String me_loginid) {
		super();
		this.me_id = me_id;
		this.me_pass = me_pass;
		this.me_name = me_name;
		this.me_add = me_add;
		this.me_tel = me_tel;
		this.me_email = me_email;
		this.me_nick = me_nick;
		this.me_loginid = me_loginid;
		
		
	}

	public long getMe_id() {
		return me_id;
	}

	public String getMe_pass() {
		return me_pass;
	}

	public String getMe_name() {
		return me_name;
	}

	public String getMe_add() {
		return me_add;
	}

	public String getMe_tel() {
		return me_tel;
	}

	public String getMe_email() {
		return me_email;
	}

	public String getMe_nick() {
		return me_nick;
	}

	public String getMe_loginid() {
		return me_loginid;
	}
	
	

}

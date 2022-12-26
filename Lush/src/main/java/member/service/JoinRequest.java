
package member.service;

import java.util.Map;

public class JoinRequest { // 회원가입할 때 필요한 
	private String me_loginid;
	private String me_pass;
	private String me_confirmpass;
	private String me_name;
	private String me_add;
	private String me_tel;
	private String me_email;
	private String me_nick;




	public String getMe_pass() {
		return me_pass;
	}


	public void setMe_pass(String me_pass) {
		this.me_pass = me_pass;
	}


	public String getMe_confirmpass() {
		return me_confirmpass;
	}

	public void setMe_confirmpass(String me_confirmpass) {
		this.me_confirmpass = me_confirmpass;
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



	public void validate(Map<String, Boolean> errors) { // 값이 올바른지 확인 
		checkEmpty(errors, me_name, "me_name");
		checkEmpty(errors, me_pass, "me_pass");
		checkEmpty(errors, me_confirmpass, "me_confirmpass");
		checkEmpty(errors, me_tel, "me_tel");
		checkEmpty(errors, me_email, "me_email");
		checkEmpty(errors, me_nick, "me_nick");
		if(!errors.containsKey("me_confirmpass")) {
			if(!isPassWordEquealToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}	
		}
	}





	private boolean isPassWordEquealToConfirm() {
		return me_pass != null && me_pass.equals(me_confirmpass);
	}
	
	
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if(value== null || value.isEmpty())
			errors.put(fieldName, Boolean.TRUE);
	}
}

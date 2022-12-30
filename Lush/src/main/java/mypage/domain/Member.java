package mypage.domain;

public class Member {

    private long mid;
    private String password;
    private String name;
    private String address;
    private String telnum;
    private String email;
    private String nickname;
    private String loginId;

    public Member(long id, String password, String name, String address, String telnum, String email, String nickname, String loginId) {
        this.mid = id;
        this.password = password;
        this.name = name;
        this.address = address;
        this.telnum = telnum;
        this.email = email;
        this.nickname = nickname;
        this.loginId = loginId;
    }

	public long getMid() {
		return mid;
	}

	public String getPassword() {
		return password;
	}
	
	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getTelnum() {
		return telnum;
	}

	public String getEmail() {
		return email;
	}

	public String getNickname() {
		return nickname;
	}

	public String getLoginId() {
		return loginId;
	}
    
}

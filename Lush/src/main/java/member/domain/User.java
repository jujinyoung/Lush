
package member.domain;

public class User {
	
	private String loginid;
	private String name;
	private int id;
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User(String loginid, String name, int id) {
		this.loginid = loginid;
		this.name = name;
		this.id = id;
	}
	public User() {

	}
	public User(String loginid, String name) {
		this.loginid = loginid;
		this.name = name;
	}

	@Override
	public String toString() {
		return "User{" +
				"loginid='" + loginid + '\'' +
				", name='" + name + '\'' +
				", id=" + id +
				'}';
	}
}

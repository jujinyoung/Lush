package managernotice.domain;

import java.util.Date;

public class ManNotice {

	private long n_nid;
	private String n_title;
	private String n_writer;
	private Date n_date;
	private String n_content;
	private long n_num;
	
	//getter, setter
	public long getN_nid() {
		return n_nid;
	}
	public void setN_nid(long n_nid) {
		this.n_nid = n_nid;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public long getN_num() {
		return n_num;
	}
	public void setN_num(long n_num) {
		this.n_num = n_num;
	}
	
	
	
	
}

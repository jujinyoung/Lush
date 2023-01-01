package notice.domain;

import java.util.Date;

public class Notice {
	private int n_nid;
	private String n_title;
	private String n_writer;
	private Date n_date;
	private int n_hits;
	private String n_content;
	private int n_num;			// null 이면 일반, 1이면 공지
	
	public Notice() {
		super();
		
	}

	public Notice(int n_nid, String n_title, String n_writer, Date n_date, int n_hits, String n_content, int n_num) {
		super();
		this.n_nid = n_nid;
		this.n_title = n_title;
		this.n_writer = n_writer;
		this.n_date = n_date;
		this.n_hits = n_hits;
		this.n_content = n_content;
		this.n_num = n_num;
	}

	public int getN_nid() {
		return n_nid;
	}

	public void setN_nid(int n_nid) {
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

	public int getN_hits() {
		return n_hits;
	}

	public void setN_hits(int n_hits) {
		this.n_hits = n_hits;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	
	
	
}

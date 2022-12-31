package managernotice.domain;

import java.util.Date;

public class ManNotice {

	private long n_nid;
	private String n_title;
	private String n_writer;
	private Date n_date;
	private String n_content;
	private long n_num;
	
	public ManNotice(long n_nid, String n_title, String n_writer, Date n_date, String n_content, long n_num) {
		super();
		this.n_nid = n_nid;
		this.n_title = n_title;
		this.n_writer = n_writer;
		this.n_date = n_date;
		this.n_content = n_content;
		this.n_num = n_num;
	}

	public long getN_nid() {
		return n_nid;
	}

	public String getN_title() {
		return n_title;
	}

	public String getN_writer() {
		return n_writer;
	}

	public Date getN_date() {
		return n_date;
	}

	public String getN_content() {
		return n_content;
	}

	public long getN_num() {
		return n_num;
	}

	
	
}

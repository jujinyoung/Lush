package notice.domain;

import java.util.Date;

public class Recruit {

	private int rec_id;
	private String rec_title;
	private String rec_writer;
	private Date rec_date;
	private int rec_hits;
	private String rec_content;
	
	public Recruit() {
		super();
	}

	public Recruit(int rec_id, String rec_title, String rec_writer, Date rec_date, int rec_hits, String rec_content) {
		super();
		this.rec_id = rec_id;
		this.rec_title = rec_title;
		this.rec_writer = rec_writer;
		this.rec_date = rec_date;
		this.rec_hits = rec_hits;
		this.rec_content = rec_content;
	}

	public int getRec_id() {
		return rec_id;
	}

	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}

	public String getRec_title() {
		return rec_title;
	}

	public void setRec_title(String rec_title) {
		this.rec_title = rec_title;
	}

	public String getRec_writer() {
		return rec_writer;
	}

	public void setRec_writer(String rec_writer) {
		this.rec_writer = rec_writer;
	}

	public Date getRec_date() {
		return rec_date;
	}

	public void setRec_date(Date rec_date) {
		this.rec_date = rec_date;
	}

	public int getRec_hits() {
		return rec_hits;
	}

	public void setRec_hits(int rec_hits) {
		this.rec_hits = rec_hits;
	}

	public String getRec_content() {
		return rec_content;
	}

	public void setRec_content(String rec_content) {
		this.rec_content = rec_content;
	}

	
	
}

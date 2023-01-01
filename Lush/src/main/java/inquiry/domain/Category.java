package inquiry.domain;

public class Category {
	private int qc_id;
	private String qc_cname;
	
	public Category(int qc_id, String qc_cname) {
		super();
		this.qc_id = qc_id;
		this.qc_cname = qc_cname;
	}

	public int getQc_id() {
		return qc_id;
	}

	public void setQc_id(int qc_id) {
		this.qc_id = qc_id;
	}

	public String getQc_cname() {
		return qc_cname;
	}

	public void setQc_cname(String qc_cname) {
		this.qc_cname = qc_cname;
	}
	
	
	
	
	
}

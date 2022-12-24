package inquiry.domain;

public class Inquiry {

	private int q_qid;
	private String q_date;
	private String q_category;
	private String q_title;
	private String q_status;
	private String me_name;
	private String q_content;
	private String q_attach;
	private String q_answer;
	private int me_id;
	
	
	public Inquiry(int q_qid, String q_date, String q_category, String q_title, String q_status, String me_name,
			String q_content, String q_attach, String q_answer,  int me_id) {
		this.q_qid = q_qid;
		this.q_date = q_date;
		this.q_category = q_category;
		this.q_title = q_title;
		this.q_status = q_status;
		this.me_name = me_name;
		this.q_content = q_content;
		this.q_attach = q_attach;
		this.q_answer = q_answer;
		this.me_id = me_id;
	}
	
	public Inquiry() {
		// TODO Auto-generated constructor stub
	}

	public int getQ_qid() {
		return q_qid;
	}
	public void setQ_qid(int q_qid) {
		this.q_qid = q_qid;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public String getQ_category() {
		return q_category;
	}
	public void setQ_category(String q_category) {
		this.q_category = q_category;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_status() {
		return q_status;
	}
	public void setQ_status(String q_status) {
		this.q_status = q_status;
	}
	public String getMe_name() {
		return me_name;
	}
	public void setMe_name(String me_name) {
		this.me_name = me_name;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_attach() {
		return q_attach;
	}
	public void setQ_attach(String q_attach) {
		this.q_attach = q_attach;
	}
	public String getQ_answer() {
		return q_answer;
	}
	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}

	public int getMe_id() {
		return me_id;
	}

	public void setMe_id(int me_id) {
		this.me_id = me_id;
	}
	
	
}

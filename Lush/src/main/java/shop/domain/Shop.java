package shop.domain;

import java.sql.Date;

public class Shop {
	
	private int sp_id;
	private Date sp_rdate;
	private Date sp_edate;
	private String sp_name;
	private String sp_adr_k;
	private String sp_adr_e;
	private String sp_bhour1;
	private String sp_bhour2;
	private String sp_tel;
	private String sp_sns;
	private String sp_info;
	private String sp_map;
	private char sp_status;
	private int adm_id;
	
	public Shop() {
		super();
	}
	
	public Shop(int sp_id, Date sp_rdate, Date sp_edate, String sp_name, String sp_adr_k,
			String sp_adr_e, String sp_bhour1, String sp_bhour2, String sp_tel, String sp_sns, String sp_info,
			String sp_map, char sp_status, int adm_id) {
		super();
		this.sp_id = sp_id;
		this.sp_rdate = sp_rdate;
		this.sp_edate = sp_edate;
		this.sp_name = sp_name;
		this.sp_adr_k = sp_adr_k;
		this.sp_adr_e = sp_adr_e;
		this.sp_bhour1 = sp_bhour1;
		this.sp_bhour2 = sp_bhour2;
		this.sp_tel = sp_tel;
		this.sp_sns = sp_sns;
		this.sp_info = sp_info;
		this.sp_map = sp_map;
		this.sp_status = sp_status;
		this.adm_id = adm_id;
	}

	public int getSp_id() {
		return sp_id;
	}
	public void setSp_id(int sp_id) {
		this.sp_id = sp_id;
	}
	public Date getSp_rdate() {
		return sp_rdate;
	}
	public void setSp_rdate(Date sp_rdate) {
		this.sp_rdate = sp_rdate;
	}
	public Date getSp_edate() {
		return sp_edate;
	}
	public void setSp_edate(Date sp_edate) {
		this.sp_edate = sp_edate;
	}
	public String getSp_name() {
		return sp_name;
	}
	public void setSp_name(String sp_name) {
		this.sp_name = sp_name;
	}
	public String getSp_adr_k() {
		return sp_adr_k;
	}
	public void setSp_adr_k(String sp_adr_k) {
		this.sp_adr_k = sp_adr_k;
	}
	public String getSp_adr_e() {
		return sp_adr_e;
	}
	public void setSp_adr_e(String sp_adr_e) {
		this.sp_adr_e = sp_adr_e;
	}
	public String getSp_bhour1() {
		return sp_bhour1;
	}
	public void setSp_bhour1(String sp_bhour1) {
		this.sp_bhour1 = sp_bhour1;
	}
	public String getSp_bhour2() {
		return sp_bhour2;
	}
	public void setSp_bhour2(String sp_bhour2) {
		this.sp_bhour2 = sp_bhour2;
	}
	public String getSp_tel() {
		return sp_tel;
	}
	public void setSp_tel(String sp_tel) {
		this.sp_tel = sp_tel;
	}
	public String getSp_sns() {
		return sp_sns;
	}
	public void setSp_sns(String sp_sns) {
		this.sp_sns = sp_sns;
	}
	public String getSp_info() {
		return sp_info;
	}
	public void setSp_info(String sp_info) {
		this.sp_info = sp_info;
	}
	public String getSp_map() {
		return sp_map;
	}
	public void setSp_map(String sp_map) {
		this.sp_map = sp_map;
	}
	public char getSp_status() {
		return sp_status;
	}
	public void setSp_status(char sp_status) {
		this.sp_status = sp_status;
	}
	public int getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(int adm_id) {
		this.adm_id = adm_id;
	}
	
}

package managerOrder.domain;

import java.util.Date;

public class ManOrder {

	private String m_order_details_id;
	private String order_person_email;
	private String order_person_addr;
	private Date order_date;
	private long total_price;
	private long ps_id;
	private String os_name;
	
	public ManOrder(String m_order_details_id, String order_person_email, String order_person_addr, Date order_date,
			long total_price, long ps_id, String os_name) {
		super();
		this.m_order_details_id = m_order_details_id;
		this.order_person_email = order_person_email;
		this.order_person_addr = order_person_addr;
		this.order_date = order_date;
		this.total_price = total_price;
		this.ps_id = ps_id;
		this.os_name = os_name;
	}

	public String getM_order_details_id() {
		return m_order_details_id;
	}

	public String getOrder_person_email() {
		return order_person_email;
	}

	public String getOrder_person_addr() {
		return order_person_addr;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public long getTotal_price() {
		return total_price;
	}

	public long getPs_id() {
		return ps_id;
	}

	public String getOs_name() {
		return os_name;
	}
	
	
	
}

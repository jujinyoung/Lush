package managergoods.domain;

public class ManagerGoods {
	
	private long pd_id;
    private String pd_name;
    private long ps_weight;
    private long ps_price;
    private long ps_amount;
    private long pc_id;
    private String pc_cate1;
    private String pc_cate2;
    
    
	public ManagerGoods(long pd_id, String pd_name, long ps_weight, long ps_price, long ps_amount, long pc_id, String pc_cate1, String pc_cate2) {
		super();
		this.pd_id = pd_id;
		this.pd_name = pd_name;
		this.ps_weight = ps_weight;
		this.ps_price = ps_price;
		this.ps_amount = ps_amount;
		this.pc_id = pc_id;
		this.pc_cate1 = pc_cate1;
		this.pc_cate2 = pc_cate2;
	}

	public long getPd_id() {
		return pd_id;
	}

	public String getPd_name() {
		return pd_name;
	}

	public long getPs_weight() {
		return ps_weight;
	}

	public long getPs_price() {
		return ps_price;
	}

	public long getPs_amount() {
		return ps_amount;
	}
	
	public long getPc_id() {
		return pc_id;
	}

	public String getPc_cate1() {
		return pc_cate1;
	}

	public String getPc_cate2() {
		return pc_cate2;
	}
    
}

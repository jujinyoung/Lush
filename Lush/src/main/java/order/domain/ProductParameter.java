package order.domain;

public class ProductParameter {

    private long pid;
    private long psid;
    private int amount;  // 주문 개수
    
	public ProductParameter(long pid, long psid, int amount) {
		this.pid = pid;
		this.psid = psid;
		this.amount = amount;
	}

	public long getPid() {
		return pid;
	}

	public long getPsid() {
		return psid;
	}

	public int getAmount() {
		return amount;
	}
      
}

package order.domain;

public class ProductParameter {

    private long psid;
    private int amount;  // 주문 개수
    
	public ProductParameter(long psid, int amount) {
		this.psid = psid;
		this.amount = amount;
	}

	public long getPsid() {
		return psid;
	}

	public int getAmount() {
		return amount;
	}
      
}

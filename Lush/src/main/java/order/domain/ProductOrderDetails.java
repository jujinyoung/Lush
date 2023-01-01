package order.domain;

public class ProductOrderDetails {

    private long podid;
    private int amount;
    private long psid;
    private long poid;
    

    public ProductOrderDetails(long podid, int amount, long psid, long poid) {
    	this.podid = podid;
    	this.amount = amount;
    	this.psid = psid;
    	this.poid = poid;
    }


	public long getPodid() {
		return podid;
	}


	public int getAmount() {
		return amount;
	}


	public long getPsid() {
		return psid;
	}


	public long getPoid() {
		return poid;
	}
    
}

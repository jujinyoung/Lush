package order.domain;

public class ProductOrderDetails {

    private long podid;
    private long amount;
    private long psid;
    private long poid;
    

    public ProductOrderDetails(long podid, long amount, long psid, long poid) {
    	this.podid = podid;
    	this.amount = amount;
    	this.psid = psid;
    	this.poid = poid;
    }


	public long getPodid() {
		return podid;
	}


	public long getAmount() {
		return amount;
	}


	public long getPsid() {
		return psid;
	}


	public long getPoid() {
		return poid;
	}
    
}

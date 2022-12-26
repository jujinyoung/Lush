package order.domain;

public class ProductSangse {

    private long psid;
    private long weight;
    private long price;
    private long pid;
    private long amount;


    public ProductSangse(long psid, long  weight, long price, long pid, long amount) {
    	this.psid = psid;
    	this.weight = weight;
    	this.price = price;
    	this.pid = pid;
    	this.amount = amount;

    }

	public long getPsid() {
		return psid;
	}


	public long getWeight() {
		return weight;
	}


	public long getPrice() {
		return price;
	}


	public long getPid() {
		return pid;
	}
    
	public long getAmount() {
		return amount;
	}  

}

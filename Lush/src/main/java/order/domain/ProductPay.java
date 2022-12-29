package order.domain;

public class ProductPay {

    private long payid;
    private long poid;
    private long amount;
    private String paydate;
    private String payname;
    private String bank;
    private long psid;
    private long mid;
    private long ptid;
    private String psname;
    

    public ProductPay(long payid, long poid, long amount, String paydate, String payname, String bank, long psid, long mid, long ptid, String psname) {
    	this.payid = payid;
    	this.poid = poid;
    	this.amount = amount;
    	this.paydate = paydate;
    	this.payname= payname;
    	this.bank = bank;
    	this.psid = psid;
    	this.mid = mid;
    	this.ptid = ptid;
    	this.psname = psname;
    }


	public long getPayid() {
		return payid;
	}


	public long getPoid() {
		return poid;
	}


	public long getAmount() {
		return amount;
	}


	public String getPaydate() {
		return paydate;
	}


	public String getPayname() {
		return payname;
	}


	public String getBank() {
		return bank;
	}


	public long getPsid() {
		return psid;
	}


	public long getMid() {
		return mid;
	}


	public long getPtid() {
		return ptid;
	}
    
	public String getPsname() {
		return psname;
	}
    
}

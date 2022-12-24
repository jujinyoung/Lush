package order.domain;

public class ProductOrder {

    private long poid;
    private long mid;
    private String odate;
    private long total;
    private String oname;
    private String email;
    private String tel;
    private String msg;
    private long did;
    private String add;
    private String fcheck;
    private long osid;
    

    public ProductOrder(long poid,long mid, String odate, long total, String oname, 
    		String email, String tel, String msg, long did, String add, String fcheck,long osid) {
    	this.poid = poid;
    	this.mid = mid;
    	this.odate = odate;
    	this.total = total;
    	this.oname = oname;
    	this.email = email;
    	this.tel = tel;
    	this.msg = msg;
    	this.did = did;
    	this.add = add;
    	this.fcheck = fcheck;
    	this.osid = osid;
    }


	public long getPoid() {
		return poid;
	}


	public long getMid() {
		return mid;
	}


	public String getOdate() {
		return odate;
	}


	public long getTotal() {
		return total;
	}


	public String getOname() {
		return oname;
	}


	public String getEmail() {
		return email;
	}


	public String getTel() {
		return tel;
	}


	public String getMsg() {
		return msg;
	}


	public long getDid() {
		return did;
	}


	public String getAdd() {
		return add;
	}


	public String getFcheck() {
		return fcheck;
	}


	public long getOsid() {
		return osid;
	}

    
}

package order.domain;

public class ShipAdd {

    private long shid;
    private String address;
    private String sname;
    private String oname;
    private String telnum1;
    private String telnum2;
    private String shipdefault;
    private long mid;

    public ShipAdd(long shid, String address, String sname, String oname, String telnum1, String telnum2, String shipdefault, long mid) {
        this.shid = shid;
        this.address = address;
        this.sname = sname;
        this.oname = oname;
        this.telnum1 = telnum1;
        this.telnum2 = telnum2;
        this.shipdefault = shipdefault;
        this.mid = mid;
    }

	public long getShid() {
		return shid;
	}

	public String getAddress() {
		return address;
	}

	public String getSname() {
		return sname;
	}

	public String getOname() {
		return oname;
	}

	public String getTelnum1() {
		return telnum1;
	}

	public String getTelnum2() {
		return telnum2;
	}

	public String getShipdefault() {
		return shipdefault;
	}

	public long getMid() {
		return mid;
	}

    
}

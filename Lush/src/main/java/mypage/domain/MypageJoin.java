package mypage.domain;

public class MypageJoin {

    private long pid;
    private long psid;
    private String name;
    private String cat3;
    private long weight;
    private long price;
    private long oid;
    private long odid;
    private String odate;
    private long os_id;
    private String os_name;
    private int amount;  // 주문 개수
    
	public MypageJoin(long pid, long psid, String name, String cat3, long weight, long price, long oid, long odid, String odate,
			long os_id, String os_name, int amount) {
		this.pid = pid;
		this.psid = psid;
		this.name = name;
		this.cat3 = cat3;
		this.weight = weight;
		this.price = price;
		this.oid = oid;
		this.odid = odid;
		this.odate = odate;
		this.os_id = os_id;
		this.os_name = os_name;
		this.amount = amount;
	}

	public long getPid() {
		return pid;
	}

	public long getPsid() {
		return psid;
	}

	public String getName() {
		return name;
	}

	public String getCat3() {
		return cat3;
	}

	public long getWeight() {
		return weight;
	}

	public long getPrice() {
		return price;
	}

	public long getOid() {
		return oid;
	}
	
	public long getOdid() {
		return odid;
	}

	public String getOdate() {
		return odate;
	}

	public long getOs_id() {
		return os_id;
	}

	public String getOs_name() {
		return os_name;
	}

	public int getAmount() {
		return amount;
	}

	
    
}

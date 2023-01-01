package order.domain;

public class ProductJoin {

    private long pid;
    private String name;
    private String cat3;
    private long psid;
    private long weight;
    private long price;
    private int amount;  // 주문 개수
    
	public ProductJoin(long pid, String name, String cat3, long psid, long weight, long price,int amount) {
		this.pid = pid;
		this.name = name;
		this.cat3 = cat3;
		this.psid = psid;
		this.weight = weight;
		this.price = price;
		this.amount = amount;
	}

	public long getPid() {
		return pid;
	}

	public String getName() {
		return name;
	}

	public String getCat3() {
		return cat3;
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

	public long getAmount() {
		return amount;
	}
    
}

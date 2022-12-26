package order.domain;

public class Product {

    private long pid;
    private String name;
    private String vegan;
    private String domestic;
    private String category1;
    private String category2;
    private String category3;
    private String img;
    private int price;

    public Product(long pid, String name, String vegan, String domestic, String category1, String category2, String category3, String img, int price) {
        this.pid = pid;
        this.name = name;
        this.vegan = vegan;
        this.domestic = domestic;
        this.category1 = category1;
        this.category2 = category2;
        this.category3 = category3;
        this.img = img;
        this.price = price;
    }

    public long getPid() {
        return pid;
    }

    public String getName() {
        return name;
    }

    public String getVegan() {
        return vegan;
    }

    public String getDomestic() {
        return domestic;
    }

    public String getCategory1() {
        return category1;
    }

    public String getCategoty2() {
        return category2;
    }

    public String getCategory3() {
        return category3;
    }

    public String getImg() {
        return img;
        
        
    }

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}



}
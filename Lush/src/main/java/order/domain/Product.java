package order.domain;

public class Product {

    private long pid;
    private String name;
    private String vegan;
    private String domestic;
    private String cat1;
    private String cat2;
    private String cat3;
    private String img;

    public Product(long pid, String name,  String vegan, String domestic, String cat1, String cat2, String cat3, String img) {
    	this.pid = pid;
    	this.name = name;
    	this.vegan = vegan;
    	this.domestic = domestic;
    	this.cat1 = cat1;
    	this.cat2 = cat2;
    	this.cat3 = cat3;
    	this.img = img;
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

	public String getCat1() {
		return cat1;
	}

	public String getCat2() {
		return cat2;
	}

	public String getCat3() {
		return cat3;
	}

	public String getImg() {
		return img;
	}


    
}

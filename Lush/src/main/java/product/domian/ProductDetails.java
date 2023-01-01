package product.domian;

import com.util.DateFormmater;
import order.domain.ProductSangse;

import java.util.Date;

public class ProductDetails {

    private Product product;
    private ProductSangse productSangse;
    private boolean dateIsCheck;

    public ProductDetails(Product product, ProductSangse productSangse) {
        this.product = product;
        this.productSangse = productSangse;
        this.dateIsCheck = newProduct();
    }

    public Product getProduct() {
        return product;
    }

    public ProductSangse getProductSangse() {
        return productSangse;
    }

    public boolean isDateIsCheck() {
        return dateIsCheck;
    }

    public boolean newProduct(){
        Date date = new Date();
        if (DateFormmater.stringToDate(this.product.getPd_rdate()).compareTo(date) < 7){
            return true;
        }else{
            return false;
        }
    }
}

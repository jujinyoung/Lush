package product.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import order.domain.ProductSangse;
import product.dao.ProductSangseDao;
import product.dao.ProductSangseDaoImpl;

import java.sql.Connection;
import java.util.ArrayList;

public class ProductService {

    private static ProductService instance = new ProductService();
    private ProductService(){}
    public static ProductService getInstance(){return instance;}

    ProductSangseDao productSangseDao = ProductSangseDaoImpl.getInstance();

    public ArrayList<ProductSangse> selectProductSangse(int productID){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ArrayList<ProductSangse> productSangses = productSangseDao.selectSangseList(conn, productID);
            return productSangses;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return null;
    }
}

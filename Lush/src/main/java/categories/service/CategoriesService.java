package categories.service;

import categories.dao.CategoriesDao;
import categories.dao.CategoriesDaoImpl;
import categories.domain.Categories;
import categories.domain.CategoriesTop;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import order.domain.ProductSangse;
import product.dao.ProductDao;
import product.dao.ProductDaoImpl;
import product.dao.ProductSangseDao;
import product.dao.ProductSangseDaoImpl;
import product.domian.Product;
import product.domian.ProductDetails;

import java.sql.Array;
import java.sql.Connection;
import java.util.ArrayList;

public class CategoriesService {

    private static CategoriesService instance = new CategoriesService();
    private CategoriesService(){}
    public static CategoriesService getInstance(){return  instance;}

    private CategoriesDao categoriesDao = CategoriesDaoImpl.getInstance();
    private ProductDao productDao = ProductDaoImpl.getInstance();
    private ProductSangseDao productSangseDao = ProductSangseDaoImpl.getInstance();

    public ArrayList<CategoriesTop> selectCategoriesTop(int categoriesID){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            String categories1 = categoriesDao.findCategories1(conn, categoriesID);
            ArrayList<Categories> categoriesList = categoriesDao.selectByCategories1(conn, categories1);

            ArrayList<CategoriesTop> list = null;
            if (!categoriesList.isEmpty()){
                list = new ArrayList<>();
                int totalRecords = 0;
                for (Categories catelist: categoriesList) {
                    int categoriesRecords = productDao.getProductCategoriesRecord(conn, catelist.getPc_id());
                    totalRecords += categoriesRecords;
                    list.add(new CategoriesTop(catelist, categoriesRecords));
                }
                list.get(0).setCategories2Record(totalRecords);
            }

            return list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return null;
    }

    public ArrayList<ProductDetails> selectProductDetailsList(int categoriesID, int selectStatus, int currentPage, int numberPerPage){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            //카테고리 ID로 카테고리2의 이름을 검색해서 이름이 전체라면 카테고리1번과 관련된 모든 id를 가져와야함.
            Categories categories = categoriesDao.selectCategoriesById(conn, categoriesID);
            ArrayList<Integer> categoriesIdList = new ArrayList<>();
            if (categories.getPc_cate2().equals("전체")) {
                ArrayList<Categories> categoriesList = categoriesDao.selectByCategories1(conn, categories.getPc_cate1());
                for (Categories c: categoriesList) {
                    categoriesIdList.add(c.getPc_id());
                }
            }else {
                categoriesIdList.add(categoriesID);
            }

            ArrayList<Product> productList = productDao.productList(conn, categoriesIdList, selectStatus, currentPage, numberPerPage);

            ArrayList<ProductDetails> list = null;
            if (!productList.isEmpty()){
                list = new ArrayList<>();
                for (Product product: productList) {
                    ProductSangse sangse = productSangseDao.selectProductSangseById(conn, product.getPd_id());
                    list.add(new ProductDetails(product, sangse));
                }
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return null;
    }
}

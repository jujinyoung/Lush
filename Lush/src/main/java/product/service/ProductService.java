package product.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import file.FileNotFoundException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import order.dao.MemberDao;
import order.dao.MemberDaoImpl;
import order.domain.Member;
import order.domain.ProductSangse;
import product.dao.*;
import product.domian.Basket;
import product.domian.ProductReview;
import product.domian.ProductReviewImage;
import product.exception.ProductImageInsertException;
import product.exception.ProductReviewDeleteException;
import product.exception.ProductReviewInsertException;
import product.exception.ProductReviewUpdateException;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class ProductService {

    private static ProductService instance = new ProductService();
    private ProductService(){}
    public static ProductService getInstance(){return instance;}

    ProductSangseDao productSangseDao = ProductSangseDaoImpl.getInstance();
    ProductReviewDao productReviewDao = ProductReviewDaoImpl.getInstance();
    ProductReviewImagesDao productReviewImagesDao = ProductReviewImagesDaoImpl.getInstance();
    MemberDao memberDao = MemberDaoImpl.getInstance();
    BasketDao basketDao = BasketDaoImpl.getInstance();
    ProductDao productDao = ProductDaoImpl.getInstance();

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

    public ArrayList<ProductReviewImage> selectProductReview(int productID){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ArrayList<ProductReview> productReviews = productReviewDao.selectReviewList(conn, productID, 1, 5);
            ArrayList<ProductReviewImage> reviewList = null;
            if (productReviews!=null){
                reviewList = new ArrayList<>();
                for (ProductReview productReview: productReviews) {
                    int prID = productReview.getPdr_id();
                    ArrayList<String> imageList = productReviewImagesDao.selectImages(conn, prID);
                    Member member = memberDao.selectMemberById(conn, productReview.getMe_id());
                    reviewList.add(new ProductReviewImage(productReview, imageList, member));
                }
            }

            return reviewList;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return null;
    }

    public ArrayList<String> selectImages(int productID){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ArrayList<Integer> pdrId = productReviewDao.getPdr_id(conn, productID);
            ArrayList<String> reviewTopImages = null;
            if (!pdrId.isEmpty()){
                reviewTopImages = productReviewImagesDao.getReviewTopImages(conn, pdrId);
            }

            return reviewTopImages;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return null;
    }

    public int getTotalRecords(int productID){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            int totalRecords = productReviewDao.getTotalRecords(conn, productID);
            return totalRecords;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return 0;
    }

    public void insertReview(ProductReview productReview, List<String> fileUrl){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);

            int productReviewID = productReviewDao.insert(conn, productReview);
            if (productReviewID==0){
                throw new ProductReviewInsertException("제품리뷰 데이터 입력 에러");
            }

            if (!fileUrl.isEmpty()){
                int result = 0;
                for (String url: fileUrl) {
                    result = productReviewImagesDao.insert(conn, url, productReviewID);
                    if (result == 0) throw new ProductImageInsertException("제품리뷰 이미지 입력 에러");
                }
            }
            int reviewCount = productDao.countReview(conn, productReview.getPd_id());
            int plusReview = productDao.plusReview(conn, productReview.getPd_id(), reviewCount);
            if (plusReview==0) throw new Exception();

            conn.commit();
        }catch (ProductReviewInsertException | ProductImageInsertException e){
            JdbcUtil.rollback(conn);
        } catch (Exception e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
    }


    public void updateReview(ProductReview productReview, List<String> fileUrl,String path){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);
            int updateResult = productReviewDao.update(conn, productReview);
            if (updateResult == 0) throw new ProductReviewUpdateException("이벤트 리뷰 업데이드중 에러발생!!!");

            int userImagesCount = productReviewImagesDao.getUserImagesCount(conn, productReview.getPdr_id());
            if (userImagesCount!=0){
                ArrayList<String> urls = productReviewImagesDao.getUrl(conn, productReview.getPdr_id());
                for (String url: urls) {
                    File file = new File(path+"\\" + url);
                    if (file.exists()) file.delete();
                    else throw new FileNotFoundException("해당 파일이 존재하지 않습니다.");
                }
                productReviewImagesDao.delete(conn, productReview.getPdr_id());
            }

            if (!fileUrl.isEmpty()){
                int result = 0;
                for (String url: fileUrl) {
                    result = productReviewImagesDao.insert(conn, url, productReview.getPdr_id());
                    if (result == 0) throw new ProductImageInsertException("이벤트 이미지 입력 에러");
                }
            }

            conn.commit();
        }catch (ProductReviewUpdateException | ProductImageInsertException e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }
        catch (Exception e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
    }

    public void deleteReview(int productReviewID, String path, int productID){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);
            int deleteResult = productReviewDao.delete(conn, productReviewID);
            if (deleteResult==0) throw new ProductReviewDeleteException("리뷰 삭제중 에러 발생!!!");

            int userImagesCount = productReviewImagesDao.getUserImagesCount(conn, productReviewID);
            if (userImagesCount!=0){
                ArrayList<String> urls = productReviewImagesDao.getUrl(conn, productReviewID);
                for (String url: urls) {
                    File file = new File(path+"\\" + url);
                    if (file.exists()) file.delete();
                    else throw new FileNotFoundException("해당 파일이 존재하지 않습니다.");
                }
                productReviewImagesDao.delete(conn, productReviewID);
            }

            int reviewCount = productDao.countReview(conn, productID);
            int minusReview = productDao.minusReview(conn, productID, reviewCount);
            if (minusReview==0) throw new Exception();

            conn.commit();
        }catch (ProductReviewDeleteException e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        } catch (Exception e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
    }

    public JSONArray ajaxReviewList(int currentPage, int numberPerPage, int productID){

        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();

            ArrayList<ProductReview> productReviews = productReviewDao.selectReviewList(conn, productID, currentPage, numberPerPage);

            JSONArray jsonArray = null;
            if (!productReviews.isEmpty()){
                jsonArray = new JSONArray();
                JSONObject jsonObject = new JSONObject();
                for (ProductReview productReview: productReviews) {
                    jsonObject.put("productReview" , productReview);
                    ArrayList<String> list = productReviewImagesDao.selectImages(conn, productReview.getPdr_id());
                    jsonObject.put("imgPath", list);
                    Member member = memberDao.selectMemberById(conn, productReview.getMe_id());
                    jsonObject.put("member", member);

                    jsonArray.add(jsonObject);
                }
            }

            return jsonArray;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return null;
    }

    public int insertCart(ArrayList<Basket> baskets){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);
            int result = 0;
            for (Basket basket: baskets) {

                int selectAmount = basketDao.selectAmount(conn, basket);
                if (selectAmount==0){
                    result = basketDao.insert(conn, basket);
                }else{
                    result = basketDao.update(conn, basket, selectAmount);
                }
                if (result==0){
                    throw new Exception();
                }
            }

            conn.commit();
            return result;
        }catch (Exception e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return 0;
    }
}

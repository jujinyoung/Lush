package main.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import main.domain.MainReview;
import order.dao.MemberDao;
import order.dao.MemberDaoImpl;
import order.domain.Member;
import product.dao.*;
import product.domian.Product;
import product.domian.ProductReview;
import product.domian.ProductReviewImages;

import java.sql.Connection;
import java.util.ArrayList;

public class MainService {

    private static MainService instance = new MainService();
    private MainService(){}
    public static MainService getInstance(){return instance;}

    ProductReviewImagesDao productReviewImagesDao = ProductReviewImagesDaoImpl.getInstance();
    ProductReviewDao productReviewDao = ProductReviewDaoImpl.getInstance();
    ProductDao productDao = ProductDaoImpl.getInstance();
    MemberDao memberDao = MemberDaoImpl.getInstance();

    public ArrayList<MainReview> reviewList(){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ArrayList<ProductReviewImages> images = productReviewImagesDao.mainReviewList(conn);
            ArrayList<MainReview> mainReviews = null;
            if (!images.isEmpty()){
                mainReviews = new ArrayList<>();
                for (ProductReviewImages image: images) {
                    ProductReview productReview = productReviewDao.mainReview(conn, image.getPdr_id());
                    Member member = memberDao.selectMemberById(conn, productReview.getMe_id());
                    Product product = productDao.selectProduct(conn, productReview.getPd_id());

                    mainReviews.add(new MainReview(productReview, image, member, product));
                }
            }

            return mainReviews;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return null;
    }
}

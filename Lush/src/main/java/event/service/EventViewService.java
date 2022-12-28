package event.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import event.dao.EventReviewDAO;
import event.dao.EventReviewDAOImpl;
import event.dao.EventReviewImageDAO;
import event.dao.EventReviewImageDAOImpl;
import event.domain.EventReview;
import event.domain.EventReviewImage;
import event.exception.EventImageInsertException;
import event.exception.EventReviewDeleteException;
import event.exception.EventReviewInsertException;
import event.exception.EventReviewUpdateException;
import file.FileNotFoundException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class EventViewService {

    private static EventViewService instance = new EventViewService();
    private EventViewService(){}
    public static EventViewService getInstance(){return instance;}

    EventReviewDAO reviewDAO = EventReviewDAOImpl.getInstance();
    EventReviewImageDAO imageDAO = EventReviewImageDAOImpl.getInstance();

    public void insertReview(EventReview eventReview, List<String> fileUrl){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);

            int eventReviewID = reviewDAO.insert(conn, eventReview);
            if (eventReviewID==0){
                throw new EventReviewInsertException("이벤트리뷰 데이터 입력 에러");
            }

            if (!fileUrl.isEmpty()){
                int result = 0;
                for (String url: fileUrl) {
                    result = imageDAO.insert(conn, url, eventReviewID);
                    if (result == 0) throw new EventImageInsertException("이벤트 이미지 입력 에러");
                }
            }

            conn.commit();
        }catch (EventReviewInsertException | EventImageInsertException e){
            JdbcUtil.rollback(conn);
        } catch (Exception e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
    }

    public ArrayList<EventReviewImage> selectReview(int currentPage, int numberPerPage){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ArrayList<EventReviewImage> reviewList = new ArrayList<>();
            List<EventReview> eventReviews = reviewDAO.selectReviewList(conn, currentPage, numberPerPage);
            if (eventReviews!=null){
                for (EventReview eventReview: eventReviews) {
                    int eventID = eventReview.getEr_id();
                    ArrayList<String> imageList = imageDAO.selectImages(conn, eventID);
                    reviewList.add(new EventReviewImage(eventReview, imageList));
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

    public void updateReview(EventReview eventReview, List<String> fileUrl,String path){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);
            int updateResult = reviewDAO.update(conn, eventReview);
            if (updateResult == 0) throw new EventReviewUpdateException("이벤트 리뷰 업데이드중 에러발생!!!");

            int userImagesCount = imageDAO.getUserImagesCount(conn, eventReview.getEr_id());
            if (userImagesCount!=0){
                ArrayList<String> urls = imageDAO.getUrl(conn, eventReview.getEr_id());
                for (String url: urls) {
                    File file = new File(path+"\\" + url);
                    if (file.exists()) file.delete();
                    else throw new FileNotFoundException("해당 파일이 존재하지 않습니다.");
                }
                imageDAO.delete(conn, eventReview.getEr_id());
            }

            if (!fileUrl.isEmpty()){
                int result = 0;
                for (String url: fileUrl) {
                    result = imageDAO.insert(conn, url, eventReview.getEr_id());
                    if (result == 0) throw new EventImageInsertException("이벤트 이미지 입력 에러");
                }
            }

            conn.commit();
        }catch (EventReviewUpdateException | EventImageInsertException e){
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

    public void deleteReview(int eventReviewID, String path){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);
            int deleteResult = reviewDAO.delete(conn, eventReviewID);
            if (deleteResult==0) throw new EventReviewDeleteException("리뷰 삭제중 에러 발생!!!");

            int userImagesCount = imageDAO.getUserImagesCount(conn, eventReviewID);
            if (userImagesCount!=0){
                ArrayList<String> urls = imageDAO.getUrl(conn, eventReviewID);
                for (String url: urls) {
                    File file = new File(path+"\\" + url);
                    if (file.exists()) file.delete();
                    else throw new FileNotFoundException("해당 파일이 존재하지 않습니다.");
                }
                imageDAO.delete(conn, eventReviewID);
            }

            conn.commit();
        }catch (EventReviewDeleteException e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        } catch (Exception e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
    }

    public int getTotalReview(int eventID){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();

            int totalRecords = reviewDAO.getTotalRecords(conn, eventID);
            return totalRecords;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return 0;
    }

    public JSONArray ajaxReviewList(int currentPage, int numberPerPage){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();

            List<EventReview> eventReviews = reviewDAO.selectReviewList(conn, currentPage, numberPerPage);

            JSONArray jsonArray = null;
            if (!eventReviews.isEmpty()){
                jsonArray = new JSONArray();
                JSONObject jsonObject = new JSONObject();
                for (EventReview eventReview: eventReviews) {
                    jsonObject.put("eventReview" , eventReview);
                    ArrayList<String> list = imageDAO.selectImages(conn, eventReview.getEr_id());
                    jsonObject.put("imgPath", list);

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
}

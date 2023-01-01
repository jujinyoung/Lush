package mypage.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import mypage.domain.JinhangSum;
import mypage.domain.Member;
import mypage.domain.MypageJoin;
import mypage.exception.EmptyException;

import mypage.dao.JinhangSumDao;
import mypage.dao.JinhangSumDaoImpl;
import mypage.dao.MemberDao;
import mypage.dao.MemberDaoImpl;
import mypage.dao.MypageJoinDao;
import mypage.dao.MypageJoinDaoImpl;
import mypage.dao.ProductOrderDao;
import mypage.dao.ProductOrderDaoImpl;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;


public class MypageService {
    private static MypageService instance = new MypageService();
    private MypageService(){}
    public static MypageService getInstance(){return instance;}

    public Member selectMember(String sid){
        Connection conn = null;
        MemberDao dao = MemberDaoImpl.getInstance();
        Member member = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            member = dao.selectMember(conn, sid);
            if (member == null){
                throw new EmptyException("멤버가 없습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }finally {
			JdbcUtil.close(conn);
		}
        return member;
    }
    
    public JinhangSum selectJinhangSum(long mid){
        Connection conn = null;
        JinhangSumDao dao = JinhangSumDaoImpl.getInstance();
        JinhangSum jinhangsum = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            jinhangsum = dao.selectJinhangSum(conn, mid);
            if (jinhangsum == null){
                throw new EmptyException("주문 상태 불러오기 실패.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }finally {
			JdbcUtil.close(conn);
		}
        
        return jinhangsum;
    }
    
    public HashMap<Long, List<MypageJoin>> selectMypageJoin(long mid, List<Long> orderIdList) {
		Connection conn = null;
		MypageJoinDao dao = MypageJoinDaoImpl.getInstance();
		HashMap<Long, List<MypageJoin>> map = null;

		try {
			conn = ConnectionProvider.getConnection();
			map = dao.selectMypageJoin(conn, mid, orderIdList);
			if (map == null) {
				throw new EmptyException("주문 조인이 없습니다.");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}

		return map;
	}
    
    public List<Long> getIdList(long mid) {
		Connection conn = null;
		ProductOrderDao dao = ProductOrderDaoImpl.getInstance();
		List<Long> list = null;

		try {
			conn = ConnectionProvider.getConnection();
			list = dao.getIdList(conn, mid);
			if (list == null) {
				return null;
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}

		return list;
	}
    
    public HashMap<Long, List<MypageJoin>> searchMypageJoin2(long mid, List<Long> orderIdList, String sdate, String edate, int osid) {
		Connection conn = null;
		MypageJoinDao dao = MypageJoinDaoImpl.getInstance();
		HashMap<Long, List<MypageJoin>> map = null;

		try {
			conn = ConnectionProvider.getConnection();
			map = dao.searchMypageJoin2(conn, mid, orderIdList, sdate, edate, osid);
			if (map == null) {
				throw new EmptyException("주문 조인이 없습니다2.");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}

		return map;
	}
    
    

}

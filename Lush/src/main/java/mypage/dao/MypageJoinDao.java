package mypage.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import mypage.domain.MypageJoin;

public interface MypageJoinDao {

    public  HashMap<Long, List<MypageJoin>> selectMypageJoin(Connection con, Long mid, List<Long> orderIdList) throws SQLException;
    public  HashMap<Long, List<MypageJoin>> searchMypageJoin2(Connection con, Long mid, List<Long> orderIdList, String sdate, String edate, int osid) throws SQLException;
    
}

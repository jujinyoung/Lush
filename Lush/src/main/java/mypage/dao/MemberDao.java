package mypage.dao;

import mypage.domain.Member;

import java.sql.Connection;
import java.sql.SQLException;

public interface MemberDao {

    public Member selectMember(Connection con, String sid) throws SQLException;
}

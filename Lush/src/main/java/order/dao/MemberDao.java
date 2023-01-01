package order.dao;

import order.domain.Member;

import java.sql.Connection;
import java.sql.SQLException;

public interface MemberDao {

    public Member selectMember(Connection con, String sid) throws SQLException;

    public Member selectMemberById(Connection conn, int me_id) throws SQLException;
}

package managernotice.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import managernotice.domain.ManNotice;

public interface ManNoticeDAO {

	int insert( Connection con, ManNotice notice) throws SQLException;

}

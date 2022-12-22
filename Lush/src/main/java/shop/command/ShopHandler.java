package shop.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import command.CommandHandler;
import shop.dao.ShopDaoImpl;

public class ShopHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int currentPage = 1;
		try {}catch(Exception e) {}
		Connection conn = ConnectionProvider.getConnection();
		ShopDaoImpl dao = new ShopDaoImpl(conn);
		
		
		return null;
	}

}

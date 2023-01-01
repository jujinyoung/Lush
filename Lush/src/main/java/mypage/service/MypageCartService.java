package mypage.service;

import com.util.ConnectionProvider;

import order.domain.Member;
import order.domain.Product;
import order.domain.ProductJoin;
import order.domain.ProductParameter;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import mypage.dao.BasketDao;
import mypage.dao.BasketDaoImpl;
import mypage.domain.Basket;
import mypage.exception.EmptyException;

import order.dao.MemberDao;
import order.dao.MemberDaoImpl;

import order.dao.ProductDao;
import order.dao.ProductDaoImpl;
import order.dao.ProductJoinDao;
import order.dao.ProductJoinDaoImpl;


import order.dao.ProductSangseDao;
import order.dao.ProductSangseDaoImpl;
import order.dao.ShipAddDao;
import order.dao.ShipAddDaoImpl;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class MypageCartService {
	private static MypageCartService instance = new MypageCartService();

	private MypageCartService() {
	}

	public static MypageCartService getInstance() {
		return instance;
	}

	public Member selectMember(String sid) {
		Connection conn = null;
		MemberDao dao = MemberDaoImpl.getInstance();
		Member member = null;

		try {
			conn = ConnectionProvider.getConnection();
			member = dao.selectMember(conn, sid);
			if (member == null) {
				throw new EmptyException("멤버가 없습니다.");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}

		return member;
	}


	public Product selectProduct(Long pid) {
		Connection conn = null;
		ProductDao dao = ProductDaoImpl.getInstance();
		Product product = null;

		try {
			conn = ConnectionProvider.getConnection();
			product = dao.selectProduct(conn, pid);
			if (product == null) {
				throw new EmptyException("제품이 없습니다.");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}

		return product;
	}

	public ProductSangse selectProductSangse(Long pid, int weight) {
		Connection conn = null;
		ProductSangseDao dao = ProductSangseDaoImpl.getInstance();
		ProductSangse productsangse = null;

		try {
			conn = ConnectionProvider.getConnection();
			productsangse = dao.selectProductSangse(conn, pid, weight);
			if (productsangse == null) {
				throw new EmptyException("제품상세가 없습니다.");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}

		return productsangse;
	}

	public List<ProductJoin> selectProductJoin(List<ProductParameter> productparameterlist) {
		Connection conn = null;
		ProductJoinDao dao = ProductJoinDaoImpl.getInstance();
		List<ProductJoin> list = null;

		try {
			conn = ConnectionProvider.getConnection();
			list = dao.selectProductJoin(conn, productparameterlist);
			if (list == null) {
				throw new EmptyException("제품 조인이 없습니다.");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<Basket> selectBasket(long mid) {
		Connection conn = null;
		BasketDao dao = BasketDaoImpl.getInstance();
		List<Basket> list = null;

		try {
			conn = ConnectionProvider.getConnection();
			list = dao.selectBasket(conn, mid);
			if (list == null) {
				return null;
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} 

		return list;
	}
	
	public int plusAmount(long mid, long psid) {
		Connection conn = null;
		BasketDao dao = BasketDaoImpl.getInstance();
		int rowCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			rowCount = dao.plusAmount(conn, mid, psid);
			if (rowCount == 0) {
				throw new EmptyException("장바구니 개수증가실패");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}

		return rowCount;
	}

	public int minusAmount(long mid, long psid) {
		Connection conn = null;
		BasketDao dao = BasketDaoImpl.getInstance();
		int rowCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			rowCount = dao.minusAmount(conn, mid, psid);
			if (rowCount == 0) {
				throw new EmptyException("장바구니 개수감소실패");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}

		return rowCount;
	}
	
	public int deleteBasket(long mid, List<Long> psidlist) {
		Connection conn = null;
		BasketDao dao = BasketDaoImpl.getInstance();
		int rowCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			rowCount = dao.deleteBasket(conn, mid, psidlist);
			if (rowCount != psidlist.size()) {
				throw new EmptyException("장바구니 개수감소실패");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}

		return rowCount;
	}

}

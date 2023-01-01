package order.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import order.domain.Member;
import order.domain.Product;
import order.domain.ProductJoin;
import order.domain.ProductParameter;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import order.exception.EmptyException;
import order.dao.MemberDao;
import order.dao.MemberDaoImpl;
import order.dao.ProductDao;
import order.dao.ProductDaoImpl;
import order.dao.ProductJoinDao;
import order.dao.ProductJoinDaoImpl;
import order.dao.ProductOrderDao;
import order.dao.ProductOrderDaoImpl;
import order.dao.ProductSangseDao;
import order.dao.ProductSangseDaoImpl;
import order.dao.ShipAddDao;
import order.dao.ShipAddDaoImpl;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class OrderViewService {
	private static OrderViewService instance = new OrderViewService();

	private OrderViewService() {
	}

	public static OrderViewService getInstance() {
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
		} finally {
			JdbcUtil.close(conn);
		}

		return member;
	}

	public ShipAdd selectShipAdd(Long mid) {
		Connection conn = null;
		ShipAddDao dao = ShipAddDaoImpl.getInstance();
		ShipAdd shipadd = null;

		try {
			conn = ConnectionProvider.getConnection();
			shipadd = dao.selectShipAdd(conn, mid);
			if (shipadd == null) {
				throw new EmptyException("배송지가 없습니다.");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}

		return shipadd;
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
		}finally {
			JdbcUtil.close(conn);
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
		}finally {
			JdbcUtil.close(conn);
		}

		return productsangse;
	}
	
//	public List<Long> selectProductSangseId(Long pid, String[] weights) {
//		Connection conn = null;
//		ProductSangseDao dao = ProductSangseDaoImpl.getInstance();
//		List<Long> psidlist = null;
//
//		try {
//			conn = ConnectionProvider.getConnection();
//			psidlist = dao.selectProductSangseId(conn, pid, weights);
//			if (psidlist == null) {
//				throw new EmptyException("제품상세 아이디가 없습니다.");
//			}
//		} catch (NamingException | SQLException e) {
//			e.printStackTrace();
//		} catch (EmptyException e) {
//			e.printStackTrace();
//		}
//
//		return psidlist;
//	}

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
		}finally {
			JdbcUtil.close(conn);
		}

		return list;
	}

	public int addShipAdd(ShipAdd shipadd) {
		Connection conn = null;
		ShipAddDao dao = ShipAddDaoImpl.getInstance();
		int rowCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			rowCount = dao.addShipAdd(conn, shipadd);
			if (rowCount == 0) {
				throw new EmptyException("배송지 추가 실패");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}

		return rowCount;
	}

	public int updateShipAdd(long mid) {
		Connection conn = null;
		ShipAddDao dao = ShipAddDaoImpl.getInstance();
		int rowCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			rowCount = dao.updateShipAdd(conn, mid);
			if (rowCount == 0) {
				throw new EmptyException("배송지 업데이트 실패");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}

		return rowCount;
	}

	public long getOrderNum() {
		Connection conn = null;
		ProductOrderDao dao = ProductOrderDaoImpl.getInstance();
		long num = 0;

		try {
			conn = ConnectionProvider.getConnection();
			num = dao.getOrderNum(conn);
			if (num == 0) {
				throw new EmptyException("주문 번호 불러오기 실패");
			}
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		} catch (EmptyException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}

		return num;
	}

}

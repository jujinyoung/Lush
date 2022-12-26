package order.dao;

import order.domain.Product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import order.domain.ProductDTO;

public interface ProductDAO {
   
   // 1. 제품 목록
   // List<Product> selectProduct(Connection con, Long pd_id) throws SQLException;
   // pd_id에 해당하는 
   // 페이징 처리
   
   // 2. 제품 상세보기
   // ProductDTO selectProduct(Connection con, Long pd_id) throws SQLException;
   // pd_id에 해당하는 category1, category2, category3 에 해당하는 DB 정보 가져오기
   
   // 페이징 처리
   
}
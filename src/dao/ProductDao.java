package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Product;


public class ProductDao {

	private static ProductDao instance = new ProductDao();
	
	public static ProductDao getInstance() { return instance; }
	
	private ProductDao() { }
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
		String dbId = "scott";
		String dbPass = "1111";
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		return conn;
	}
	
	public void insertProduct(Product product) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(product);
		
		int number = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select ifnull(max(num),0) from PRODUCT_LIBIDO");
			rs = pstmt.executeQuery();
			if (rs.next()) { number = rs.getInt(1) + 1; }
			else { number = 1; }
			
			pstmt = conn.prepareStatement("insert into PRODUCT_LIBIDO values "
										  + "(?,?,?,?,?,?,?,?,?,?,0,?,?,?,?,?,?,?,now())");
			pstmt.setInt(1, number);
			pstmt.setString(2, product.getSeason());
			pstmt.setString(3, product.getPkind());
			pstmt.setString(4, product.getBrand());
			pstmt.setString(5, product.getCode());
			pstmt.setString(6, product.getColor());
			pstmt.setString(7, product.getPname());
			pstmt.setString(8, product.getSex());
			pstmt.setInt(9, product.getPrice());
			pstmt.setInt(10, product.getCartcount());
			pstmt.setInt(11, product.getSellqty());
			pstmt.setInt(12, product.getStock());
			pstmt.setString(13, product.getPhoto1());
			pstmt.setString(14, product.getPhoto2());
			pstmt.setString(15, product.getPhoto3());
			pstmt.setString(16, product.getPhoto4());
			pstmt.setString(17, product.getPhoto5());
			
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
	}
	
	public List<Product> getProducts(int start, int pageSize) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> li = null;
		Product product = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from PRODUCT_LIBIDO order by num desc "
					+ "limit ?, ?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				li = new ArrayList<Product>(); // array : 중복 허용/ set : 중복 불가
				do {
					product = new Product();
					product.setNum(rs.getInt("num"));
					product.setSeason(rs.getString("season"));
					product.setPkind(rs.getString("pkind"));
					product.setBrand(rs.getString("brand"));
					product.setCode(rs.getString("code"));
					product.setColor(rs.getString("color"));
					product.setPname(rs.getString("pname"));
					product.setSex(rs.getString("sex"));
					product.setPrice(rs.getInt("price"));
					product.setCartcount(rs.getInt("cartCount"));
					product.setReadcount(rs.getInt("readCount"));
					product.setSellqty(rs.getInt("sellqty"));
					product.setStock(rs.getInt("stock"));
					product.setPhoto1(rs.getString("photo1"));
					product.setPhoto2(rs.getString("photo2"));
					product.setPhoto3(rs.getString("photo3"));
					product.setPhoto4(rs.getString("photo4"));
					product.setPhoto5(rs.getString("photo5"));
					product.setReg_date(rs.getTimestamp("reg_date"));
					
					li.add(product);
				} while (rs.next());
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		
		return li;
	}
	
	public int getProductCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select ifnull(count(*), 0) from PRODUCT_LIBIDO");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		
		return x;
	}
	
}

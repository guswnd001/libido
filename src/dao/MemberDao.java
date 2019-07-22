package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.Member;

public class MemberDao {
	
	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}
	
	public Member selectById(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select * from MEMBER_LIBIDO where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			Member member = null;
			if (rs.next()) { 
				member = new Member(rs.getString("name"),
									rs.getString("birth"),
									rs.getString("id"),
									rs.getString("password"),
									rs.getString("email"),
									rs.getString("tel1"),
									rs.getString("tel2"),
									rs.getString("tel3"),
									rs.getString("address1"),
									rs.getString("address2"),
									rs.getString("zipcode"),
									rs.getTimestamp("reg_date"));
			}
			return member;
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void insertMem(Connection conn, Member mem) throws SQLException {
		try (PreparedStatement pstmt = 
				conn.prepareStatement(
						"insert into MEMBER_LIBIDO values (?,?,?,?, ?,?,?,?, ?,?,?,?)")) {
			pstmt.setString(1, mem.getName());
			pstmt.setString(2, mem.getBirth());
			pstmt.setString(3, mem.getId());
			pstmt.setString(4, mem.getPassword());
			pstmt.setString(5, mem.getEmail());
			pstmt.setString(6, mem.getTel1());
			pstmt.setString(7, mem.getTel2());
			pstmt.setString(8, mem.getTel3());
			pstmt.setString(9, mem.getAddress1());
			pstmt.setString(10, mem.getAddress2());
			pstmt.setString(11, mem.getZipcode());
			pstmt.setTimestamp(12, new Timestamp(mem.getReg_date().getTime()));
			
			pstmt.executeUpdate();
		}
	}
	
	public List<String> getId() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		Member member = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("select id from MEMBER_LIBIDO");
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<String>();
				do {
					member = new Member();
					
					member.setId(rs.getString("id"));
					
					list.add(member.getId());
				} while (rs.next());
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { } 
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		System.out.println(list);
		return list;
	}
	
	public Member getMem(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement("select * from MEMBER_LIBIDO where id=?");
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new Member();
				member.setName(rs.getString("name"));
				member.setBirth(rs.getString("birth"));
				member.setId(id);
				member.setEmail(rs.getString("email"));
				member.setTel1(rs.getString("tel1"));
				member.setTel2(rs.getString("tel2"));
				member.setTel3(rs.getString("tel3"));
				member.setAddress1(rs.getString("address1"));
				member.setAddress2(rs.getString("address2"));
				member.setZipcode(rs.getString("zipcode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) { }
			if (conn != null) try { conn.close(); } catch (SQLException ex) { }
		}
		
		return member;
	}
}

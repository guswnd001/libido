package m2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import jdbc.JdbcUtil;
import m2.model.Member;

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
	
}
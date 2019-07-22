package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import dao.MemberDao;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import model.JoinRequest;
import model.Member;
import exception.DuplicateIdException;

public class JoinService {

	private MemberDao memberDao = new MemberDao();
	
	public void join(JoinRequest joinReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			Member member = memberDao.selectById(conn, joinReq.getId());
			if (member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			
			memberDao.insertMem(conn,
					new Member(joinReq.getName(), 
							   joinReq.getBirth(), 
							   joinReq.getId(), 
							   joinReq.getPassword(), 
							   joinReq.getEmail(), 
							   joinReq.getTel1(), 
							   joinReq.getTel2(), 
							   joinReq.getTel3(), 
							   joinReq.getAddress1(), 
							   joinReq.getAddress2(), 
							   joinReq.getZipcode(), 
							   new Timestamp(new Date().getTime())));
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
}

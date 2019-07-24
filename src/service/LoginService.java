package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import exception.InvalidIdException;
import exception.LoginFailException;
import jdbc.ConnectionProvider;
import model.Member;
import model.User;

public class LoginService {

	private static MemberDao memberDao = new MemberDao();
	
	public static User login(String id, String password) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Member member = memberDao.selectById(conn, id);
			
			if (member == null) { throw new InvalidIdException(); } 
			
			if (!member.matchPassword(password)) { throw new LoginFailException(); }
			
			return new User(member.getId(), member.getName());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}

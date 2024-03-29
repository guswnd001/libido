package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import exception.InvalidIdException;
import exception.LoginFailException;
import jdbc.ConnectionProvider;
import model.Member;
import model.User;
import session.MemberSessionRepository;

public class LoginService {

	private static MemberSessionRepository msr = new MemberSessionRepository();
	
	public static User login(String id, String password) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			Member member = msr.selectById(id);
			
			if (member == null) { throw new InvalidIdException(); } 
			
			if (!member.matchPassword(password)) { throw new LoginFailException(); }
			
			return new User(member.getId(), member.getName());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}

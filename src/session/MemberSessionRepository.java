package session;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;

public class MemberSessionRepository {

	private final String namespace = "mapper.MemberMapper";
	
	private SqlSessionFactory getSqlSessionFactory() { 
		String resource = "mybatis/mybatis-config.xml";
		InputStream inputStream;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		
		return new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public Member selectById(String id) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			return sqlSession.selectOne(namespace + ".selectById", id);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<String> getIds() {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			return sqlSession.selectList(namespace + ".getIds");
		} finally {
			sqlSession.close();
		}
	}
	
	public int insertMem(Member member) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statment = namespace + ".insertMem";
			int result = sqlSession.insert(statment, member);
			
			if (result > 0) {
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}
			return result;
		} finally {
			sqlSession.close();
		}
	}
	
}

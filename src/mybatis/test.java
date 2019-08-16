package mybatis;

import java.util.List;

import model.Member;
import session.MemberSessionRepository;

public class test {

	public static void main(String[] args) {
		MemberSessionRepository msr = new MemberSessionRepository();
		
		Member mem = msr.selectById("222");
		System.out.println(mem);
		
		List li = msr.getIds();
		System.out.println(li);
	}

}

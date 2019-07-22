package handler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import dao.MemberDao;
import exception.DuplicateIdException;
import model.Board;
import model.JoinRequest;
import model.Member;
import service.JoinService;

public class WriteHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/amado/pages/b_writeForm.jsp";
	private JoinService joinService = new JoinService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, resp);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, resp);
		} else {
			resp.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest req, HttpServletResponse resp) {
		int num = 0, ref = 1, re_step = 0, re_level = 0;

		String pageNum = req.getParameter("pageNum");
		String subject = req.getParameter("subject"); 
		if (pageNum == null || pageNum == "") { pageNum = "1"; }

		if (req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));
		}
		
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("ref", ref);
		req.setAttribute("re_step", re_step);
		req.setAttribute("re_level", re_level);
		req.setAttribute("subject", subject);
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("authUser");
		MemberDao manager = new MemberDao();
		Member member = manager.getMem(id);
		
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) {
		BoardDao dbPro = BoardDao.getInstance();
		Board article = new Board();
		
		HttpSession session = req.getSession();
		String pageNum = req.getParameter("pageNum");	
		String boardid = (String)session.getAttribute("boardid");
		if (boardid == null || boardid == "") {
			boardid = "1";
		}
		
		article.setNum(Integer.parseInt(req.getParameter("num")));
		article.setWriter(req.getParameter("writer"));
		article.setSubject(req.getParameter("subject"));
		article.setEmail(req.getParameter("email"));
		article.setPasswd(req.getParameter("passwd"));
		article.setContent(req.getParameter("content").trim());
		article.setRef(Integer.parseInt(req.getParameter("ref")));
		article.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		article.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		article.setIp(req.getRemoteAddr());
		
		dbPro.insertArticle(article, boardid);
		
		try {
			resp.sendRedirect(req.getContextPath() + "/libido/list.do?pageNum=" + pageNum);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}

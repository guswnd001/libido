package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;

import dao.BoardDao;
import dao.MemberDao;
import exception.DuplicateIdException;
import exception.LoginFailException;
import model.Board;
import model.JoinRequest;
import model.Member;
import model.User;
import service.JoinService;
import service.LoginService;

public class BoardAction extends Action{
	
	public String loginGET(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		HttpSession ses = req.getSession();
		User user = (User)ses.getAttribute("authUser");
		req.setAttribute("authUser", user);
		
		return "/amado/pages/loginForm2.jsp"; 
	} 
	
	public String loginPOST(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		String id = trim(req.getParameter("id"));
		String password = trim(req.getParameter("password"));
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		
		if (id == null || id.isEmpty()) { errors.put("id", Boolean.TRUE); }
		if (password == null || password.isEmpty()) { errors.put("password", Boolean.TRUE); }
		if (!errors.isEmpty()) { return "/amado/pages/loginForm2.jsp"; } //에러가 있으면 
		
		try {
			User user = LoginService.login(id, password);
			req.getSession().setAttribute("authUser", user); ///////중요!!!
			req.getSession().setAttribute("authUserId", user.getId()); ///////중요!!!
			res.sendRedirect(req.getContextPath() + "/amado/pages/loginPro.jsp"); 
			return null;
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "/amado/pages/loginPro.jsp";
		}
	}
	
	private String trim(String str) {
		return str == null ? null : str.trim();
	}
	
	public String logoutGET(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		HttpSession session = req.getSession(false);
		
		if (session != null) { session.invalidate(); }
		
		res.sendRedirect(req.getContextPath() + "/amado/pages/logout.jsp");
		
		return null;
	} 

	public String joinGET(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		 return  "/amado/pages/joinForm.jsp"; 
	}
	
	public String joinPOST(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		JoinService joinService = new JoinService();
		JoinRequest joinReq = new JoinRequest();
		
		joinReq.setName(req.getParameter("name"));
		joinReq.setBirth(req.getParameter("birth"));
		joinReq.setId(req.getParameter("id"));
		joinReq.setPassword(req.getParameter("password"));
		joinReq.setPasswdCheck(req.getParameter("passwdCheck"));
		joinReq.setEmail(req.getParameter("email"));
		joinReq.setTel1(req.getParameter("tel1"));
		joinReq.setTel2(req.getParameter("tel2"));
		joinReq.setTel3(req.getParameter("tel3"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if (!errors.isEmpty()) { 
			System.out.println(errors.keySet());
			return "/amado/pages/joinForm.jsp"; 
		}
		
		try {
			joinService.join(joinReq);
			return "/amado/pages/joinPro.jsp";
		} catch (DuplicateIdException e) {
			errors.put("duplicatedId", Boolean.TRUE);
			return "/amado/pages/joinForm.jsp";
		}
	} 
	
	public String listGET(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		BoardDao dbPro = BoardDao.getInstance();
		HttpSession ses = req.getSession();
		
		
		req.setCharacterEncoding("utf-8");
		
		if (req.getParameter("boardid") != null) {
			ses.setAttribute("boardid", req.getParameter("boardid"));
		}

		String boardid = (String)ses.getAttribute("boardid");
		
		if (boardid == null || boardid == "") { boardid = "1"; } 
	
		System.out.println(boardid);
		
		
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum == "") { pageNum = "1"; }
		
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 2;
		int aCount = dbPro.getArticleCount(boardid); 
		int startRow = (currentPage - 1) * pageSize;
		int endRow = currentPage * pageSize;
		int number = aCount - startRow;
		List articleList = dbPro.getArticles(startRow, pageSize, boardid);
		
		if (aCount < endRow) { endRow = aCount; }
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
		
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("pageSize", pageSize);
		req.setAttribute("aCount", aCount);
		req.setAttribute("startRow", startRow);
		req.setAttribute("endRow", endRow);
		req.setAttribute("number", number + 1);
		req.setAttribute("articleList", articleList);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("boardid", boardid);
		req.setAttribute("sdf", sdf);
		
		/////////////////////////////////////////////////////////////////
		
		int bottomLine = 3;
		int pageCount = aCount / pageSize + (aCount % pageSize == 0? 0 : 1); //2
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine; //1
		int endPage = startPage + bottomLine - 1; //3
		if (pageCount < endPage) endPage = pageCount;
		
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		return "/amado/pages/b_list.jsp";
	}
	
	public String indexGET(HttpServletRequest req, HttpServletResponse res)  throws Exception { 
		HttpSession ses = req.getSession();
		User user = (User)ses.getAttribute("authUser");
		req.setAttribute("authUser", user);
		
		System.out.println(user);
		
		return  "/amado/pages/index.jsp"; 
	} 
	
	public String writeGET(HttpServletRequest req, HttpServletResponse res)  throws Exception {
		int num = 0, ref = 1, re_step = 0, re_level = 0;
		String kind = null;
		
		String pageNum = req.getParameter("pageNum");
		String subject = req.getParameter("subject"); 
		if (pageNum == null || pageNum == "") { pageNum = "1"; }

		if (req.getParameter("num") != null) {
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			re_step = Integer.parseInt(req.getParameter("re_step"));
			re_level = Integer.parseInt(req.getParameter("re_level"));
			kind = req.getParameter("kind");
		}
		
		req.setAttribute("num", num);
		req.setAttribute("ref", ref);
		req.setAttribute("re_step", re_step);
		req.setAttribute("re_level", re_level);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("subject", subject);
		req.setAttribute("kind", kind);
		
		HttpSession ses = req.getSession();
		User user = (User)ses.getAttribute("authUser");
		req.setAttribute("authUser", user);
		System.out.println(user);
		
		MemberDao manager = new MemberDao();
		if (user != null) {
			String id = (String)user.getId();
			Member member = manager.getMem(id);
			req.setAttribute("member", member);
			return "/amado/pages/b_writeForm.jsp";
		} else {
			return "/amado/pages/b_writeCheck.jsp";
		}
		
	} 
	
	public String writePOST(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		BoardDao dbPro = BoardDao.getInstance();
		Board article = new Board();
		
		HttpSession session = req.getSession();
		String pageNum = req.getParameter("pageNum");	
		String boardid = (String)session.getAttribute("boardid");
		if (boardid == null || boardid == "") {
			boardid = "1";
		}
		
		article.setNum(Integer.parseInt(req.getParameter("num")));
		article.setKind(req.getParameter("kind"));
		article.setWriter(req.getParameter("writer"));
		article.setSubject(req.getParameter("subject"));
		article.setEmail(req.getParameter("email"));
		article.setContent(req.getParameter("content").trim());
		article.setPasswd(req.getParameter("passwd"));
		article.setRef(Integer.parseInt(req.getParameter("ref")));
		article.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		article.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		article.setIp(req.getRemoteAddr());
		
		System.out.println(2);
		dbPro.insertArticle(article, boardid);
		
		try {
			res.sendRedirect(req.getContextPath() + "/amado/pages/b_writePro.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String contentGET(HttpServletRequest req, HttpServletResponse res)  throws Exception { 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		BoardDao dbPro = BoardDao.getInstance();
		
		int num = Integer.parseInt(req.getParameter("num"));
		int number = Integer.parseInt(req.getParameter("number"));
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum == "") { pageNum = "1"; }
		
		HttpSession session = req.getSession();
		String boardid = (String)session.getAttribute("boardid");
		if (boardid == null || boardid == "") { boardid = "1"; }
		
		Board article = dbPro.getArticle(num, boardid);
		
		req.setAttribute("num", num);
		req.setAttribute("number", number);
		req.setAttribute("article", article);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("sdf", sdf);
		
		return "/amado/pages/b_content.jsp";
	}
	
	public String updateGET(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		HttpSession session = req.getSession();
		String boardid = (String)session.getAttribute("boardid");
		if (boardid == null || boardid == "") { boardid = "1"; }
		
		int num = Integer.parseInt(req.getParameter("num"));
		String pageNum = req.getParameter("pageNum");
		String kind = req.getParameter("kind");
		System.out.println(kind);
		
		BoardDao dbPro = BoardDao.getInstance();
		Board article =  dbPro.getUpdate(num, boardid);

		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("article", article);
		req.setAttribute("kind", kind);
		
		
		return "/amado/pages/b_updateForm.jsp";
	}
	
	public String updatePOST(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		HttpSession session = req.getSession();
		String num = req.getParameter("num");
		String pageNum = req.getParameter("pageNum");
		String boardid = (String)session.getAttribute("boardid");
		if (boardid == null || boardid == "") { boardid = "1"; }
		
		Board article = new Board();
		article.setNum(Integer.parseInt(num));
		article.setKind(req.getParameter("kind"));
		article.setWriter(req.getParameter("writer"));
		article.setSubject(req.getParameter("subject"));
		article.setEmail(req.getParameter("email"));
		article.setContent(req.getParameter("content"));
		article.setPasswd(req.getParameter("passwd"));
		
		
		BoardDao dbPro = BoardDao.getInstance();
		int check = dbPro.updateArticle(article, boardid, Integer.parseInt(num));
		
		req.setAttribute("check", check);
		req.setAttribute("num", num);
		req.setAttribute("pageNum", pageNum);
		
		return "/amado/pages/b_updatePro.jsp";
	}
	 
	public String deleteGET(HttpServletRequest req, HttpServletResponse res) throws Exception { 
		return "/amado/pages/b_deleteForm.jsp";
	} 
}
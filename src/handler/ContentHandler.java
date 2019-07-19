package handler;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;
import model.Board;

public class ContentHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/amado/pages/b_content.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
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
		
		return FORM_VIEW;
	}
	
}

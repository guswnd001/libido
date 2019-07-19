package handler;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDao;

public class ListHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/amado/pages/b_list.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
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
		
		return FORM_VIEW;
	}
	
}

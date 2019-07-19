package handler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.LoginFailException;
import model.User;
import service.LoginService;

public class LoginHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/amado/pages/loginForm2.jsp";
	private LoginService loginService = new LoginService();

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
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String id = trim(req.getParameter("id"));
		String password = trim(req.getParameter("password"));
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		
		if (id == null || id.isEmpty()) { errors.put("id", Boolean.TRUE); }
		if (password == null || password.isEmpty()) { errors.put("password", Boolean.TRUE); }
		if (!errors.isEmpty()) { return FORM_VIEW; } //에러가 있으면 
		
		try {
			User user = loginService.login(id, password);
			req.getSession().setAttribute("authUser", user); ///////중요!!!
			resp.sendRedirect(req.getContextPath() + "/amado/pages/loginPro.jsp"); 
			return null;
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}
	
	private String trim(String str) {
		return str == null ? null : str.trim();
	}

}

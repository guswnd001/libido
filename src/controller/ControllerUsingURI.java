package controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import handler.CommandHandler;
import handler.NullHandler;

public class ControllerUsingURI extends HttpServlet {

	//하나의 서블릿에서 환경에 따라 view 혹은 path를 바꾸며 사용하는 것을 controller라고 한다.
	//handler를 사용한다. 확장자로 매핑할지 

	private Map<String, CommandHandler> commandHandlerMap = new HashMap<String, CommandHandler>();
	
	public void init() throws ServletException {
		String configFile = getInitParameter("configFile");
		Properties prop = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		
		try (FileReader fr = new FileReader(configFilePath)) {
			prop.load(fr);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		
		Iterator keyIter = prop.keySet().iterator();
		
		while (keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String handlerClassName = prop.getProperty(command);
			
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler)handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	public void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getRequestURI(); // Model2/hello.do, board_m2/join.do
		System.out.println(command + " : " + req.getContextPath());
		
		if (command.indexOf(req.getContextPath()) == 0) { //프로젝트명이 있으면 0
			command = command.substring(req.getContextPath().length());
		}
		
		CommandHandler handler = commandHandlerMap.get(command); //properties의 값을 받아옴 
		
		if (handler == null) {
			handler = new NullHandler(); 
		}
		
		String viewPage = null;
		
		try {
			viewPage = handler.process(req, resp); 
		} catch (Throwable e) {
			throw new ServletException(e);
		}
		
		if (viewPage != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage); 
			dispatcher.forward(req, resp);
		}
	}
	
	
}

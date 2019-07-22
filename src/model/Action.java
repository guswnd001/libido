package model;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Action extends HttpServlet {
	

	public void doGet(// get방식의 서비스 메소드
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(// post방식의 서비스 메소드
			HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestPro(request, response);
	}

	

	private void requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		String command = "";
		
			
			Method[] md = this.getClass().getMethods();
			System.out.println(Arrays.asList(md));
			command = request.getRequestURI();
			System.out.println("command:" + command);
			if (command.indexOf(request.getContextPath()) == 0) {

				command = command.substring(request.getContextPath().length());
				command = command.substring(command.lastIndexOf("/") + 1);
				command = command.substring(0, command.lastIndexOf("."));
				command = command+request.getMethod();
			}
			System.out.println("command:" + command);
			view = null;
			boolean notexsit = true;
			try {
			for (int i = 0; i < md.length; i++) {
				// System.out.println("md:"+md[i].getName()+"="+command);
				if (md[i].getName().equals(command)) {
					try {
						view = (String) md[i].invoke(this, request, response);
						notexsit=false;
					} catch (Exception e) {}
					
				}
			}
			if (notexsit) {
				String exc = "\n   public String " + command
						+ "(HttpServletRequest req,"
						+ "\n HttpServletResponse res)  throws Exception"
						+ " { \n return  \" \"; \n} \n \t 추가하세요";
				throw new MethodNameException(exc);
			}
			
			if (view != null) {
				RequestDispatcher dispatcher = request.getRequestDispatcher(view);
				dispatcher.forward(request, response);
			}
			
			} catch (Exception e) {
				throw new ServletException(e);
			}
		

	}
}

class MethodNameException extends  RuntimeException {
	
	MethodNameException(String messge) {
		super(messge);
	}
	
}

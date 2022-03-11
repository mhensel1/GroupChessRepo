package edu.ycp.cs320.chess.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomepageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Homepage Servlet: doGet");
		
		req.getRequestDispatcher("/_view/Homepage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Homepage Servlet: doPost");
		
			if (req.getParameter("login") != null) {
				req.getRequestDispatcher("/_view/menu.jsp").forward(req, resp);
			} else if (req.getParameter("guessingGame") != null) {
				req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);		//verify if a button is pressed and call new jsp to render desired page
			} else if (req.getParameter("createAccount") != null) {
				req.getRequestDispatcher("/_view/stats.jsp").forward(req, resp);
			} else {
				throw new ServletException("Unknown command");
			}
			
		
		req.getRequestDispatcher("/_view/Homepage.jsp").forward(req, resp);//call jsp to render updated page
	}
}

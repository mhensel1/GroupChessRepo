package edu.ycp.cs320.chess.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ycp.cs320.chess.controller.UserController;
import edu.ycp.cs320.chess.model.ChessPiece;

public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("MainMenu Servlet: doGet");	
			
		req.getRequestDispatcher("/_view/menu.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Menu Servlet: doPost");
		
		UserController controller = new UserController();
		
		if (req.getParameter("loadGame") != null) {
			req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
		} else if (req.getParameter("findGame") != null) {
			req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);		//verify if a button is pressed and call new jsp to render desired page
		} else if (req.getParameter("viewStats") != null) {
			req.getRequestDispatcher("/_view/stats.jsp").forward(req, resp);
		} else if (req.getParameter("viewHistory") != null) {
			req.getRequestDispatcher("/_view/history.jsp").forward(req, resp);
		} else if (req.getParameter("logOut") != null) {
			req.getRequestDispatcher("/_view/homepage.jsp").forward(req, resp);
		} else {
			throw new ServletException("Unknown command");
		}
		
				req.getRequestDispatcher("/_view/menu.jsp").forward(req, resp);	//Call Jsp to render new page
			}
}
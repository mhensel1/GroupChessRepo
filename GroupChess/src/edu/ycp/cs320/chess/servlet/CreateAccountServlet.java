package edu.ycp.cs320.chess.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.chess.model.ChessUser;

public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		System.out.println("Create account Servlet: doGet");	
		
		// call JSP to generate empty form
		req.getRequestDispatcher("/_view/createAccount.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Create account Servlet: doPost");
		

		// holds the error message text, if there is any
		String errorMessage = null;
		
		
		// decode POSTed form parameters and dispatch to controller
		try {
			String username = req.getParameter("user");
			String pass = req.getParameter("pass");
			String pass2 = req.getParameter("pass2");

			// check for errors in the form data before using is in a calculation
			if (username == null || pass == null || pass2 == null) {
				errorMessage = "Please enter username, password, and verify password";
			}
			
			if (pass != pass2) {
				errorMessage = "Passwords do not match";
			}
		
			else {
				
				req.getRequestDispatcher("/_view/Menu.jsp").forward(req, resp);
			}
		} catch (NumberFormatException e) {
			errorMessage = "Invalid";
		}

		req.setAttribute("errorMessage", errorMessage);

		req.getRequestDispatcher("/_view/login.jsp").forward(req, resp);
	}
}
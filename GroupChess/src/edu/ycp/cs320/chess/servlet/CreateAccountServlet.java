package edu.ycp.cs320.chess.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.chess.controller.CreateAccountController;
import edu.ycp.cs320.chess.model.ChessUser;

public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CreateAccountController controller = null;
	
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
		String successMessage = null;
		ChessUser userModel = new ChessUser();
		MenuServlet menu = new MenuServlet();
		ArrayList<String> usernames = userModel.getUsersList();
		ArrayList<String> passwords = userModel.getPassList();
		boolean inUserArr = false;
		
		// decode POSTed form parameters and dispatch to controller
		try {
			String username = req.getParameter("user");
			String pass = req.getParameter("pass");
			String pass2 = req.getParameter("pass2");
			System.out.println(username + pass +pass2);
			for (int i=0; i<usernames.size(); i++) {
				if (usernames.get(i).equals(username)) {
					inUserArr = true;
				}
			}

			// check for errors in the form data before using is in a calculation
			if (username == null || pass == null || pass2 == null || username.equals("") || pass.equals("") || pass2.equals("")) {
				errorMessage = "Please enter username, password, and verify password";
				System.out.println("Field empty");
			}
			
			else if (pass.equals(pass2) != true) {
				errorMessage = "Passwords do not match";
			}
			else if (inUserArr == true) {
				errorMessage = "Username already exists";
			}
		
			else {
				controller = new CreateAccountController();
				
				// get list of books returned from query			
				if (controller.insertUserIntoTable(username, pass)) {
					successMessage = username;
				}
				else {
					errorMessage = "Failed to insert User: " + username;					
				}
				System.out.println("Username: " + username);
				userModel.setUser(username);
				userModel.setPass(pass);
				usernames.add(userModel.getUser());
				passwords.add(userModel.getPass());
				//userModel.login();
				HttpSession session = req.getSession();
				session.setAttribute("user", userModel.getUser());
				//session.setAttribute("userArr", usernames);
				//session.setAttribute("passArr", passwords);
				req.getServletContext().getRequestDispatcher("/MenuServlet");
				menu.doGet(req, resp);
				req.getRequestDispatcher("/_view/menu.jsp").forward(req, resp);
			}
		} catch (NumberFormatException e) {
			errorMessage = "Invalid";
		}
		
		req.setAttribute("user", userModel.getUser());
		//getServletContext().getRequestDispatcher("/MenuServlet.java").forward(req, resp);
		//getServletContext().setAttribute("user", userModel.getUser());
		req.setAttribute("pass", req.getParameter("pass"));
		
		req.setAttribute("errorMessage", errorMessage);
		
		req.setAttribute("ChessUser", userModel);
		
		req.getRequestDispatcher("/_view/createAccount.jsp").forward(req, resp);
	}
}
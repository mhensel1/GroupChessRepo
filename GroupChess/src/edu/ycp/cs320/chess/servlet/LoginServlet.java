package edu.ycp.cs320.chess.servlet;

import java.io.IOException;
//localhost:8081/chess/Homepage

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.chess.model.ChessUser;
import java.util.ArrayList;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		System.out.println("Login Servlet: doGet");	
		
		// call JSP to generate empty form
		req.getRequestDispatcher("/_view/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Login Servlet: doPost");
		

		// holds the error message text, if there is any
		String errorMessage = null;
		
		ChessUser userModel = new ChessUser();
		MenuServlet menu = new MenuServlet();
		ArrayList<String> usernames = userModel.getUsersList();
		ArrayList<String> passwords = userModel.getPassList();
		boolean inUserArr = false;
		int passIndex = -1;
		
		//String password = "chess";
		//userModel.setPass(password);
		
		// decode POSTed form parameters and dispatch to controller
		try {
			String username = req.getParameter("user");
			String pass = req.getParameter("pass");
			//System.out.println(username);
			for (int i=0; i<usernames.size(); i++) {
				if (usernames.get(i).equals(username)) {
					inUserArr = true;
					passIndex = i;
				}
			}

			// check for errors in the form data before using is in a calculation
			if (username == null || pass == null || pass.equals("") || username.equals("")) {
				errorMessage = "Please enter username or password";
				System.out.println("Field empty");
				
			}
			else if (inUserArr == false) {
				errorMessage = "Account Not Recognized, Please Create an Account";
			}
			else if (pass.equals(passwords.get(passIndex)) != true) {
				errorMessage = "Incorrect Password";
			}
			// otherwise, data is good, do the calculation
			// must create the controller each time, since it doesn't persist between POSTs
			// the view does not alter data, only controller methods should be used for that
			// thus, always call a controller method to operate on the data
			else {
				System.out.println("Username: " + username);
				userModel.setUser(username);
				//userModel.login();
				HttpSession session = req.getSession();
				session.setAttribute("user", userModel.getUser());
				req.getServletContext().getRequestDispatcher("/MenuServlet");
				menu.doGet(req, resp);
				req.getRequestDispatcher("/_view/menu.jsp").forward(req, resp);
				
			}
		} catch (NumberFormatException e) {
			errorMessage = "Invalid";
		}
		
		// Add parameters as request attributes
		// this creates attributes named "first" and "second for the response, and grabs the
		// values that were originally assigned to the request attributes, also named "first" and "second"
		// they don't have to be named the same, but in this case, since we are passing them back
		// and forth, it's a good idea
		req.setAttribute("user", userModel.getUser());
		
		
		//getServletContext().getRequestDispatcher("/MenuServlet.java").forward(req, resp);
		//getServletContext().setAttribute("user", userModel.getUser());
		req.setAttribute("pass", req.getParameter("pass"));
		
		// add result objects as attributes
		// this adds the errorMessage text and the result to the response
		req.setAttribute("errorMessage", errorMessage);
		req.setAttribute("result", userModel.getUser());
		
		req.setAttribute("ChessUser", userModel);
		
		// Forward to view to render the result HTML document
		req.getRequestDispatcher("/_view/login.jsp").forward(req, resp);
	}

}
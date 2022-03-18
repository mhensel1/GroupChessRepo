package edu.ycp.cs320.chess.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.chess.model.ChessUser;

public class UserStatsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		System.out.println("Stats Servlet: doGet");	
		
		ChessUser userModel = new ChessUser();
		
		HttpSession session = req.getSession(); //code for displaying username in menu
		String username = (String) session.getAttribute("user");
		userModel.setUser(username);
		
		System.out.println("Welcome: " + userModel.getUser());
		
		req.setAttribute("user", userModel.getUser());
		req.setAttribute("ChessUser", userModel);
		
		// call JSP to generate empty form
		req.getRequestDispatcher("/_view/stats.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Stats Servlet: doPost");
		

		// holds the error message text, if there is any
		String errorMessage = null;
		
		ChessUser userModel = new ChessUser();
		// decode POSTed form parameters and dispatch to controller
		try {
			String username = req.getParameter("username");

			// check for errors in the form data before using is in a calculation
			if (username == null) {
				errorMessage = "Please make sure you're logged in";
			}
			// otherwise, data is good, do the calculation
			// must create the controller each time, since it doesn't persist between POSTs
			// the view does not alter data, only controller methods should be used for that
			// thus, always call a controller method to operate on the data
			else {
				userModel.setUser(username);
			}
		} catch (NumberFormatException e) {
			errorMessage = "Invalid";
		}
		
		// Add parameters as request attributes
		// this creates attributes named "first" and "second for the response, and grabs the
		// values that were originally assigned to the request attributes, also named "first" and "second"
		// they don't have to be named the same, but in this case, since we are passing them back
		// and forth, it's a good idea
		req.setAttribute("username", req.getParameter("username"));
		
		// add result objects as attributes
		// this adds the errorMessage text and the result to the response
		req.setAttribute("errorMessage", errorMessage);
		req.setAttribute("result", userModel.getRank());
		
		// Forward to view to render the result HTML document
		req.getRequestDispatcher("/_view/stats.jsp").forward(req, resp);
	}
	
}

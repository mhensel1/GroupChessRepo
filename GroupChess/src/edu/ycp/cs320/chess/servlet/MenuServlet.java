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
		
		ChessPiece model = new ChessPiece();
		
		UserController controller = new UserController();
		
		controller.setModel(model);
		
				String errorMessage = null;	//holds error
				
				try {
					Double first = getDoubleFromParameter(req.getParameter("first"));
					Double second = getDoubleFromParameter(req.getParameter("second"));	//Take three inputs and verify all three fields are filled
					Double third = getDoubleFromParameter(req.getParameter("third"));
					if (first == null || second == null || third == null) {
						errorMessage = "Please specify three numbers";
					}
				
					else {
						controller.setNumbersAddition(first, second, third);	//sets the result of 3 numbers in the controller
					}
					
				} catch (NumberFormatException e) {
					errorMessage = "Invalid double";
				}
				
				req.setAttribute("first", req.getParameter("first"));
				req.setAttribute("second", req.getParameter("second"));
				req.setAttribute("third", req.getParameter("third"));		//Add results and error message to response
				req.setAttribute("errorMessage", errorMessage);
				req.setAttribute("numbers", model);
		
				req.getRequestDispatcher("/_view/menu.jsp").forward(req, resp);	//Call Jsp to render new page
			}
	
			private Double getDoubleFromParameter(String s) {
				if (s == null || s.equals("")) {
					return null;
				} else {
			return Double.parseDouble(s);
		}
	}
}
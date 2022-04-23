package edu.ycp.cs320.chess.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ycp.cs320.chess.controller.GameController;
import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPlayer;

public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("ChessGame Servlet: doGet");	
		// call JSP to generate empty form
		if (req.getParameter("selectPiece") != null) {
			System.out.println("selectPiece");
		}
		
		req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("ChessGame Servlet: doPost");
		ChessPlayer white = new ChessPlayer();
		ChessPlayer black = new ChessPlayer();
		// create ChessGameTest model - model does not persist between requests
		// must recreate it each time a Post comes in 
		ChessGame gamemodel = new ChessGame(white,black);

		// create ChessGameTest controller - controller does not persist between requests
		// must recreate it each time a Post comes in
		GameController controller = new GameController();
		
		// assign model reference to controller so that controller can access model
		controller.setGameModel(gamemodel);
		
		if (req.getParameter("selectPiece") != null) {
			System.out.println("selectPiece");
		}
		
		if (req.getParameter("endTurn") != null) {
			
		} else if (req.getParameter("saveGame") != null) {
			
		} else if (req.getParameter("viewHistory") != null) {
		
		} else if (req.getParameter("exitGame") != null) {
			
		} else {
			throw new ServletException("Unknown command");
		}
		
		req.setAttribute("ChessGame", gamemodel);
		
		// now call the JSP to render the new page
		req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
	}
}

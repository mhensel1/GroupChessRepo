package edu.ycp.cs320.chess.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ycp.cs320.chess.controller.UserController;
import edu.ycp.cs320.chess.controller.MenuController;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.chess.model.ChessUser;
import edu.ycp.cs320.gamesDB.model.Game;
import edu.ycp.cs320.gamesDB.model.User;
import java.util.ArrayList;
import java.util.List;

public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("MainMenu Servlet: doGet");	
		
		
		ChessUser userModel = new ChessUser();
		
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("user");
		userModel.setUser(username);
		
		
		System.out.println("Welcome: " + userModel.getUser());
		
		req.setAttribute("user", userModel.getUser()); //code for displaying username in menu
		req.setAttribute("ChessUser", userModel);
			
		req.getRequestDispatcher("/_view/menu.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Menu Servlet: doPost");
		
		
		UserController controller = new UserController();
		MenuController menuController = new MenuController();
		
		ChessUser userModel = new ChessUser();
		UserStatsServlet stats = new UserStatsServlet();
		
		HttpSession session = req.getSession(); //code for displaying username in menu
		String username = (String) session.getAttribute("user");
		userModel.setUser(username);
		//List<Game> gameList;
		//session = req.getSession();
		GameSelectServlet select = new GameSelectServlet();
		GameServlet toGame = new GameServlet();
		
		System.out.println("Welcome: " + userModel.getUser());
		
		req.setAttribute("user", userModel.getUser());
		req.setAttribute("ChessUser", userModel);
		User trueUser = menuController.getUser(username);
		
		
		if (req.getParameter("loadGame") != null) {
			//int game_id = menuController.createGame(trueUser.getUserId(), username);
			int game_id = 2; //game 2 is the only one with pieces associated in db :/
			session.setAttribute("game_id", game_id);
			menuController.addUserIDtoGame(trueUser.getUserId(), game_id);
			System.out.println(game_id);
			req.getServletContext().getRequestDispatcher("/Game");
			toGame.doGet(req, resp);
			req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
		} else if (req.getParameter("findGame") != null) {
			//gameList = menuController.findGamesWithoutOpps();
			//session.setAttribute("gamesNum", gameList.size());
			req.getServletContext().getRequestDispatcher("/GameSelect");
			select.doGet(req, resp);
			req.getRequestDispatcher("/_view/gameSelect.jsp").forward(req, resp);
			//req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);		//verify if a button is pressed and call new jsp to render desired page
		} else if (req.getParameter("viewStats") != null) {
			req.getServletContext().getRequestDispatcher("/MenuServlet");
			stats.doGet(req, resp);
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
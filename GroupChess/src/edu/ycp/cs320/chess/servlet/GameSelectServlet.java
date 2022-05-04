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
import edu.ycp.cs320.gamesDB.model.Pair;
import edu.ycp.cs320.gamesDB.model.Game;
import edu.ycp.cs320.gamesDB.model.User;
import java.util.List;
import java.util.ArrayList;

public class GameSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("GameSelect Servlet: doGet");	
		
		
		ChessUser userModel = new ChessUser();
		MenuController menuController = new MenuController();
		
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("user");
		userModel.setUser(username);
		
		List<Game> gameList;
		gameList = menuController.findGamesWithoutOpps();
		req.setAttribute("gamesNum", gameList.size());
		req.setAttribute("games", gameList);
		
		
		System.out.println("Welcome: " + userModel.getUser());
		
		req.setAttribute("user", userModel.getUser()); //code for displaying username in menu
		req.setAttribute("ChessUser", userModel);
			
		req.getRequestDispatcher("/_view/gameSelect.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("Menu Servlet: doPost");
		
		UserController controller = new UserController();
		MenuController menuController = new MenuController();
		
		ChessUser userModel = new ChessUser();
		GameServlet gameServe = new GameServlet();
		
		HttpSession session = req.getSession(); //code for displaying username in menu
		String username = (String) session.getAttribute("user");
		userModel.setUser(username);
		
		System.out.println("Welcome: " + userModel.getUser());
		
		req.setAttribute("user", userModel.getUser());
		req.setAttribute("ChessUser", userModel);
		int user_id = menuController.findUserIdByUsername(userModel.getUser());
		int game_id=0;
		
		List<Game> gameList;
		gameList = menuController.findGamesWithoutOpps();
		
		for (Integer i=1; i <=gameList.size()+1; i++) {
			System.out.println(i);
			Game game = gameList.get(i-1);
			game_id = game.getGameId();
			String iString = i.toString();
			if (req.getParameter("loadGame"+iString+"") != null) {
				menuController.addUserIdToOppId(game_id, user_id);
				session.setAttribute("game_id", game_id);
				System.out.println("Game Id: " + game_id);
				gameServe.doGet(req, resp);
				req.getRequestDispatcher("/_viewgame.jsp").forward(req, resp);
			}
		}
		if (req.getParameter("loadGame") != null) {
			req.setAttribute("game_id", 2); //game id attribute to pass (throughout session?)
			req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
		}else {
			throw new ServletException("Unknown command");
		}
		
		
		
				req.getRequestDispatcher("/_view/gameSelect.jsp").forward(req, resp);	//Call Jsp to render new page
			}
			
}
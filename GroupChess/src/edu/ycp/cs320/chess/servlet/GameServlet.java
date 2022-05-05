package edu.ycp.cs320.chess.servlet;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ycp.cs320.chess.controller.GameController;
import edu.ycp.cs320.chess.controller.StatsController;
import edu.ycp.cs320.chess.controller.MenuController;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.chess.model.ChessPlayer;
import edu.ycp.cs320.chess.model.Rook;
import edu.ycp.cs320.gamesDB.model.Piece;
import edu.ycp.cs320.gamesDB.model.Game;
import edu.ycp.cs320.gamesDB.model.User;
import edu.ycp.cs320.chess.model.ChessPlayer;
import javax.servlet.http.HttpSession;

public class GameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("ChessGame Servlet: doGet");	
		// call JSP to generate empty form
		HttpSession session = req.getSession();
		session.setAttribute("hasSelected", "no");
		int game_id = (Integer) session.getAttribute("game_id");
		String username = (String) session.getAttribute("user");
		System.out.println("Game ID at GS doGet: "+game_id);
		
		MenuController menuController = new MenuController();
		GameController gameController = new GameController();
		int user_id = menuController.findUserIdByUsername(username);
		Game game = gameController.loadGame(user_id, game_id);
		List<Piece> pieces = gameController.getPiecesByGameID(game_id);
		List<Integer> rows= new ArrayList<Integer>();
		for (int i=0; i<8; i++) {
			rows.add(i);
		}
		session.setAttribute("rows", rows);
		session.setAttribute("hasSelected", "no");
		session.setAttribute("startX", "non");
		session.setAttribute("startY", "non");
		
		req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("ChessGame Servlet: doPost");
		String errorMessage = null;
		
		HttpSession session = req.getSession();
		ChessBoard board = new ChessBoard();
		// create ChessGameTest controller - controller does not persist between requests
		// must recreate it each time a Post comes in
		int game_id = (Integer) session.getAttribute("game_id");
		String username = (String) session.getAttribute("user");
		GameController controller = new GameController();
		MenuController menuController = new MenuController();
		int user_id = menuController.findUserIdByUsername(username);
		Game game = controller.loadGame(user_id, game_id);
		List<Piece> pieces = controller.getPiecesByGameID(game_id);
		//StatsController statController = new StatsController();
		
		// assign model reference to controller so that controller can access model
		//assign model reference to controller so that controller can access model
		controller.setBoardModel(board);
		
		if (req.getParameter("createGame") != null) {
		//controller.startGame();
		}
		System.out.println("Has selected a piece " + session.getAttribute("hasSelected"));
		String yn = (String) session.getAttribute("hasSelected");
		int x = -1;
		int y= -1;
		
		if (yn.equals("no")) {
			Piece piece = null;
			for (Integer i =0; i<8; i++) {
				String iString = i.toString();
				if(req.getParameter("0"+iString+"") != null) { // 0   copy this 8 times (0-7)
					String pieceName = req.getParameter("0"+iString+"");
					System.out.println("Coords: " +pieceName);
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 0;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("1"+iString+"") != null) { //1
					String pieceName = req.getParameter("1"+iString+"");
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 1;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("2"+iString+"") != null) { //2
					String pieceName = req.getParameter("2"+iString+"");
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 2;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("3"+iString+"") != null) { //3
					String pieceName = req.getParameter("3"+iString+"");
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 3;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("4"+iString+"") != null) { //4
					String pieceName = req.getParameter("4"+iString+"");
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 4;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("5"+iString+"") != null) { //5
					String pieceName = req.getParameter("5"+iString+"");
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 5;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("6"+iString+"") != null) { //6
					String pieceName = req.getParameter("6"+iString+"");
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 6;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("7"+iString+"") != null) { //7
					String pieceName = req.getParameter("7"+iString+"");
					if (pieceName == null || pieceName.equals("")) {
						errorMessage = "No Piece there";
						System.out.println("no Piece there");
					}
					else {
						x = 7;
						y = i;
						piece = controller.findPieceByXY(x, y);
						if (piece == null) {
							errorMessage = "No Piece there";
							System.out.println("no Piece there");
						}
						else {
							session.setAttribute("startX", x);
							session.setAttribute("startY", y);
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				
			}
		}
		else if (yn.equals("yes")) {
			int oldX = (Integer) session.getAttribute("startX"); 
			int oldY = (Integer) session.getAttribute("startY"); 
			Piece piece = null;
			Piece otherpiece = null;
			for (Integer i =0; i<8; i++) {
				String iString = i.toString();
				if(req.getParameter("0"+iString+"") != null) { //0
					String pieceName = req.getParameter("0"+iString+"");
					System.out.println("Coords: " +pieceName);
					x = 0;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(0, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("1"+iString+"") != null) { //1
					String pieceName = req.getParameter("1"+iString+"");

					x = 1;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(1, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("2"+iString+"") != null) { //2
					String pieceName = req.getParameter("2"+iString+"");

					x = 2;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(2, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("3"+iString+"") != null) { //3
					String pieceName = req.getParameter("3"+iString+"");

					x = 3;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(3, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("4"+iString+"") != null) { //4
					String pieceName = req.getParameter("4"+iString+"");

					x = 4;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(4, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("5"+iString+"") != null) { //5
					String pieceName = req.getParameter("5"+iString+"");

					x = 5;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(5, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("6"+iString+"") != null) { //6
					String pieceName = req.getParameter("6"+iString+"");

					x = 6;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(6, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
				if(req.getParameter("7"+iString+"") != null) { //7
					String pieceName = req.getParameter("7"+iString+"");

					x = 7;
					y = i;
					piece = controller.findPieceByXY(x, y);
					if (piece == null) {
						boolean good = controller.checkMove();
						if (good == true) {
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
					else {
						//theres a piece to capture
						boolean good = controller.checkMove();
						if (good == true) {
							otherpiece = controller.findPieceByXY(7, i);  //doesnt move just sets capture to true
							controller.move(otherpiece.getPosX(), otherpiece.getPosY(), otherpiece.getPosX(), otherpiece.getPosY(), true, true, game_id);
							controller.move(oldX, oldY, x, y, false, true, game_id);
							session.setAttribute("hasSelected", "no");
						} else {
							errorMessage = "cant move there!";
							session.setAttribute("hasSelected", "yes");
						}
					}
				}
				
			}
			
		}
		
		/*if(yn.equals("no")) {	
				if (req.getParameter("a7") != null) {
					controller.setstart(0, 0);
				}
				else if (req.getParameter("b7") != null) {
					controller.setstart(0, 1);
				}
				else if (req.getParameter("c7") != null) {
					controller.setstart(0, 2);
				}
				else if (req.getParameter("d7") != null) {
					controller.setstart(0, 3);
				}
				else if (req.getParameter("e7") != null) {
					controller.setstart(0, 4);
				}
				else if (req.getParameter("f7") != null) {
					controller.setstart(0, 5);
				}
				else if (req.getParameter("g7") != null) {
					controller.setstart(0, 6);
				}
				else if (req.getParameter("h7") != null) {
					controller.setstart(0, 7);
					
				}else if (req.getParameter("a6") != null) {
					controller.setstart(1, 0);
				}
				else if (req.getParameter("b6") != null) {
					controller.setstart(1, 1);
				}
				else if (req.getParameter("c7") != null) {
					controller.setstart(1, 2);
				}
				else if (req.getParameter("d6") != null) {
					controller.setstart(1, 3);
				}
				else if (req.getParameter("e6") != null) {
					controller.setstart(1, 4);
				}
				else if (req.getParameter("f6") != null) {
					controller.setstart(1, 5);
				}
				else if (req.getParameter("g6") != null) {
					controller.setstart(1, 6);
				}
				else if (req.getParameter("h6") != null) {
					controller.setstart(1, 7);
					
				}else if (req.getParameter("a5") != null) {
					controller.setstart(2, 0);
				}
				else if (req.getParameter("b5") != null) {
					controller.setstart(2, 1);
				}
				else if (req.getParameter("c5") != null) {
					controller.setstart(2, 2);
				}
				else if (req.getParameter("d5") != null) {
					controller.setstart(2, 3);
				}
				else if (req.getParameter("e5") != null) {
					controller.setstart(2, 4);
				}
				else if (req.getParameter("f5") != null) {
					controller.setstart(2, 5);
				}
				else if (req.getParameter("g5") != null) {
					controller.setstart(2, 6);
				}
				else if (req.getParameter("h5") != null) {
					controller.setstart(2, 7);
				}
				else {
				session.setAttribute("hasSelected", "no");
				}
				session.setAttribute("hasSelected", "yes");
				
				System.out.println(controller.getstart());
				//System.out.println(session.getAttribute("hasSelected"));
		}
		
		if(yn.equals("yes")){
			if (req.getParameter("a8") != null) {
				controller.setdestination(0, 0);
			}
			
			else if (req.getParameter("b8") != null) {
				controller.setdestination(0, 1);
			}
			else if (req.getParameter("c8") != null) {
				controller.setdestination(0, 2);
			}
			else if (req.getParameter("d8") != null) {
				controller.setdestination(0, 3);
			}
			else if (req.getParameter("e8") != null) {
				controller.setdestination(0, 4);
			}
			else if (req.getParameter("f8") != null) {
				controller.setdestination(0, 5);
			}
			else if (req.getParameter("g8") != null) {
				controller.setdestination(0, 6);
			}
			else if (req.getParameter("h8") != null) {
				controller.setdestination(0, 7);
				
			}else if (req.getParameter("a7") != null) {
				controller.setdestination(1, 0);
			}
			else if (req.getParameter("b7") != null) {
				controller.setdestination(1, 1);
			}
			else if (req.getParameter("c7") != null) {
				controller.setdestination(1, 2);
			}
			else if (req.getParameter("d7") != null) {
				controller.setdestination(1, 3);
			}
			else if (req.getParameter("e7") != null) {
				controller.setdestination(1, 4);
			}
			else if (req.getParameter("f7") != null) {
				controller.setdestination(1, 5);
			}
			else if (req.getParameter("g7") != null) {
				controller.setdestination(1, 6);
			}
			else if (req.getParameter("h7") != null) {
				controller.setdestination(1, 7);
				
			}else if (req.getParameter("a6") != null) {
				controller.setdestination(2, 0);
			}
			else if (req.getParameter("b6") != null) {
				controller.setdestination(2, 1);
			}
			else if (req.getParameter("c6") != null) {
				controller.setdestination(2, 2);
			}
			else if (req.getParameter("d6") != null) {
				controller.setdestination(2, 3);
			}
			else if (req.getParameter("e6") != null) {
				controller.setdestination(2, 4);
			}
			else if (req.getParameter("f6") != null) {
				controller.setdestination(2, 5);
			}
			else if (req.getParameter("g6") != null) {
				controller.setdestination(2, 6);
			}
			else if (req.getParameter("h6") != null) {
				controller.setdestination(2, 7);
			}
			
			System.out.println("Selected Space at : ");
			//System.out.println(controller.getstart());
			System.out.println("Row " + controller.getDest().getX());
			System.out.println("Col " + controller.getDest().getY());
			
			//controller.move();
			
			//System.out.println("Piece Moved");
			//System.out.println("updated Destination space " + controller.getDest().getPiece());
			//System.out.println("updated start space " + null);
			
			session.setAttribute("hasSelected", "no");
		}*/
		
		if (req.getParameter("endTurn") != null) {
			
		} else if (req.getParameter("saveGame") != null) {
			
		} else if (req.getParameter("viewHistory") != null) {
		
		} else if (req.getParameter("exitGame") != null) {
			
		} else {
			req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
		}
	
		//System.out.println(controller.getstart().g);
		
		//req.setAttribute("ChessGame", board);
		
		// now call the JSP to render the new page
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
	}
}
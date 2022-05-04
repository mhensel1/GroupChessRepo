package edu.ycp.cs320.chess.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ycp.cs320.chess.controller.GameController;
import edu.ycp.cs320.chess.controller.StatsController;
import edu.ycp.cs320.chess.model.BoardSpace;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPiece;
import edu.ycp.cs320.chess.model.ChessPlayer;
import edu.ycp.cs320.chess.model.Rook;
import edu.ycp.cs320.gamesDB.model.Piece;
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
		
		req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("ChessGame Servlet: doPost");

		HttpSession session = req.getSession();
		ChessBoard board = new ChessBoard();
		// create ChessGameTest controller - controller does not persist between requests
		// must recreate it each time a Post comes in
		GameController controller = new GameController();
		//StatsController statController = new StatsController();
		
		// assign model reference to controller so that controller can access model
		//assign model reference to controller so that controller can access model
		controller.setBoardModel(board);
		
		if (req.getParameter("createGame") != null) {
		//controller.startGame();
		}
		System.out.println("Has selected a piece " + session.getAttribute("hasSelected"));
		String yn = (String) session.getAttribute("hasSelected");
		if(yn.equals("no")) {	
				if (req.getParameter("a8") != null) {
					controller.setstart(0, 0);
				}
				else if (req.getParameter("b8") != null) {
					controller.setstart(0, 1);
				}
				else if (req.getParameter("c8") != null) {
					controller.setstart(0, 2);
				}
				else if (req.getParameter("d8") != null) {
					controller.setstart(0, 3);
				}
				else if (req.getParameter("e8") != null) {
					controller.setstart(0, 4);
				}
				else if (req.getParameter("f8") != null) {
					controller.setstart(0, 5);
				}
				else if (req.getParameter("g8") != null) {
					controller.setstart(0, 6);
				}
				else if (req.getParameter("h8") != null) {
					controller.setstart(0, 7);
					
				}else if (req.getParameter("a7") != null) {
					controller.setstart(1, 0);
				}
				else if (req.getParameter("b7") != null) {
					controller.setstart(1, 1);
				}
				else if (req.getParameter("c7") != null) {
					controller.setstart(1, 2);
				}
				else if (req.getParameter("d7") != null) {
					controller.setstart(1, 3);
				}
				else if (req.getParameter("e7") != null) {
					controller.setstart(1, 4);
				}
				else if (req.getParameter("f7") != null) {
					controller.setstart(1, 5);
				}
				else if (req.getParameter("g7") != null) {
					controller.setstart(1, 6);
				}
				else if (req.getParameter("h7") != null) {
					controller.setstart(1, 7);
					
				}else if (req.getParameter("a6") != null) {
					controller.setstart(2, 0);
				}
				else if (req.getParameter("b6") != null) {
					controller.setstart(2, 1);
				}
				else if (req.getParameter("c6") != null) {
					controller.setstart(2, 2);
				}
				else if (req.getParameter("d6") != null) {
					controller.setstart(2, 3);
				}
				else if (req.getParameter("e6") != null) {
					controller.setstart(2, 4);
				}
				else if (req.getParameter("f6") != null) {
					controller.setstart(2, 5);
				}
				else if (req.getParameter("g6") != null) {
					controller.setstart(2, 6);
				}
				else if (req.getParameter("h6") != null) {
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
		}
		
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
		req.getRequestDispatcher("/_view/game.jsp").forward(req, resp);
	}
}
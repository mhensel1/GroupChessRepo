package edu.ycp.cs320.chess.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.controller.GameController;
import edu.ycp.cs320.chess.model.ChessBoard;
import edu.ycp.cs320.chess.model.ChessGame;
import edu.ycp.cs320.chess.model.ChessPlayer;
import edu.ycp.cs320.chess.model.King;

public class GameControllerTest {
	private ChessGame Gamemodel;
	private ChessBoard Boardmodel;
	private GameController controller;
	private ChessPlayer Whiteplayer;
	private ChessPlayer Blackplayer;
	private King king;
	
	@Before
	public void setUp() {
		Whiteplayer = new ChessPlayer();
		Blackplayer = new ChessPlayer();
		Boardmodel = new ChessBoard();
		controller = new GameController();
		controller.setGameModel(Gamemodel);
		controller.setBoardModel(Boardmodel);
	}

	@Test
	public void testCreateBoard() throws Exception {
		controller.createBoard();
		
		for(int i =0; i < 8; i++) {
			System.out.println("");
			System.out.print("Row " + i + " |");
			
			for(int j =0; j < 8; j++) {
				
					System.out.print(" " + Boardmodel.getSpace(i, j).getPiece() + "  |");
					
			}
		}
	}
	
	@Test
	public void testCanMove() throws Exception {
		controller.createBoard();
		//System.out.println(Boardmodel.getSpaces(1, 0).getPiece());
		assertEquals(true,controller.canMove(Boardmodel, Boardmodel.getSpace(1, 0), Boardmodel.getSpace(3, 0)));
		assertEquals(true,controller.canMove(Boardmodel, Boardmodel.getSpace(1, 5), Boardmodel.getSpace(2, 5)));
		assertEquals(true,controller.canMove(Boardmodel, Boardmodel.getSpace(1, 7), Boardmodel.getSpace(3, 7)));
		assertEquals(false,controller.canMove(Boardmodel, Boardmodel.getSpace(1, 0), Boardmodel.getSpace(1, 3)));
		assertEquals(false,controller.canMove(Boardmodel, Boardmodel.getSpace(1, 5), Boardmodel.getSpace(6, 5)));
		assertEquals(false,controller.canMove(Boardmodel, Boardmodel.getSpace(1, 7), Boardmodel.getSpace(0, 7)));
	}
	
	@Test
	public void testmakeMove() throws Exception {
		
		System.out.println("Controller Test make move");
		
		Boardmodel.createBoard();
		controller.Move(Boardmodel, Boardmodel.getSpace(1, 0), Boardmodel.getSpace(3, 0));
		for(int i =0; i < 8; i++) {
			System.out.println("");
			System.out.print("Row " + i + " |");
			
			for(int j =0; j < 8; j++) {
				
					System.out.print(" " + Boardmodel.getSpace(i, j).getPiece() + "  |");
			}
		}
	}
}

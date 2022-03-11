package edu.ycp.cs320.chess.controller;

import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.controller.GameController;
import edu.ycp.cs320.chess.model.ChessGame;

public class GuessingGameControllerTest {
	private ChessGame model;
	private GameController controller;
	
	@Before
	public void setUp() {
		model = new ChessGame();
		controller = new GameController();
		
		model.setMin(1);
		model.setMax(100);
		
		controller.setModel(model);
	}
	
	@Test
	public void testNumberIsGreater() {
		int currentGuess = model.getGuess();
		controller.setNumberIsGreaterThanGuess();
		assertTrue(model.getGuess() > currentGuess);
	}
}

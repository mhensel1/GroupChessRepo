package edu.ycp.cs320.chess.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.controller.GameController;
import edu.ycp.cs320.chess.model.ChessGame;

public class GameControllerTest {
	private ChessGame model;
	private GameController controller;
	
	@Before
	public void setUp() {
		model = new ChessGame();
		controller = new GameController();
		controller.setModel(model);
	}
	
}

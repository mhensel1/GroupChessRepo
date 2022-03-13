package edu.ycp.cs320.chess.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessGame;

public class ChessGameTest {
	private ChessGame model;
	
	@Before
	public void setUp() {
		model = new ChessGame();
	}
	
	@Test
	public void testSetTurnCounter() {
		model.setTurncounter(5);
		assertEquals(5, model.getTurncounter());
	}
	
	@Test
	public void testSetLobbyCode() {
		model.setLobbyCode("thecode");
		assertEquals("thecode", model.getLobbyCode());
	}
	
}

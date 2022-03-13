package edu.ycp.cs320.chess.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessPlayer;

public class ChessPlayerTest {
	private ChessPlayer model;
	
	@Before
	public void setUp() {
		model = new ChessPlayer();
	}
	
	@Test
	public void testSetPlayerColor() {
		model.setColor(true);
		assertEquals(true, model.getColor());
	}
	
}

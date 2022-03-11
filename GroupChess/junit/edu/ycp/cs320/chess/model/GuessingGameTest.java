package edu.ycp.cs320.chess.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessGame;

public class GuessingGameTest {
	private ChessGame model;
	
	@Before
	public void setUp() {
		model = new ChessGame();
	}
	
	@Test
	public void testSetMin() {
		model.setMin(1);
		assertEquals(1, model.getMin());
	}
	
	@Test
	public void testSetMax() {
		model.setMax(100);
		assertEquals(100, model.getMax());
	}
}

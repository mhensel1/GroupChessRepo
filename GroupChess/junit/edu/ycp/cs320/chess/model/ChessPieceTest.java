package edu.ycp.cs320.chess.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessPiece;

public class ChessPieceTest {
	private ChessPiece model;
	
	@Before
	public void setUp() {
		model = new ChessPiece();
	}
	
	@Test
	public void testSetposX() {
		model.setposX(0);
		assertEquals(0, model.getposX());
	}
	
	@Test
	public void testSetposY() {
		model.setposY(2);
		assertEquals(2, model.getposY());
	}
}

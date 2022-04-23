package edu.ycp.cs320.chess.model;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import edu.ycp.cs320.chess.model.ChessBoard;

public class ChessBoardTest {
	private ChessBoard model;
	
	@Before
	public void setUp() {
		model = new ChessBoard();
	}
	
	@Test
	public void testCreateBoard() {
		model.createBoard();
		/*assertTrue(model.getSpace(0, 0));
		assertTrue(model.getSpace(7, 7));
		assertTrue(model.getSpace(3, 3));*/
		
		/*
		assertEquals(true, model.getSpace(0, 0));
		assertEquals(true, model.getSpace(7, 7));
		assertEquals(true, model.getSpace(3, 1));
		
		assertEquals(false, model.getSpace(0, 7));
		assertEquals(false, model.getSpace(7, 0));
		assertEquals(false, model.getSpace(5, 2));
		*/
	}
	
	@Test
	public void testGetSpace() {
		model.createBoard();
		int x = 2;
		int y = 3;
		assertTrue(model.getSpace(x, y) != null);
		//assertEquals(0, model.getSpace(x, y));
		
		x = 0;
		y = 0;
		assertTrue(model.getSpace(x, y) != null);
		//assertEquals(1, model.getSpace(x, y));
	}
	
	/*
	@Test
	public void testSetX() {
		int x = 2;
		model.setX(x);
		assertEquals(2, model.getX());
	}
	
	@Test
	public void testSetY() {
		int y = 5;
		model.setY(y);
		assertEquals(5, model.getY());
	}
	
	@Test
	public void testGetX() {
		model.setX(3);
		assertEquals(3, model.getX());
	}
	
	@Test
	public void testGetY() {
		model.setY(3);
		assertEquals(3, model.getY());
	}
	*/
}